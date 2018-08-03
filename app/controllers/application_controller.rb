class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lat_city, :lng_city, :type_u, :exp, :date, :size, :silhouette,
      :ethnic, :eyes, :hair, :date_c, :size_c,:smoke,:smoke_c,:type_c1,:type_c2, :silhouette_c, :ethnic_c, :eyes_c, :hair_c, :couple, :city, :location, :about, :username, :avatar, :certification_photo,:partenaire, 
      :et_name, :voie, :num, :vile, :code_p, :activite, :phone, :days_o, :hours_o, :link, :cover, :logo, intereste: [:fh,:fb, :le, :hh, :hb, :ga, :ch, :chb, :cfb, :cbi, :tt]])
  end

end
