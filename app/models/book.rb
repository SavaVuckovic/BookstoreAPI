class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :complete, presence: true
  validates :category_name, presence: true

  belongs_to :category
  has_many :comments, dependent: :destroy
end
