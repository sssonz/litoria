class WorksController < ApplicationController
  before_action :show_coming_soon_unless_admin, except: :index

  def index
    @works = Work.includes(:user, :fandom, :tags).all
  end

  def show
    @work = Work.includes(:user, :fandom, :tags, :chapters, :comments)
                .find(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    @work = current_user.works.build(work_params)

    if @work.save
      redirect_to work_path(@work),
                  notice: "Произведение успешно создано."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  @work = current_user.works.find(params[:id])
  end

def update
  @work = current_user.works.find(params[:id])

  if @work.update(work_params)
    redirect_to work_path(@work),
                notice: "Произведение успешно обновлено."
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @work = Work.find(params[:id])

  unless admin_signed_in? || @work.user_id == current_user&.id
    head :forbidden
    return
  end

  @work.destroy!

  redirect_to admin_works_path,
              notice: "Произведение успешно удалено.",
              status: :see_other
end

def remove_cover
  @work = current_user.works.find(params[:id])

  if @work.cover.attached?
    @work.cover.purge

    redirect_to edit_work_path(@work),
                notice: "Обложка успешно удалена.",
                status: :see_other
  else
    redirect_to edit_work_path(@work),
                alert: "У произведения нет обложки.",
                status: :see_other
  end
end

  private

  def work_params
    params.require(:work).permit(
    :title,
    :summary,
    :work_type,
    :rating,
    :status,
    :fandom_id,
    :cover,
    tag_ids: []
  )
  end
end
