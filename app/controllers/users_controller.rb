class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver_later
        format.html { redirect_to root_path, notice: 'Your email was successfully sent' }
      else
        format.html { redirect_to root_path, notice: 'Please make sure that you have filled correct email' }
      end
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email)
    end
end
