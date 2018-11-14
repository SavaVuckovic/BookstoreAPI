class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :books, :destroy]

  # GET /categories
  def index
    @categories = Category.order(updated_at: :desc)

    render json: @categories
  end

  # GET /categories/1
  def show
    render json: @category
  end

  # GET /categories/1/books
  def books
    render json: @category.books
  end

  # POST /categories
  def create
    @category = Category.new(params.require(:category).permit(:name))

    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end
end
