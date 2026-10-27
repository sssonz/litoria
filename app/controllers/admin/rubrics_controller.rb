class Admin::RubricsController < ApplicationController
  before_action :require_admin_access

  def index
    @rubrics = Rubric.order(:name)
  end

  def new
    @rubric = Rubric.new
  end

  def edit
    @rubric = Rubric.find(params[:id])
  end

  def create
    @rubric = Rubric.new(rubric_params)

    if @rubric.save
      redirect_to admin_rubrics_path,
                  notice: "Рубрика успешно создана."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @rubric = Rubric.find(params[:id])

    if @rubric.update(rubric_params)
      redirect_to admin_rubrics_path,
                  notice: "Рубрика успешно обновлена."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @rubric = Rubric.find(params[:id])
    @rubric.destroy!

    redirect_to admin_rubrics_path,
                notice: "Рубрика успешно удалена.",
                status: :see_other
  end

  private

  def require_admin_access
    unless admin_signed_in?
      redirect_to login_path,
                  alert: "Доступ только для администратора."
    end
  end

  def rubric_params
    params.require(:rubric).permit(
      :name,
      :description,
      work_ids: []
    )
  end
end
