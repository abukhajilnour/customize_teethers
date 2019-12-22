class ContactsController < ApplicationController

  def new
    @contact=Contact.new
  end

  def create
    @contact = Contact.new(contact_attributes)
      if @contact.save
        redirect_to new_contact_path, notice: "Thank you... Your Message was sent successfully."
      else
        flash.now[:error] = "Please correct the form"
        redirect_to new_contact_path
      end
  end

  def index
    @contact=Contact.all
  end

  private

      def contact_attributes
        contact_attributes = params.require(:contact).permit([:name,:email,:description])
      end
end
