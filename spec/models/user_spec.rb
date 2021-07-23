# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'trainingモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:trainings).macro).to eq :has_many
      end
    end

    context 'menuモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:menus).macro).to eq :has_many
      end
    end

    context 'trainingモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:trainings).macro).to eq :has_many
      end
    end

        context 'フォローモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:relationships).macro).to eq :has_many
      end
    end
    context 'フォロワーモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:reverse_of_relationships).macro).to eq :has_many
      end
    end
    context 'ユーザーモデル(フォローする側）との関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:followings).macro).to eq :has_many
      end
    end
    context 'ユーザーモデル(フォローされる側）との関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:followers).macro).to eq :has_many
      end
    end
  end
end