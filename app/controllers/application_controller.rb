class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ログインしていないとabout以外のページを閲覧できない
  before_action :authenticate_user!, except: [:top, :about]

  protected

  def after_sign_in_path_for(resource)
    home_home_path
  end

  def after_sign_out_path_for(resource)
    flash[:danger] = 'ログアウトしました。'
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end
end
