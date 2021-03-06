require './app/helpers/sessions_helper'

class ApplicationController < ActionController::Base

  include SessionsHelper

  private
  # ログインしていない場合、ログインページへ
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end