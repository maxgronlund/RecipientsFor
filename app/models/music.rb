class Music < ActiveRecord::Base
  act_as_messageble

  def message_path(message_id)
    "/musics/#{id}/music_messages/#{message_id}"
  end
end
