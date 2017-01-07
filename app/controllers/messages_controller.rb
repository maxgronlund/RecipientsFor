class MessagesController < ApplicationController
  def show

    reader_info = get_reader_info
    redirect_to_error_page unless reader_info[:status] == :ok

    subject = get_subject(reader_info[:value])
    redirect_to_error_page unless subject[:status] == :ok

    link = get_link(subject[:value])
    redirect_to_error_page unless link[:status] == :ok

    redirect_to link[:value]

  end

  def get_link(subject)
     case subject.messageable_type
     when "Music"
       link = music_music_message_path(subject.messageable_id, subject.id)
       return {status: :ok, value: link}
     when "Car"
       link = car_car_message_path(subject.messageable_id, subject.id)
       return {status: :ok, value: link}
     else
       return {status: :error, reason: "messageable_ ype not supported"}
     end
  end

  def get_reader_info
    if reader_info =  RecipientsFor::ReaderInfo.find_by(uuid: params[:id])
      return {status: :ok, value: reader_info}
    end
    return {status: :error, reason: "reader info not found"}
  end

  def get_subject(reader_info)
    if subject = RecipientsFor::Subject.find_by(id: reader_info.subject_id)
      return {status: :ok, value: subject}
    end
    return {status: :error, reason: "subject not found"}
  end

  def redirect_to_error_page
    redirect_to root_path
  end
end
