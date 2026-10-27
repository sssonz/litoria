class FandomsController < ApplicationController
  before_action :show_coming_soon_unless_admin, except: :index

  def index
    @fandoms = Fandom.order(:name)
  end

  def show
    @fandom = Fandom.find(params[:id])
    @works = @fandom.works.includes(:user, :tags)
  end
end
