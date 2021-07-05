class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #フォロー・フォロワー機能のリレーション
  # 自分がフォローされる側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分がフォローする側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 被フォロー関係から自分がフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 与フォロー関係から自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed


  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  def following?(user)
    followings.include?(user)
  end

  # アソシエーション
  has_many :trainings, dependent: :destroy
  has_many :user_dates, dependent: :destroy
  has_many :menu, dependent: :destroy
  # 性別
  enum gender: {男性: 0, 女性: 1}
end

