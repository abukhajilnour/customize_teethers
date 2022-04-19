class ApplicationController < ActionController::Base
  respond_to :html, :json


  include ApplicationHelper
  before_action :load_cart
  before_action :authenticate_user!
  before_action :initialize_session
  before_action :load_cart 
  def index
    @types = Array.new
    @teethers.each {|t| @types << t.types.pluck(:name) }
  end



  private

  def initialize_session
    session[:cart] ||= [] # empty cart = empty array
    
  end

  def load_cart
    # @cart = Product.find(session[:cart])
    # Product.all.pluck(:id) => 1, 2
    # Product.find(1, 2, 3) => error
    # Product.where(id: [1, 2, 3]) => 1, 2
    @cart = Teether.where(id:  session[:cart].collect {|obj| obj['id']} )
  end

end
