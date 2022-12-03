class Post < ApplicationRecord
  belongs_to :user
  has_many :book_tags
  has_many :tags, through: :book_tags
end
