class AddCommentToBook < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :book, foreign_key: true
  end
end
