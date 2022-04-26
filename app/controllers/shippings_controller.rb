class ShippingsController < ApplicationController
   before_action :authenticate_user!
  def new
    @order_items = current_order.order_items
    @shipping = Shipping.new
  end

  def create
    
        total_price =  0
          @cart.each do |item|
            x = session[:cart]
            x.select {|obj| obj['id']== item.id}
            engr = x.find {|obj| obj['id']== item.id}['engraving']
            engr_price = engr.to_s.size*0.25
            sub_total = engr_price+item.price
            item.price = sub_total
            total_price += sub_total
          end
        
        order = Order.new
        order.total = total_price.to_f
        order.user_id = current_user.id
        order.save

        @shipping = Shipping.new(shipping_attributes)
        @shipping.order_id = Order.last.id
        if @shipping.save
      
        @session = Stripe::Checkout::Session.create({
        customer: current_user.stripe_customer_id,
        payment_method_types: ['card'],
        line_items:  [{
            quantity:  1,
            price_data: {
            currency: 'cad',
            unit_amount: (total_price * 100).ceil,
            product_data: {
              name:  "Your Total Bill ",
            },
            
          },
          
        },],
        mode: 'payment',
        success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
        cancel_url: cancel_url,
      })
      redirect_to @session.url
    else
      render :new
    end

  end

    def success
      total_price =  0
          @cart.each do |item|
            x = session[:cart]
            x.select {|obj| obj['id']== item.id}
            engr = x.find {|obj| obj['id']== item.id}['engraving']
            engr_price = engr.to_s.size*0.25
            sub_total = engr_price+item.price
            item.price = sub_total
            total_price += sub_total
          end
      if params[:session_id].present?
          order = Order.last
          order.status = "paid"
        if order.save
          @cart.each do |item|
            x = session[:cart]
            x.select {|obj| obj['id']== item.id}
            engr = x.find {|obj| obj['id']== item.id}['engraving']
            engr_price = engr.to_s.size*0.25
            sub_total = engr_price+item.price
            order_items = OrderItem.new
            order_items.teether_id = item.id
            order_items.quantity = 1
            order_items.order_id = Order.last.id
            order_items.total  = sub_total
            order_items.save
          end
           
        end

        # @cart.each do |item|

        
        # session.delete(:cart)
        session[:cart] = [] # empty cart = empty array
        # @session_with_expand = Stripe::Checkout::Session.retrieve({ id: params[:session_id], expand: ["line_items"]})
        # @session_with_expand.line_items.data.each do |line_item|
        #   teether = Teether.find_by(stripe_teether_id: line_item.price.product)
        # end
      else
      redirect_to cancel_url, alert: "No info to display"
      end
    end

  def cancel
  end

  private

  def shipping_attributes
    params.require(:shipping).permit(:first_name,:last_name,:email,:address,:address2,:city,:state,:zip)
  end
end
 