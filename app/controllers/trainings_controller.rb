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
      redirect_to training_path(@trainings)
    else
      render :new
    end
  end

  def show
    @training = Training.find(params[:id])
    @training_contents = TrainingContent.new
    @training_menu_contents = @training.training_contents
  end

  def destroy
    @trainings = Training.find(params[:id])
    @trainings.destroy
    redirect_to user_path(current_user)
  end

  private

  def training_params
    params.require(:training).permit(:start_time)
  end

end
