class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!, except: [:create]

  respond_to :json
  
  def create
    @user = User.find_for_database_authentication(email: user_params[:email])
    if !@user
      @user = User.find_for_database_authentication(username: user_params[:email])
    end
    return invalid_login_attempt unless @user
  
    if @user.valid_password?(user_params[:password])
      sign_in(@user)
      
      render json: @user
      return
    end
    invalid_login_attempt
  end
  
  def destroy
    sign_out(current_user)
  end
  
  protected

  
  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Erreur avec votre identifiant ou votre mot de passe"}, :status=>401
  end
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
