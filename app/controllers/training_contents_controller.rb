class TrainingContentsController < ApplicationController

  def new
    @training_content = TrainingContent.new

  end

  def create
    # 非同期通信化
    # @training = Training.find(params[:id])
    # @training_menu_contents = @training.training_contents

    @training_content = TrainingContent.new(training_content_params)
    if @training_content.save
     redirect_to request.referer
    else
      render 'new'
    end
  end

  def destroy
    @training_menu_contents = TrainingContent.find(params[:id])
    if @training_menu_contents.destroy
     redirect_to request.referer
    end
  end

  private

  def training_content_params
    params.require(:training_content).permit(:training_id, :menu_id, :set, :weight, :rep)
  end

end
