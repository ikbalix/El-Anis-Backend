class Api::V1::Users::UsersController < Api::V1::BaseController
    before_action :authenticate_user!, except: [ :password, :emailVerfication ]
    include Rails::Pagination
    respond_to  :json
    def currentuser
        @user = current_user
    end

    def volunteers
        @volunteers = User.where(type_u: 'volunteer')
    end


    def myteam
        if current_user.type_u == "hajj"
            @volunteers = current_user.published_volunteers
        else
            @volunteers = current_user.volunteers
        end
        
    end



    def updatePosition 
        @user = User.find(current_user.id)
        @user.latitude = params[:latitude]
        @user.longitude = params[:longitude]
        @user.save
    end

    def map
        @volunteers = current_user.volunteers
    end


    def user_params
        load_params = params.require(:user).permit( :date, :avatar, :firstname, :lastname, :date, :type, :avatar, :country, :latitude, :longitude)
    end
end