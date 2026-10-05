class TagsController < ApplicationController
  def index
    @tags = Tag.order(:kind, :name)
  end

  def show
    @tag = Tag.find(params[:id])
    @works = @tag.works.includes(:user, :fandom)
  end
end
