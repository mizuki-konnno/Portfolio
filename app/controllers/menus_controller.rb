class MenusController < ApplicationController

  def new
    @menu = Menu.new
  end



  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id
    @menu.save
    redirect_to user_path(current_user)
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to user_path(current_user)
  end

  private

  def menu_params
    params.require(:menu).permit(:training_menu)
  end

end
