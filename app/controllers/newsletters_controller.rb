class NewslettersController < ApplicationController
  def new
    @newsletter=Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_attributes)
      if @newsletter.save
        redirect_to root_path, notice: "Thank you... Your Message was sent successfully."
      else
        flash.now[:error] = "Please correct the form"
        redirect_to root_path
      end
  end

  def index
    @newsletters=Newsletter.all
  end
    private
    def newsletter_attributes
      newsletter_attributes = params.require(:newsletter).permit([:email])
    end
end
