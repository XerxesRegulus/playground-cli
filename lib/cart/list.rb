require 'pry'

module Cart
  module List
    def list(_args)
      output_text = ''
      cart_items = parse_cart_contents

      if cart_items.nil? || cart_items.empty?
        output_text = 'Your cart is currently empty '
      else
        output_text += "Products in Shopping Cart: \n"
        output_text += "# | Product Name | Amount | Price \n"
        cart_items.each_with_index do |cart_item, index|
          output_text += "#{index + 1} | #{cart_item['name']} | #{cart_item['amount']} | #{sprintf('%.2f', amount_price(cart_item['price'], cart_item['amount']))} \n"
        end
      end

      output_text
    end
  end

  private

  def amount_price(price, amount)
    (price.to_f * amount.to_f).round(2)
  end
end
