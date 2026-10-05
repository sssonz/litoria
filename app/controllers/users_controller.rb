class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @works = @user.works.includes(:fandom, :tags)
  end
end
