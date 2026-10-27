class PagesController < ApplicationController
  def about
    @subscribers_count = Subscriber.count
  end

  def coming_soon
  end
end
