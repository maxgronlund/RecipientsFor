class RecipientsFor::CarsController < ApplicationController
  #before_action :set_car, only: [:show, :edit, :update, :destroy]
  include RecipientsFor::MessageServices
  include RecipientsFor::ReaderServices

  def create
    @car = Car.find(params[:recipients_for_subject][:messageable_id])
    @subject = create_message(
        author: User.first,
        messageable: @car,
        personas: User.all,
        params: subject_params
      )
    if @subject.persisted?
      redirect_to car_path(@car)
      #redirect_to ffa_course_course_schedule_course_attendance_mails_path(@course, @schedule)
    else
      set_recipients
      render 'cars/new'
    end
  end

  private

  def subject_params
    params.require(:recipients_for_subject).permit!
  end

  def set_recipients
    find_or_create_receipients(
      messageble: @car,
      personas: User.all,
      notifications: [
        {notification_type: "email", name: "email", checked: true, internal: false},
        {notification_type: "internal", name: "intern besked", checked: false, internal: true}
      ]
    )
  end

end
