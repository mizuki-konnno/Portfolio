class HomesController < ApplicationController

  def top
    @trainings = current_user.trainings
  end

  def about
  end

  def timer
  end

end
