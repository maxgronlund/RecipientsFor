class Music < ActiveRecord::Base
  include RecipientsFor::Messages

  def message_path(message_id)
    "/musics/#{id}/music_messages/#{message_id}"
  end
end
