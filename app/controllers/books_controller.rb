class BooksController < ApplicationController
  before_action :set_book, only: [:show, :comments, :update, :destroy]

  # GET /books
  def index
    @books = Book.all

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # GET /books/1/comments
  def comments
    render json: @book.comments
  end

  # POST /books
  def create
    @book = Book.new(params.require(:book).permit(:title, :author, :complete))
    @book.category = Category.find_by(name: params[:category])
    @book.category_name = params[:category]

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    @book.category = Category.find_by(name: params[:category_name])
    if @book.update(params.require(:book).permit(:title, :author, :complete, :category_name))
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end
end
