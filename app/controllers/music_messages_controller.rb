class MusicMessagesController < ApplicationController
  include RecipientsFor::MessageServices
  include RecipientsFor::ReaderServices

  def new
    @music = Music.find(params[:music_id])
    build_message
    set_recipients
  end


  def create
    @music = Music.find(params[:music_id])
    @subject = create_message(
        author: current_user,
        messageable: @music,
        personas: User.all,
        params: subject_params
      )
    if @subject.persisted?
      redirect_to music_music_message_path(@music, @subject)
    else
      set_recipients
      render :new
    end
  end

  def show
    @music = Music.find(params[:music_id])
    show_message(params[:id], current_user)
    reciveables = RecipientsFor::Recipient.reciveables(@music)
    #build_reader_infos(@subject, reciveables)
    @readers = @music.all_readers(@subject)
  end

  private

  def set_recipients
    find_or_create_receipients(
      messageble: @music,
      personas: User.all,
      notifications: [
        {notification_type: "email", name: "email", checked: true, internal: false},
        {notification_type: "internal", name: "intern besked", checked: false, internal: true}
      ]
    )
  end

  def subject_params
    params.require(:recipients_for_subject).permit!
  end
end
