class ReviewsController < ApplicationController
    before_action :set_review, only: %i[ show edit update destroy ]
    before_action :authenticate_user!, except: [:index, :show]
    before_action :authorize_user!, only:[:edit, :update, :destroy]

    def index
        @reviews = Review.all
      end
    
      # GET /orders/1 
      def show
      end
    
      # GET /orders/new
      def new
        @review = Review.new
      end
    
      # GET /orders/1/edit
      def edit
      end
    
      # POST /orders
      def create
        @review = Review.new(review_params)
        if @review.save
          redirect_to order_url(@review), notice: "review was successfully created." 
    
        else
          render :new, status: :unprocessable_entity 
        end
      end
    
      # PATCH/PUT /orders/1
      def update
        if @review.update(review_params)
        redirect_to review_url(@review), notice: "review was successfully updated." 
        
        else
          render :edit, status: :unprocessable_entity 
        end
      end

    def accept
        @review.update_attribute(:pending?, false)
        @review.update_attribute(:approved?, true)
        redirect_to admin_path,  notice: "Review was Approved."
    end
  
    def decline
      @review.update_attribute(:pending?, false)
      @review.update_attribute(:approved?, false)
      redirect_to admin_path,  notice: "Review was denied."
    end
  

private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:title, :body)
    end
   
    def authorize_user!
      redirect_to root_path, alert: "Not authorized!" unless can?(:crud, @review)
    end
end
