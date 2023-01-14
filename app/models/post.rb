class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  with_options presence: true, on: :publicize do
    validates :title
    validates :body
    validates :postal_code
    validates :address
    validates :rate
  end

  validates :title, presence: true
  validates :body, presence: true
  validates :rate, presence: true
  validates :tag_ids, presence: true


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


end
