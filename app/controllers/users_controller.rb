class UsersController < ApplicationController
  include RecipientsFor::MessageServices

  def show
    @user             = User.find(params[:id])
    @redirect_to      = params[:redirect_to]
    session[:user_id] = @user.id
    @unread_messages = reciveable_messages(
      reciveable_type:  @user.class.name,
      reciveable_id:    @user.id,
      read:             false,
      internal:         true
    )

    @read_messages = reciveable_messages(
      reciveable_type:  @user.class.name,
      reciveable_id:    @user.id,
      read:             true,
      internal:         true
    )
  end
end
