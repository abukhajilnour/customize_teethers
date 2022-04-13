class CardsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end
  def remove_from_card
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to cards_path
  end
end
