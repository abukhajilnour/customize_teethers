class ColorsController < ApplicationController
  before_action :find_color, only: [:destroy,:edit,:update,:show,:index]
  def new
    @teether = Teether.find(params[:id])
    @color = @teether.colors.build
  end
  def create
    @teether= Teether.find(params[:id])
    @color = @teether.colors.build(color_params)
    if @color.save
      redirect_to teethers_path 
    end
  end
  def destroy
    @teether = Color.find(params[:id]).teether
    @color = Color.find(params[:id])

    if @color.destroy
      redirect_to teethers_path
    end
  end
  def edit
    @teether = Color.find(params[:id]).teether
    @color = Color.find(params[:id])
  end
    def update
    if @color.update_attributes(color_params)
      redirect_to teethers_path, notice: "colorn Information updated successfully"
    else
      flash.now[:error] = "Couldn't update!"
      render :edit
    end
  end

private
  def color_params
    color_params = params.require(:color).permit([:name])
  end
  def find_color
    @color = Color.find(params[:id])
  end 

end
