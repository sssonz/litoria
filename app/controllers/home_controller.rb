class HomeController < ApplicationController
  def index
    @works = Work.includes(:user, :fandom, :tags).all
  end
end
