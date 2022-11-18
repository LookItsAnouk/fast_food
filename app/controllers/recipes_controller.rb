class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]
  # GET /recipes
  def index
    @recipes = Recipe.all
    @review = Review.new
  end

  # GET /recipes/1
  def show
    @review = Review.new
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to recipe_url(@recipe), notice: "Recipe was successfully created." 
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if can? :crud, @recipe
      if @recipe.update(recipe_params)
        redirect_to recipe_url(@recipe), notice: "Recipe was successfully updated." 
      else
        render :edit, status: :unprocessable_entity 
      end
    else
      redirect_to recipe_url(@recipe), notice: "Not Authorized to edit recipe" 
    end
  end

  # DELETE /recipes/1
  def destroy
    if can? :destroy, @recipe
      @recipe.destroy
        redirect_to recipes_url, notice: "Recipe was successfully destroyed." 
    else
        redirect_to recipe_url(@recipe), notice: "Not authorized to delete this recipe." 
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:title, :description, :ingredients)
  end
end
