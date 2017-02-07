class StaticPagesController < ApplicationController
  def home
    @conferences = Conference.all
  end

  def help
  end
end
