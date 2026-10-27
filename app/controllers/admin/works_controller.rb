class Admin::WorksController < ApplicationController
  before_action :require_admin_access

  def index
    @works = current_user.works
                        .includes(:fandom, :chapters, :cover_attachment)
                        .order(created_at: :desc)

    @other_works = Work.where.not(user_id: current_user.id)
                      .includes(:user, :fandom, :cover_attachment)
                      .order(created_at: :desc)
  end

  private

  def require_admin_access
    unless admin_signed_in?
      redirect_to login_path,
                  alert: "Доступ только для администратора."
    end
  end
end
