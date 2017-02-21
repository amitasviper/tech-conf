class StaticPagesController < ApplicationController
  def home
    @conferences = Conference.get_all
  end

  def help
  end
end
