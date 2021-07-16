class ApplicationController < ActionController::Base
  # ログインしていないとabout以外のページを閲覧できない
  before_action :authenticate_user!, except: [:top,:about]
  # 直打ちの禁止
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    flash[:success] = 'ログインしました。'
    home_home_path
  end

  def after_sign_up_path_for(resource)
    flash[:success] = 'ご登録ありがとうございます。'
    home_about_path
  end

  def after_sign_out_path_for(resource)
    flash[:danger] = 'ログアウトしました。'
    home_about_path
  end
end
