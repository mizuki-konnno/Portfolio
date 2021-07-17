require 'rails_helper'

describe 'ユーザログイン後のテスト' do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  # let!(:training) { create(:training, user: user) }
  # let!(:training_contents) { create(:training_contents, user: user,training: training) }

  before do
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    context 'リンクの内容を確認: ※logoutは『ユーザログアウトのテスト』でテスト済みになります。' do
      subject { current_path }

      it 'Homeを押すと、会員ページ画面に遷移する' do
        click_on "ホーム"
        is_expected.to eq "home/home"
      end
      it "MyPageを押すと、会員詳細ページに遷移する" do
        click_on "MyPage"
        is_expected.to eq "/users/" + user.id.to_s
      end
      it 'Timerを押すと、タイマー画面に遷移する' do
        click_on "Timer"
        is_expected.to eq "home/timer"
      end
    end
  end

  describe '会員ページ画面のテスト' do
    before do
      visit home_home_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq 'home/home'
      end
      it 'My Detaリンクが存在するか' do
        expect(page).to have_link , href: home_date_path
      end
      it 'Timerリンクが存在するか' do
        expect(page).to have_link , href: home_timer_path
      end
      it 'Other Usersリンクが存在するか' do
        expect(page).to have_link , href: users_path
      end
      it 'My Pageリンクが存在するか' do
        expect(page).to have_link , href: user_path
      end
    end
  end

   describe "Other Users画面のテスト" do
    before do
      visit users_path
    end

    context "表示内容の確認" do
      it "「Other User」と表示される" do
        expect(page).to have_content "Other User"
      end
      it "会員一覧画面のURLが正しい" do
        expect(current_path).to eq "/users"
      end
      it "他人の画像のリンク先が正しい" do
        expect(page).to have_link "", href: user_path(other_user)
      end
      it "他人の名前が表示される" do
        expect(page).to have_content other_user.name
      end
      it "他人のフォロー数が表示される" do
        expect(page).to have_content other_user.following_users.size
      end
      it "他人のフォロワー数が表示される" do
        expect(page).to have_content other_user.follower_users.size
      end
    end
  end

   describe "会員詳細画面のテスト" do
    before do
      visit user_path(user)
    end

    context "表示内容の確認" do
      it "会員詳細画面のURLが正しい" do
        expect(current_path).to eq "/users/" + user.id.to_s
      end
      it "自分の名前が表示される" do
        expect(page).to have_content user.name
      end
      it "自分の自己紹介文が表示される" do
        expect(page).to have_content user.introduction
      end
      it "自分のメールアドレスが表示される" do
        expect(page).to have_content user.email
        end
      end
      it "自分の身長が表示される" do
        expect(page).to have_content user.height
      end
      it "自分の体重が表示される" do
        expect(page).to have_content user.body_weight
      end
      it "性別が存在するか" do
        expect(page).to have_content user.gender
      end
    end
  end