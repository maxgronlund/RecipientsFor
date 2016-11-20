class RecipientsFor::ContentsController < ApplicationController

  # POST/ create a reply to a subject
  # Mark subject as unread
  def create
    subject_id                = params[:recipients_for_content][:subject_id]
    @subject                   = RecipientsFor::Subject.find(subject_id)
    @content                  = @subject.contents.new(recipients_for_content_params)
    @content.authorable_id    = current_user.id
    @content.authorable_type  = current_user.class.name
    return_path               = params[:recipients_for_content][:return_path]

    if @content.save
      @content.subject.mark_as_unread
      redirect_to return_path, notice: 'Message content was successfully created.'
    else
      flash[:error]  = @content.errors.full_messages[0]
      messageable    = @subject.messageable
      messageable_id = messageable.class.name.downcase + "_id"
      @car           = messageable
      session[:request_url] = return_path
      render "/car_messages/show", messageable_id.to_sym => subject_id, id: messageable.id
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def recipients_for_content_params
      params.require(:recipients_for_content).permit!
    end
end
