class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :fetch_users

  def fetch_users
    @users = User.all
  end

  def current_user
    if user_id = session[:user_id]
      User.find(user_id)
    else
      User.first
    end
  end
  helper_method :current_user

  def unread_messages_count
    RecipientsFor::ReaderInfo.unread_by_count(
      reciveable_type: current_user.class.name,
      reciveable_id: current_user.id
    )
  end
  helper_method :unread_messages_count
end
