#RecipientsFor.configure do |config|
#  config.drawing_count = 6
#  ap "============= config ================"
#  puts "============= config ==============="
#end

#class Car::EventNotificationSubscription
#  ap "============= EventNotificationSubscription ================"
#
#  def self.subscribe(handler, event_names)
#    ap "============= subscribe ================"
#    Array(event_names).each do |event_name|
#      ActiveSupport::Notifications.subscribe(event_name) do |name, start, finish, id, payload|
#        handler.receive(payload)
#      end
#    end
#  end
#end

Message::EventNotificationSubscription.subscribe(Message::EventHandler.new, %w(message_created))