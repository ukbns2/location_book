class User < ApplicationRecord
  has_many :posts
  has_many :comments, dependent: :destroy

  # 退会済みのユーザーが同じアカウントでログインできないように制約
  def active_for_authentication?
    super && (is_deleted == false)
  end

  validates :name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
