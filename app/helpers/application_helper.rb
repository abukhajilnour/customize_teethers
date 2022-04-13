module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc")? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  
  def cart_count_page_over_one
    if @cart.line_items.count > 0
      return "<span class='tag is-dark'>#{@cart.line_items.count}</span>".html_safe
    end
  end

  def cart_has_items
    return @cart.line_items.count > 0 
  end
end
