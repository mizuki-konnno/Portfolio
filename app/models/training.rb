class Training < ApplicationRecord
  belongs_to :user
  has_many :training_contents, dependent: :destroy

   # １日1件のみトレーニングを登録（同じ日の重複の作成を防ぐため）
   validate :date_scope

   def date_scope
    if Training.where("user_id = ? AND DATE(created_at) = DATE(?)", self.user_id, Time.now).all.any?
       errors.add(:user_id, "既に開始済みの為、カレンダーより日にちを選択して下さい")
    end
   end
end