# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    # テスト対象の記述を1箇所にまとめる
    subject { user.valid? }

    let(:user) { build(:user) }

    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        is_expected.to eq false
      end
      it '2文字以上であること: 1文字はNG' do
        user.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '2文字以上であること: 2文字はOK' do
        user.name = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '20文字以下であること: 20文字はOK' do
        user.name = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
      it '20文字以下であること: 21文字はNG' do
        user.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end

    context 'emailカラム' do
      it '空欄でないこと' do
        user.email = ''
        is_expected.to eq false
      end
    end
  end

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
