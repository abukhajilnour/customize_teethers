class TypesController < ApplicationController

  def show
    @type=Type.find params[:id]
    @teethers=@type.teethers
    @colors = Array.new
    @teethers.each {|t| @colors << t.colors.pluck(:name) }
  end


end
