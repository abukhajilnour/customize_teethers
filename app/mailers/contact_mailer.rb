class ContactMailer < ApplicationMailer
    def message_send(contact)
    @contact=contact

    # mail to: contact.email
     mail to: 'info@twinkledreams.ca', subject: "www.twinkledreams.ca", from: 'nour@khatib.ca'
  end
end
