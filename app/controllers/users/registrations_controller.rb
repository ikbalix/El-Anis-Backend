class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, except: [ :create ]
  respond_to :json
  def create
    user = User.new(user_params)
    if user.save

      sign_in(user)

      render :json=> user

    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end
  
  def user_params
      load_params = params.require(:user).permit(:email, :password, :type_u, :exp, :date, :size, :silhouette,
        :ethnic, :eyes, :hair, :city, :location, :about, :username, :avatar, :certification_photo,:partenaire, 
        :et_name, :voie, :num, :vile, :code_p, :activite, :phone, :days_o, :hours_o, :link, :cover, :logo)
      load_params[:intereste] = params[:user][:intereste] if params[:user][:intereste]
      load_params[:days_o] = params[:user][:days_o] if params[:user][:days_o]
      load_params.permit!
  end
end

