class Training < ApplicationRecord
  belongs_to :user
  has_many :training_contents, dependent: :destroy

  # １日1件のみトレーニングを登録（同じ日の重複の作成を防ぐため）
  validate :date_scope

  def date_scope
   # DATEとTimeで比べる場合９時間の差が出るため調整
   time_now = Time.zone.now
   japan_now = time_now - 32400
   if Training.where("user_id = ? AND DATE(start_time) = DATE(?)", self.user_id, japan_now).all.any?
      errors.add(:user_id, "既にトレーニング開始済みの為、カレンダーより日にちを選択して下さい")
   end
  end
end