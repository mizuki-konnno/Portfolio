class Menu < ApplicationRecord
  has_many :training_contents, dependent: :destroy
end
