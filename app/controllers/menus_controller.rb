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
    @menu = Menu.find(params[:id])
    @menu.destroy
    flash[:danger] = 'トレーニングメニューを削除しました。'
    redirect_to user_path(current_user)
  end

  private

  def menu_params
    params.require(:menu).permit(:training_menu)
  end
end
