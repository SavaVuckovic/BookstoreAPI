class AddCategoryNameToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :category_name, :string
  end
end
