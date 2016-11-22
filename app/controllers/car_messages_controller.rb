class CarMessagesController < ApplicationController
  include RecipientsFor::MessageServices
  include RecipientsFor::ReaderServices

  def new
    @car = Car.find(params[:car_id])
    build_message
    set_recipients
  end


  def create
    @car = Car.find(params[:car_id])
    @subject = create_message(
        author: current_user,
        messageable: @car,
        personas: User.all,
        params: subject_params
      )
    if @subject.persisted?
      redirect_to car_car_message_path(@car, @subject)
    else
      set_recipients
      render :new
    end
  end

  #def index
  #end

  def show
    @car = Car.find(params[:car_id])
    show_message(params[:id], current_user)
    reciveables = RecipientsFor::Recipient.reciveables(@car)
    @readers = @car.all_readers(@subject)
  end

  private

  def set_recipients
    find_or_create_receipients(
      messageble: @car,
      personas: User.all,
      notifications: [
        {notification_type: "internal", name: "intern besked", checked: true, internal: true},
        {notification_type: "email", name: "email", checked: false, internal: false},
        {notification_type: "sms", name: "sms", checked: false, internal: false}
      ]
    )
  end



  def subject_params
    params.require(:recipients_for_subject).permit!
  end
end
