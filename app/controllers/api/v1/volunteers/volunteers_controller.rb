class Api::V1::Volunteers::VolunteersController < Api::V1::BaseController
    before_action :authenticate_user!

    respond_to  :json

    def create
        @already_volunteer = current_user.published_volunteers.where(user_id: params[:user_id])
        if @already_volunteer.empty?
            @volunteer = Volunteer.new(volunteer_params)
            @volunteer.volunteer_id = current_user.id
            @volunteer.save
            if @volunteer.save
                render :json=> {:success=>true, :status=>200, :message=>"created"}, status: 200
              else
                render :json => { :errors => @volunteer.errors.full_messages }
            end
        else
            @volunteer = @already_volunteer.first()
            if @volunteer.volunteer_id == current_user.id || @volunteer.user_id == current_user.id
                if @volunteer.destroy
                    render :json=> {:success=>true, :status=>200, :message=>"removed"}, status: 200
                  else
                    render :json => { :errors => @volunteer.errors.full_messages }
                end
            else
                render :json=> {:error=>true, :status=>401, :message=>"unauthoraized"}, :status=>401
            end
        end
    end
    def volunteer_params
        params.require(:volunteer).permit(:volunteer_id, :user_id)
    end

end