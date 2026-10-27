class UsersController < ApplicationController
  before_action :show_coming_soon_unless_admin

  def show
    @user = User.find(params[:id])
    @works = @user.works.includes(:fandom, :tags)
  end
end
