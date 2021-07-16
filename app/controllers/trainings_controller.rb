class TrainingsController < ApplicationController
  def index
    @trainings = Training.all
  end

  def new
    @trainings = Training.new
  end

  def create
    @trainings = Training.new(training_params)
    @trainings.user_id = current_user.id
    if @trainings.save
      flash[:success] = 'トレーニングを開始しました。'
      redirect_to training_path(@trainings)
    else
      render :new
    end
  end

  def show
    @training = Training.find(params[:id])
    @training_content = TrainingContent.new
    @training_menu_contents = @training.training_contents
    @user = current_user
    @menu = @user.menus
  end

  private

  def training_params
    params.require(:training).permit(:start_time, :body_weight, :body_fat)
  end
end
