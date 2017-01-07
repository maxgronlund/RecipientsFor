class Message::EventNotificationSubscription
  def self.subscribe(handler, event_names)
    Array(event_names).each do |event_name|
      ActiveSupport::Notifications.subscribe(event_name) do |name, start, finish, id, payload|
        handler.receive(payload)
      end
    end
  end
end