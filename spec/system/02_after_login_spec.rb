require 'rails_helper'

describe 'ユーザログイン後のテスト' do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:training) { create(:training, user: user) }
  let!(:other_training) { create(:training, user: other_user) }
  let!(:menu) { create(:menu, user: user) }
  let!(:other_menus) { create(:menu, user: other_user) }
  # let!(:training_content) { create(:training_content, user: user) }
  # let!(:other_training_content) { create(:training_content, user: other_user) }

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
        click_on "Home"
        is_expected.to eq "/home/home"
      end
      it "MyPageを押すと、会員詳細ページに遷移する" do
        click_on "MyPage"
        is_expected.to eq "/users/" + user.id.to_s
      end
      it 'Timerを押すと、タイマー画面に遷移する' do
        click_on "Timer!"
        is_expected.to eq "/home/timer"
      end
    end
  end

  describe '会員ページ画面のテスト' do
    before do
      visit home_home_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
      expect(current_path).to eq '/home/home'
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
        expect(page).to have_link , href: user_path(user)
      end
      it 'トレーニング開始のリンクが存在するか' do
        expect(page).to have_link "トレーニング開始"
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
      it "他人の性別が表示される" do
        expect(page).to have_content other_user.gender
      end
      it "他人のフォロー数が表示される" do
        expect(page).to have_content other_user.followings.size
      end
      it "他人のフォロワー数が表示される" do
        expect(page).to have_content other_user.followers.size
      end
    end
  end

 describe "会員詳細画面のテスト" do
    before do
      visit user_path(other_user)
    end

    context "表示内容の確認" do
      it "会員詳細画面のURLが正しい" do
        expect(current_path).to eq "/users/" + other_user.id.to_s
      end
      it "他人の名前が表示される" do
        expect(page).to have_content other_user.name
      end
      it "他人の性別が表示される" do
        expect(page).to have_content other_user.gender
      end
      it "他人の自己紹介文が表示される" do
        expect(page).to have_content other_user.introduction
      end
      it "他人のフォロー数が表示される" do
        expect(page).to have_content other_user.followings.size
      end
      it "他人のフォロワー数が表示される" do
        expect(page).to have_content other_user.followers.size
      end
      it "フォローリンクが存在するか" do
        expect(page).to have_link "フォローする" or "フォローを外す"
      end
      it "他人の身長が表示される" do
        expect(page).to have_content other_user.height
      end
      it "他人の体重が表示される" do
        expect(page).to have_content other_user.body_weight
      end
      it "性別が存在するか" do
        expect(page).to have_content other_user.gender
      end
      it "性別が存在するか" do
        expect(page).to have_content other_user.gender
      end
      it "自己紹介文が存在するか" do
        expect(page).to have_content other_user.introduction
      end
      it "トレーニングメニューの登録のリンクが存在するか" do
        expect(page).to have_link "トレーニングメニューの登録"
      end
    end
  end

   describe "マイページのテスト" do
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
      it "自分の身長が表示される" do
        expect(page).to have_content user.height
      end
      it "自分の体重が表示される" do
        expect(page).to have_content user.body_weight
      end
      it "性別が存在するか" do
        expect(page).to have_content user.gender
      end
      it "自己紹介文が存在するか" do
        expect(page).to have_content user.introduction
      end
      it "情報入力リンクが存在するか" do
        expect(page).to have_link "情報入力"
      end
      it "トレーニングメニューの登録のリンクが存在するか" do
        expect(page).to have_link "トレーニングメニューの登録"
      end
     end
    end

  describe "トレーニング開始画面のテスト" do
    context "トレーニング開始画面" do
      before do
        visit home_home_path
        click_on "トレーニング開始"
        visit new_training_path
      end

      it "URLが正しい" do
        expect(current_path).to eq "/trainings/new"
      end
      it "体重フォームが表示される" do
        expect(page).to have_field "training[body_weight]"
      end
      it "体脂肪率フォームが表示される" do
        expect(page).to have_field "training[body_fat]"
      end
      it "登録ボタンが表示される" do
        expect(page).to have_button "Create trainig"
      end
    end

    context "トレーニング開始のテスト" do
      before do
        visit home_home_path
        click_on "トレーニング開始"
        visit new_training_path
        fill_in "training[body_weight]", with: Faker::Lorem.characters(number: 1)
        fill_in "training[body_fat]", with: Faker::Lorem.characters(number: 1)
        click_on "Create trainig"
      end

      it "作成完了のメッセージが表示される" do
        expect(page).to have_content "トレーニングを開始しました。"
      end
      it "作成後にトレーニング内容画面に遷移する" do
        expect(current_path).to eq "/trainings/"  + Training.last.id.to_s
      end
    end
  end

  describe "トレーニング内容画面のテスト" do
    context "トレーニング内容画面" do
      before do
        visit training_path(training)
      end

      it "URLが正しい" do
        expect(current_path).to eq '/trainings/' + training.id.to_s
      end
      it "日付が表示される" do
        expect(page).to have_content training.start_time.strftime("%Y-%m-%d")
      end
      it "時間が表示される" do
        expect(page).to have_content training.start_time.strftime("%H:%M")
      end
      it "「トレーニング入力」と表示される" do
        expect(page).to have_content "トレーニング入力"
      end
      it "トレーニングメニューの登録のリンクが存在するか" do
        expect(page).to have_link "トレーニングメニューの登録"
      end
      it "トレーニング入力フォームが表示される メニュー" do
        expect(page).to have_field "training_content[menu_id]"
      end
      it "トレーニング入力フォームが表示される weight" do
        expect(page).to have_field "training_content[weight]"
      end
      it "トレーニング入力フォームが表示される 回数" do
        expect(page).to have_field "training_content[rep]"
      end
      it "トレーニング入力フォームが表示される set数" do
        expect(page).to have_field "training_content[set]"
      end
      it "登録ボタンが表示される" do
        expect(page).to have_button "登録"
      end
    end

    context "トレーニング内容入力のテスト" do
      before do
        visit training_path(training)
        fill_in "training_content[menu_id]", with: Faker::Lorem.characters(number: 1)
        fill_in "training_content[weight]", with: Faker::Lorem.characters(number: 1)
        fill_in "training_content[rep]", with: Faker::Lorem.characters(number: 1)
        fill_in "training_content[set]", with: Faker::Lorem.characters(number: 1)
        click_on "登録"
      end

      it "入力後にトレーニング内容画面に遷移する" do
        expect(current_path).to eq "/trainings/"  + Training.last.id.to_s
      end
    end
  end

    describe "トレーニングメニュー登録画面のテスト" do
    context "トレーニングメニュー登録画面" do
      before do
        visit user_path(user)
        click_on "トレーニングメニューの登録"
        visit new_menu_path
      end

      it "URLが正しい" do
        expect(current_path).to eq "/menus/new"
      end
      it "体重フォームが表示される" do
        expect(page).to have_field "menu[training_menu]"
      end
      it "登録ボタンが表示される" do
        expect(page).to have_button "Create menu"
      end
    end

    context "トレーニングメニュー登録のテスト" do
      before do
        visit user_path(user)
        click_on "トレーニングメニューの登録"
        visit new_menu_path
        fill_in "menu[training_menu]", with: Faker::Lorem.characters(number: 5)
        click_on "Create menu"
      end

      it "作成完了のメッセージが表示される" do
        expect(page).to have_content "トレーニングメニューの登録に成功しました。"
      end
      it "作成後にトレーニング内容画面に遷移する" do
        expect(current_path).to eq "/users/"  + user.id.to_s
      end
    end
  end

  describe "検索のテスト" do
    context "会員で検索した時の表示確認" do
      before do
        visit users_path
        fill_in 'name', with: user.name
        click_on "検索"
      end

      it "検索したワードが表示される" do
        expect(page).to have_content "「#{user.name}」の検索結果"
      end
      it "会員の画像のリンク先が正しい" do
        expect(page).to have_link "", href: user_path(user)
      end
      it "会員の名前が表示される" do
        expect(page).to have_content user.name
      end
      it "会員の性別が表示される" do
        expect(page).to have_content user.gender
      end
      it "会員のフォロー数が表示される" do
        expect(page).to have_content user.followings.size
      end
      it "会員のフォロワー数が表示される" do
        expect(page).to have_content user.followers.size
      end
    end

    context "性別で検索した時の表示確認" do
      before do
        visit users_path
        select(value = "男性", from: "gender")
        click_on "検索"
      end

      it "検索したワードが表示される" do
        expect(page).to have_content "「男性」の検索結果"
      end
     it "会員の画像のリンク先が正しい" do
        expect(page).to have_link "", href: user_path(other_user)
      end
      it "会員の名前が表示される" do
        expect(page).to have_content other_user.name
      end
      it "会員の性別が表示される" do
        expect(page).to have_content other_user.gender
      end
      it "会員のフォロー数が表示される" do
        expect(page).to have_content other_user.followings.size
      end
      it "会員のフォロワー数が表示される" do
        expect(page).to have_content other_user.followers.size
      end
    end
  end
end