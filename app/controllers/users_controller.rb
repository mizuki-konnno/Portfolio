class UsersController < ApplicationController
  # editページに直打ち禁止
  before_action :correct_user, only: [:edit]

  def index
    # gem kaminari ページネーション機能
    @users = User.page(params[:page]).per(8)
    # パラメータとして名前か性別を受け取っている場合は絞って検索する
    if params[:name].present?
      @users = @users.get_by_name params[:name]
      # 検索内容の表示
      @search = params[:name]
    end
    if params[:gender].present?
      @users = @users.get_by_gender params[:gender]
      # 検索内容の表示
      @search = params[:gender]
        if @search == 0.to_s
          @search_gender = "男性"
        else
          @search_gender = "女性"
        end
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

  def correct_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email, :gender, :height, :body_weight)
  end
end
