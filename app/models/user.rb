class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, :email, presence: true
  
  has_many :friend_requests_as_requestor, foreign_key: :requestor_id, class_name: :FriendRequest
  has_many :friend_requests_as_receiver, foreign_key: :receiver_id, class_name: :FriendRequest

  has_many :friendships, ->(user) { where("friend_a_id = ? OR friend_b_id = ?", user.id, user.id) }
  has_many :friends, through: :friendships
  # scope :friends , -> (user) { joins(:friendships).where("friend_a_id = ? OR friend_b_id = ?", user.id) }

  has_many :posts

  has_one_attached :profile_picture, dependent: :destroy
    validates :profile_picture, content_type: [:png, :jpg, :jpeg]
end
