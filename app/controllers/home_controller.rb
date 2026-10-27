class HomeController < ApplicationController
  def index
    @works = Work.includes(:user, :fandom, :tags).all

    @rubrics = Rubric.includes(:works)
                     .order(created_at: :desc)
  end
end
