# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'menuモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { menu.valid? }

    let(:user) { create(:user) }
    let!(:menu) { build(:menu, user_id: user.id) }

    context 'training_menuカラム' do
      it '空欄でないこと' do
        menu.training_menu = ''
        is_expected.to eq false
      end
    end
  end


  describe 'アソシエーションのテスト' do
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Menu.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'training_contentsモデルとの関係' do
      it '1:Nとなっている' do
        expect(Menu.reflect_on_association(:training_contents).macro).to eq :has_many
      end
    end
  end
end