class Menu < ApplicationRecord
  belongs_to :user
  has_many :training_contents, dependent: :destroy
end
