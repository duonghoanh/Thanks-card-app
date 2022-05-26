class SessionsController < ApplicationController
   def new
    # render 'users/show'
   end
   

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user&.authenticate(params[:session][:password])
      log_in(@user)
      flash[:success] = 'Login successfully!'
      redirect_back_or @user
    else
      render :new
    end

  end


  def destroy
    log_out
    flash[:success] = 'Log out successfully!'
    redirect_to login_path
  end

  private

    def remember_me?
      params[:session][:remember_me] == '1'
    end
end