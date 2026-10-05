class FandomsController < ApplicationController
  def index
    @fandoms = Fandom.order(:name)
  end

  def show
    @fandom = Fandom.find(params[:id])
    @works = @fandom.works.includes(:user, :tags)
  end
end
