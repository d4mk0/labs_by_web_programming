class ApplicationController < ActionController::Base

  before_filter :authenticate
  before_action :associate_with_user
  before_action :check_user

  private

    def authenticate
      authenticate_or_request_with_http_basic('Administration') do |username, password|
        (user = HttpUser.find_by(name: username)) && user.password == Digest::MD5.hexdigest(password)
      end
    end

    def associate_with_user
      @user ||= User.find_by session: cookies[:session]
    end

    def check_user
      redirect_to login_path unless @user.present?
    end
end
