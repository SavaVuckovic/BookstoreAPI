class CommentsController < ApplicationController
  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.book = Book.find_by(id: params[:book_id])

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:author, :text)
    end
end
