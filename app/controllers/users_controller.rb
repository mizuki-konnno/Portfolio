class UsersController < ApplicationController

  def index
    # gem kaminari ページネーション機能
    @users = User.page(params[:page]).per(10)
    # パラメータとして名前か性別を受け取っている場合は絞って検索する
    if params[:name].present?
       @users = @users.get_by_name params[:name]
    end
    if params[:gender].present?
       @users = @users.get_by_gender params[:gender]
    end
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
     if @user.update(user_params)
     flash[:success] = 'マイページの登録内容を更新しました。'
     redirect_to user_path(@user.id)
     else
     flash.now[:danger] = 'マイページの登録に失敗しました。'
     render :edit
     end
  end



 private

def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email, :gender, :height, :body_weight)
end
end