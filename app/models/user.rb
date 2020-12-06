class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, :email, presence: true

  has_many :posts

  has_one_attached :profile_picture, dependent: :destroy
    validates :profile_picture, content_type: [:png, :jpg, :jpeg]
end
