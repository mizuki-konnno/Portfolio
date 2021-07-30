# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'trainingモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Training.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'training_contentsモデルとの関係' do
      it '1:Nとなっている' do
        expect(Training.reflect_on_association(:training_contents).macro).to eq :has_many
      end
    end
  end
end
