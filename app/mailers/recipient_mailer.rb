class RecipientMailer < ApplicationMailer

  def new_message(options={})
    ap options

    subject = RecipientsFor::Subject.find_by(id: options[:subject_id])
    user    = User.find_by(id: options[:reciveable_id])
    if user && subject
      ap "Sending #{subject.title} to #{user.name} with the secret link #{options[:uuid]}"
      ap "secret link #{message_path(options[:uuid])}"
    end
  end
end
