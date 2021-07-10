class UsersController < ApplicationController

  def index
    # gem kaminari ページネーション機能
    @users = User.page(params[:page]).per(10)
  
  end

  def show
    @user = User.find(params[:id])
    # ユーザidに紐付いているmenuを入れる
    @menus = @user.menus
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
     @user.update(user_params)
     redirect_to user_path(@user.id)
  end

end



 private

def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email, :gender, :height, :body_weight)
end