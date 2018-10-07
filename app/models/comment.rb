class Comment < ApplicationRecord
  validates :author, presence: true
  validates :text, presence: true
  
  belongs_to :book
end
