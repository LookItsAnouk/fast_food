class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user!, only:[:edit, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1 
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_url(@order), notice: "Order was successfully created." 

    else
      render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
    redirect_to order_url(@order), notice: "Order was successfully updated." 
    
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
       redirect_to orders_url, notice: "Order was successfully destroyed." 
  end

  def approve
      @order.update_attribute(:pending?, false)
      @order.update_attribute(:approved?, true)
      redirect_to admin_path,  notice: "Order was Approved."
  end

  def deny
    @order.update_attribute(:pending?, false)
    @order.update_attribute(:approved?, false)
    redirect_to admin_path,  notice: "Order was denied."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:payment_type, :delivery_type, :delivery_date)
    end

    def authorize_user!
      redirect_to root_path, alert: "Not authorized!" unless can?(:crud, @order)
    end

   
end
