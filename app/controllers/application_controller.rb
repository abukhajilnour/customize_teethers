class ApplicationController < ActionController::Base
  def index
    @types = Array.new
    @teethers.each {|t| @types << t.types.pluck(:name) }
  end
end
