class RegistrationsController < Devise::RegistrationsController

def after_sign_up_path_for(resource)
    flash[:success] = 'ご登録ありがとうございます。'
    home_about_path
end

end
