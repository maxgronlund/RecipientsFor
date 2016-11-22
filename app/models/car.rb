class Car < ActiveRecord::Base
  act_as_messageble

  def message_path(car_id)
    "/cars/#{id}/car_messages/#{car_id}"
  end
end
