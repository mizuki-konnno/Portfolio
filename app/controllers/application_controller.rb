class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except:[:about]

  def after_sign_in_path_for(resource)
    flash[:success] = 'ログインしました。'
    root_path
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
