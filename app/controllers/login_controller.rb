class LoginController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email].to_s)

    if user && user.authenticate(params[:password])
      reset_session
      session[:user_id] = user.id

      redirect_to tasks_path
    else
      redirect_to login_path, alert: t('flash.login.create.alert')
    end
  end

  def destroy
    reset_session

    redirect_to login_path,
     notice: t('flash.login.destroy.notice')
  end
end
