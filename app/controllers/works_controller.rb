class WorksController < ApplicationController
  def index
    @works = Work.includes(:user, :fandom, :tags).all
  end

  def show
    @work = Work.includes(:user, :fandom, :tags, :chapters, :comments).find(params[:id])
  end
end
