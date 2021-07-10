class RelationshipsController < ApplicationController
  # コントローラーに設定して、ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    # 遷移元のURLを取得してリダイレクト
    # redirect_to request.referer
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
    # 遷移元のURLを取得してリダイレクト
    # redirect_to request.referer
  end

  # 一覧を表示させるために使用（userとネストしているためparams[:user_id]を使用可能）
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
