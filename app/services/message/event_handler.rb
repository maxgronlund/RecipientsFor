# Dear developer. You have to restart the app if you change this file
# before changes takes effect
class Message::EventHandler

  # Handle for reciving messages
  # Look inside config/initializers/message.rb
  def receive(payload)
    #ap payload
    subject = RecipientsFor::Subject.includes(:reader_infos).find(payload[:subject_id] )
    if reader_infos = subject.reader_infos
      parse_reader_infos(reader_infos)
    end
  end

  private

  # Loop through reader infos
  def parse_reader_infos(reader_infos)
    reader_infos.each do |reader_info|
      process_emails(reader_info)
    end
  end

  # Only process reader_infos with email enabled
  def process_emails(reader_info)
    notifications = reader_info.notifications
    notifications.each do |notification|
      case notification[:notification_type]
      when "email"
        send_email(reader_info)     if notification[:checked]
      when "internal"
        send_internal(reader_info)  if notification[:checked]
      when "sms"
        send_sms(reader_info)       if notification[:checked]
      when "e-boks"
        send_e_boks(reader_info)    if notification[:checked]
      end
    end
  end

  def send_email(reader_info)
    RecipientMailer.new_message(
      reciveable_id:  reader_info.reciveable_id,
      subject_id:     reader_info.subject_id,
      uuid:           reader_info.uuid
    ).deliver_now
  end

  def send_sms(reader_info)

  end

  def send_internal(reader_info)

  end

  def send_e_boks(reader_info)

  end

end