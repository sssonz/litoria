class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:email].to_s.strip.downcase
    user = User.find_by(email: email)

    if user&.authenticate(params[:password]) && user.role == "admin"
      reset_session
      session[:user_id] = user.id

      redirect_to admin_root_path, notice: "Вы успешно вошли как администратор."
    else
      flash.now[:alert] = "Неверный email, пароль или недостаточно прав."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "Вы вышли из аккаунта."
  end
end
