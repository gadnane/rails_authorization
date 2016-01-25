class ApplicationController < ActionController::Base
 #add a before action so that the function configure_permitted_parameters is called every time the devise controller is called 
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

#function adds name, and blogInterest to the list of allowed parameters
#for creating accounts, and updating account information
  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << [:name, :blogInterest]
     devise_parameter_sanitizer.for(:account_update) << [:name, :blogInterest]
  end
end
