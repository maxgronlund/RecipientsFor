class Music < ActiveRecord::Base
  def message_count
    RecipientsFor::Subject.where(
      messageable_type: self.class.name,
      messageable_id: id
    ).count
  end

  def message_path(message_id)
    "/musics/#{id}/music_messages/#{message_id}"
  end
end
