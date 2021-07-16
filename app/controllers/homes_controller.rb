class HomesController < ApplicationController
  def top
  end

  def about
  end

  def timer
  end

  def date
    @user_traings = current_user.trainings
    @user_traings_fast = @user_traings.first
    @user_traings_last = @user_traings.last
  end

  def home
    @trainings = current_user.trainings
  end

end
