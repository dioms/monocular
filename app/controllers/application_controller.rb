class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def stored_location_for(resource)
    nil
  end

  def after_sign_in_path_for(resource)
    events_path
  end
end
