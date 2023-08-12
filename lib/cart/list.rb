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
          output_text += "#{index + 1} | #{cart_item['name']} | #{cart_item['amount']} | $#{sprintf('%.2f', amount_price(cart_item['price'], cart_item['amount']))} \n"
        end
      end

      output_text += total_amount(cart_items)
      output_text
    end
  end

  private

  def amount_price(price, amount)
    (price.to_f * amount.to_f).round(2)
  end

  def total_amount(cart_items)
    output_text = ''
    total = cart_items.map { |cart_item| amount_price(cart_item['price'], cart_item['amount']) }.sum

    if total > 20
      output_text += apply_discount(total)
    else
      output_text += "Your total amount is #{total}"
    end
  end

  def apply_discount(total)
    discount = discount_amount(total)
    discounted_total = deduct_percent_from_total(discount[:amount], total).round(2)

    "\nDiscount Applied: #{discount[:amount] * 100}% off on total greater than $#{discount[:trigger]} \n\n" \
    "TOTAL: $#{sprintf('%.2f', discounted_total)}"
  end

  def discount_amount(total)
    if total > 100
      { amount: 0.20, trigger: 100 }
    elsif total > 50
      { amount: 0.15, trigger: 50 }
    elsif total > 20
      { amount: 0.10, trigger: 20 }
    else
      { amount: 0, trigger: 0 }
    end
  end

  def deduct_percent_from_total(percent, total)
    total - (total * percent)
  end

end
