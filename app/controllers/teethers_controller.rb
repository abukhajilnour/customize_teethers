class TeethersController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  helper_method :sort_column, :sort_direction
  before_action :find_teether, only: [:destroy,:edit,:update,:show]

  def index
    @teethers= Teether.order(sort_column + " " + sort_direction)
    @colors = Array.new
    @types = Array.new
    @teethers.each {|t| @types << t.types.pluck(:name) }
    @teethers.each {|t| @colors << t.colors.pluck(:name) }
    if params[:search]
      @search_term = params[:search]
      @teethers= @teethers.search_by(@search_term)
    end
          if params[:type_id]
        @types = Typation.where(type_id: params[:type_id])
        @teethers = @types.map(&:teether)
      end
  end

  def create
    @teether = Teether.new(teether_attributes)

    if @teether.save
      redirect_to teethers_path, notice: "Thank you... Your teether information was created successfully."
    else
      flash.now[:error] = "Please correct the form"
      render :new
    end
  end

  def show
    @teether = Teether.find(params[:id])
    @color = @teether.colors.build
  end

  def new
    @teether=Teether.new 
  end

  def edit
  end

  def update
    if @teether.update_attributes(teether_attributes)
      redirect_to @teether, notice: "Teether information updated successfully"
    else
      flash.now[:error] = "Couldn't update!"
      render :edit
    end
  end

  def destroy
    if @teether.destroy
      redirect_to teethers_path, notice: "Message deleted successfully."
    else
      redirect_to teether_path, error: "We had trouble deleting."
    end
  end

  private
  def find_teether
    @teether = Teether.find(params[:id])
  end
  def sort_column
    Teether.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[desc asc].include?(params[:direction]) ? params[:direction] : "desc"
  end
  def teether_attributes
    teether_attributes = params.require(:teether).permit([:name,:description,:price,:image,:keywords,:status,:quantity,:discount,:kind,{type_ids: []},:gender,:color,:theme])
  end


end
