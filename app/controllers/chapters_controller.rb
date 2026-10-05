class ChaptersController < ApplicationController
  def show
    @work = Work.find(params[:work_id])
    @chapter = @work.chapters.find(params[:id])
  end
end
