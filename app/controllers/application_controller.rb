class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :set_access_control_headers

  private

  def set_access_control_headers
      headers['Access-Control-Allow-Origin'] = "http://198.199.108.233"
  end
end
