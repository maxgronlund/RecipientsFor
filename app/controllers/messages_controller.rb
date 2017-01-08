class MessagesController < ApplicationController
  def show
    begin
      reader_info = get_reader_info
      return redirect_to_error_page(reader_info[:reason]) unless reader_info[:status] == :ok

      subject = get_subject(reader_info[:value])
      return redirect_to_error_page(reader_info[:reason]) unless subject[:status] == :ok

      link = build_link(subject[:value])
      return redirect_to_error_page(reader_info[:reason]) unless link[:status] == :ok

      return redirect_to link[:value]
    rescue => e
      redirect_to_error_page(e.inspect)
    end
  end

  private

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

  def build_link(subject)
     case subject.messageable_type
     when "Music"
       link = music_music_message_path(subject.messageable_id, subject.id)
       return {status: :ok, value: link}
     when "Car"
       link = car_car_message_path(subject.messageable_id, subject.id)
       return {status: :ok, value: link}
     end
     return {status: :error, reason: "messageable_ ype not supported"}
  end

  def redirect_to_error_page(error_message)
    flash[:notice] = error_message
    redirect_to root_path
  end
end
