require "rails_helper"

describe " ユーザログイン後のリクエストテスト", type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:training) { create(:training, user: user) }
  let!(:other_training) { create(:training, user: other_user) }
  let!(:menu) { create(:menu, user: user) }
  let!(:other_menus) { create(:menu, user: other_user) }

  describe "Homes" do
    context "GET /" do
      it "トップページの表示が取得できること" do
        get root_path # HTTPリクエストの送信
        expect(response).to have_http_status(200) # HTTPレスポンスのステータスコードが200
        # puts response.body #ログでhtmlの情報出力したい時
      end
    end

    context "GET /home/home" do
      it "会員ページの表示が取得できること" do
        sign_in user
        get home_home_path
        expect(response).to have_http_status(200)
      end
    end

    context "GET /home/date" do
      it "データページの表示が取得できること" do
        sign_in user
        get home_date_path
        expect(response).to have_http_status(200)
      end
    end

    context "GET /home/timer" do
      it "タイマーページの表示が取得できること" do
        sign_in user
        get home_timer_path
        expect(response).to have_http_status(200)
      end
    end

    context "GET /home/about" do
      it "アバウトページの表示が取得できること" do
        sign_in user
        get home_about_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "Menus" do
    before do
      sign_in user
      @menu = create(:menu)
    end

    context "GET /menus/new" do
      it "メニューの登録の表示が取得できること" do
        get new_menu_path(@menu)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "trainings" do
    before do
      sign_in user
      @trainig = create(:training)
    end

    context "GET /trainings/new" do
      it "トレーニング開始の画面の表示が取得できること" do
        get new_training_path(@trainig)
        expect(response).to have_http_status(200)
      end
    end

    context "GET /trainigs/:id" do
      it "トレーニング内容の表示" do
        get training_path(training)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "Users" do
    before do
      sign_in user
    end

    context "GET /users" do
      it "会員一覧ページの表示が取得できること" do
        get users_path
        expect(response).to have_http_status(200)
      end
    end

    context "GET /users/:id" do
      it "ユーザープロフィールの表示" do
        get users_path(user)
        expect(response).to have_http_status(200)
      end
    end

    context "GET /users/:id/edit" do
      it "ユーザー編集画面の表示" do
        get edit_user_path(user)
        expect(response).to have_http_status(200)
      end
    end

    context "GET /users/:user_id/followings" do
      it "ユーザーのフォロー中一覧表示" do
        get user_follwings_path(user)
        expect(response).to have_http_status(200)
      end
    end

    context " /users/:user_id/followers" do
      it "ユーザーのフォロー 一覧表示" do
        get user_follwers_path(user)
        expect(response).to have_http_status(200)
      end
    end
  end
end
