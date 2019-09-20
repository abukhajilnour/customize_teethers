class ContactMailer < ApplicationMailer
    def message_send(contact)
    @contact=contact

    # mail to: contact.email
     mail to: 'nour@khatib.ca', subject: "www.twinkledreams.ca", from: 'nour@khatib.ca'
  end
end
