class Car < ActiveRecord::Base

  def message_count
    RecipientsFor::Subject.where(
      messageable_type: self.class.name,
      messageable_id: id
    ).count
  end

  def message_path(car_id)
    "/cars/#{id}/car_messages/#{car_id}"
  end
end
