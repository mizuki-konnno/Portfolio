class Training < ApplicationRecord
  belongs_to :user
  has_many :training_contents, dependent: :destroy
  # 同じ日に重複作成できない為のバリデーション
  validate :once_a_day

 def once_a_day
  # 条件にマッチするレコードがあるか判定
  if Training.exists?(created_at: Time.zone.now.all_day)
   errors.add(:training, 'は作成済みです。カレンダーの日付から移動して下さい')
  end
 end
end
