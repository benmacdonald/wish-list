class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :allow_iframe_requests

  def allow_iframe_requests
    unless Rails.env == 'production'
      response.headers.delete('X-Frame-Options')
    end
  end
end
