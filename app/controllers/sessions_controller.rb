class SessionsController < ApplicationController
  
  before_action :check_user, except: [:login, :create]

  def create
    if params[:login].present?
      p 'param login present'
      @user = User.find_by name: params[:login][:username]
      p @user
      if @user.present? && @user.password == Digest::MD5.hexdigest(params[:login][:password])
        @user.login!
        cookies[:session] = @user.session
        flash[:notice] = 'Successs login'
      else
        flash[:notice] = 'Wrong data'
      end
    end
    redirect_to root_path
  end

  def destroy
    cookies.delete(:session)
    redirect_to root_path
  end

  def login
    redirect_to posts_path if @user.present?
  end
end
