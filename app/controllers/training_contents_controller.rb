class TrainingContentsController < ApplicationController

  def new
    @training_contents = TrainingContent.new

  end

  def create
    @training_contents = TrainingContent.new(training_content_params)
    @training_contents.save
    redirect_to request.referer
  end

  def destroy
    @training_menu_contents = TrainingContent.find(params[:id])
    @training_menu_contents.destroy
    redirect_to request.referer
  end

  private

  def training_content_params
    params.require(:training_content).permit(:training_id, :menu_id, :set, :weight, :rep)
  end

end
