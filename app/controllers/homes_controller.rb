class HomesController < ApplicationController

  def top
    @trainings = Training.all
  end

  def about
  end

  def timer
  end

end
