class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true



  #フォロー・フォロワー機能のリレーション
  # 自分がフォローされる側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分がフォローする側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 被フォロー関係から自分がフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 与フォロー関係から自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed

  # アソシエーション
  has_many :trainings, dependent: :destroy
  has_many :user_dates, dependent: :destroy
  has_many :menus, dependent: :destroy
  # 性別
  enum gender: {男性: 0, 女性: 1}
  # 画像追加用のメソッド
  attachment :profile_image

  # createメソッドはnewとsaveを合わせた挙動
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  # テーブルには対応するレコードが１つしかない為、find_byによって１レコードを特定し削除
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  # include?は配列に引数が含まれているかで「true」「false」を返す
  # ビューでフォローする/フォローを外すボタンで使用
  def following?(user)
    followings.include?(user)
  end

  # 検索機能
  # scopeを使うことでModelを呼ぶ際、どこからでも使える
  #ユーザー名による絞り込み
  scope :get_by_name, ->(name) {
  where("name like ?", "%#{name}%")
  }
  #性別による絞り込み
  scope :get_by_gender, ->(gender) {
  where(gender: gender)
  }

end

