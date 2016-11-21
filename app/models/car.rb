class Car < ActiveRecord::Base
  include RecipientsFor::Messages

  def message_path(car_id)
    "/cars/#{id}/car_messages/#{car_id}"
  end
end
