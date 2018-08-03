class Api::V1::BaseController < ActionController::Base
  include ActionController::ImplicitRender
  include ActionView::Layouts
  include DeviseTokenAuth::Concerns::SetUserByToken


  respond_to :json

  before_action :authenticate_user!

end
