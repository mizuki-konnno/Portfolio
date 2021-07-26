class MenusController < ApplicationController
  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id
    if @menu.save
      flash[:success] = 'トレーニングメニューの登録に成功しました。'
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = 'トレーニングメニューの登録に失敗しました。'
      render :new
    end
  end

  def destroy
    # 非同期通信のため記述
    @menus = current_user.menus

    @menu = Menu.find(params[:id])
    @menu.destroy
    # 非同期通信のため削除
    # redirect_to user_path(current_user)
  end

  private

  def menu_params
    params.require(:menu).permit(:training_menu)
  end
end
