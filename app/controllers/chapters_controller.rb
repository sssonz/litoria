class ChaptersController < ApplicationController
  before_action :show_coming_soon_unless_admin

  def show
    @work = Work.find(params[:work_id])
    @chapter = @work.chapters.find(params[:id])
  end

  def new
    @work = current_user.works.find(params[:work_id])
    @chapter = @work.chapters.build
  end

  def create
    @work = current_user.works.find(params[:work_id])
    @chapter = @work.chapters.build(chapter_params)

    @chapter.position = @work.chapters.maximum(:position).to_i + 1

    if @chapter.save
      redirect_to work_chapter_path(@work, @chapter),
                  notice: "Глава успешно создана."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @work = current_user.works.find(params[:work_id])
    @chapter = @work.chapters.find(params[:id])
  end

def update
  @work = current_user.works.find(params[:work_id])
  @chapter = @work.chapters.find(params[:id])

  if @chapter.update(chapter_params)
    redirect_to work_chapter_path(@work, @chapter),
                notice: "Глава успешно обновлена."
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @work = current_user.works.find(params[:work_id])
  @chapter = @work.chapters.find(params[:id])

  @chapter.destroy!

  redirect_to work_path(@work),
              notice: "Глава успешно удалена.",
              status: :see_other
end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :body)
  end
end
