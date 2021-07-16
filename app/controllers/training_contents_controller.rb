class TrainingContentsController < ApplicationController
  def new
    @training_content = TrainingContent.new
  end

  def create
    # 非同期通信化
    @training = Training.find(params[:training_id])
    @training_menu_contents = @training.training_contents

    @training_content = TrainingContent.new(training_content_params)
    if @training_content.save
    # 非同期通信のためコメントアウト
    # redirect_to request.referer
    else
      render 'new'
    end
  end

  def destroy
    # 非同期通信化
    @training = Training.find(params[:training_id])
    @training_menu_contents = @training.training_contents

    @training_menu_content = TrainingContent.find(params[:id])
    if @training_menu_content.destroy
      # 非同期通信のためコメントアウト
      # redirect_to request.referer
    end
  end

  private

  def training_content_params
    params.require(:training_content).permit(:training_id, :menu_id, :set, :weight, :rep)
  end
end
