class ContactsController < ApplicationController
  
  def new
    @contact=Contact.new
  end

  def create
    @contact = Contact.new(contact_attributes)
      if @contact.save
        ContactMailer.message_send(@contact).deliver
        redirect_to new_contact_path, notice: "Thank you... Your Message was sent successfully."
      else
        flash.now[:error] = "Please correct the form"
        redirect_to new_contact_path
      end
  end

  private

      def contact_attributes
        contact_attributes = params.require(:contact).permit([:name,:email,:message])
      end
end
