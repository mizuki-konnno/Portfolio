# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'training_contentモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'trainingモデルとの関係' do
      it 'N:1となっている' do
        expect(TrainingContent.reflect_on_association(:training).macro).to eq :belongs_to
      end
    end

    context 'menuモデルとの関係' do
      it 'N:1となっている' do
        expect(TrainingContent.reflect_on_association(:menu).macro).to eq :belongs_to
      end
    end
  end
end