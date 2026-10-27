class Admin::DashboardController < ApplicationController
  before_action :require_admin_access

def index
  @works_count = Work.count
  @chapters_count = Chapter.count
  @fandoms_count = Fandom.count
  @rubrics_count = Rubric.count
end

  private

  def require_admin_access
    unless admin_signed_in?
      redirect_to login_path, alert: "Доступ только для администратора."
    end
  end
end
