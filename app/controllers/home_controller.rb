class HomeController < ApplicationController
  def index
    @teethers= Teether.all
    @types = Array.new
    @teethers.each {|t| @types << t.types.pluck(:name) }
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
  private
    def newsletter_attributes
      newsletter_attributes = params.require(:newsletter).permit([:email])
    end
end
