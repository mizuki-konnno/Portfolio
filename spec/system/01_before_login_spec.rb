require 'rails_helper'

describe 'ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it '指定の値のリンクが存在するか ログイン' do
        expect(page).to have_link "会員の方はこちらからログインしてください"
      end
      it '指定の値のリンクが存在するか Sign Up' do
        expect(page).to have_link "新規会員登録はこちらから"
      end
    end

    context 'リンクの内容を確認' do
      subject { current_path }

      it 'ログインボタンを押すと、ログイン画面に偏移する' do
        click_on '会員の方はこちらからログインしてください'
        is_expected.to eq new_user_session_path
      end
      it '新規会員登録ボタンを押すと、会員登録画面に遷移する' do
        click_on '新規会員登録はこちらから'
        is_expected.to eq new_user_registration_path
      end
    end
  end

  describe 'アバウト画面のテスト' do
    before do
      visit '/home/about'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/home/about'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしていない場合' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'タイトルが表示される' do
        expect(page).to have_content 'Pawer Rain'
      end
      it 'Homeリンクが表示される' do
        expect(page).to have_link "Home"
      end
      it 'Aboutリンクが表示される' do
        expect(page).to have_link "About"
      end
      it 'sign upリンクが表示される' do
        expect(page).to have_link "sign up"
      end
      it 'loginリンクが表示される' do
        expect(page).to have_link "login"
      end
    end

    context 'リンクの内容を確認' do
      subject { current_path }

      it 'Homeを押すと、トップ画面に遷移する' do
        click_on 'Home'
        is_expected.to eq '/'
      end
      it 'Aboutを押すと、アバウト画面に遷移する' do
        click_on 'About'
        is_expected.to eq '/home/about'
      end
      it 'sign upを押すと、新規登録画面に遷移する' do
        click_on 'sign up'
        is_expected.to eq '/users/sign_up'
      end
      it 'loginを押すと、ログイン画面に遷移する' do
        click_on 'login'
        is_expected.to eq '/users/sign_in'
      end
    end
  end

  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it '「Sign up」と表示される' do
        expect(page).to have_content 'Sign up'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it 'Sign upボタンが表示される' do
        expect(page).to have_button 'Sign up'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button 'Sign up' }.to change(User.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、about画面になっている' do
        click_button 'Sign up'
        expect(current_path).to eq '/home/about'
      end
    end
  end

  describe 'ユーザログイン' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
      it '「Log in」と表示される' do
        expect(page).to have_content 'Log in'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'Log inボタンが表示される' do
        expect(page).to have_button 'Log in'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
      end

      it 'ログイン後のリダイレクト先が、会員homeページになっている。' do
        expect(current_path).to eq '/home/home'
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'Log in'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
    end

    context 'ヘッダーの表示を確認' do
      it 'Homeリンクが表示される' do
       expect(page).to have_link "Home"
      end
      it 'MyPageリンクが表示される' do
       expect(page).to have_link "MyPage"
      end
      it 'Timerリンクが表示される' do
       expect(page).to have_link "Timer"
      end
      it 'log outリンクが表示される' do
        expect(page).to have_link "logout"
      end
    end
  end

  describe 'ユーザログアウトのテスト' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
      click_link "logout"
    end

    context 'ログアウト機能のテスト' do
      it '正しくログアウトできている: ログアウト後のリダイレクト先においてログアウトリンクが存在しない' do
        expect(page).not_to have_link nil, href: destroy_user_session_path
      end
      it 'ログアウト後のリダイレクト先が、トップになっている' do
        expect(current_path).to eq '/'
      end
    end
  end
end
