class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user

  private

  def authenticate_user
    client_id = ENV['client_id']
    redirect_uri = CGI.escape('http://localhost:3000/auth')
    foursquare_url = "https://foursquare.com/oauth2/authenticate?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"
    redirect_to foursquare_url unless logged_in?
  end

  def logged_in?
    !!session[:token]
  end
end
