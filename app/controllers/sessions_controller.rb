class SessionsController < ApplicationController
  def new
	#auto show new.html.erb in views/sessions
	#test redirect_to signup_path 
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      flash[:error] = "Invalid email/account."
      render :new # tiep tuc call ham new session de yeu cau signin
    else
      sign_in(user)
      redirect_to user
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end
