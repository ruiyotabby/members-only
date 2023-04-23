require "application_responder"

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters
  self.responder = ApplicationResponder
  respond_to :html

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
