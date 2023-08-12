require './lib/product.rb'

module Cart
 module Add
  def add(index)
    return 'Invalid Product ID.' if index.to_i < 1

    output_text = ''
    product = Product.all[index.to_i - 1]

    unless product.nil?
      cart_items = parse_cart_contents
      same_item = cart_items.select { |cart_item| cart_item['uuid'] == product['uuid'] }[0]

      if same_item.nil?
        cart_items << product.merge({"amount" => 1})
      else
        same_item_index = cart_items.find_index(same_item)
        cart_items[same_item_index]['amount'] += 1
      end

      write_to_file(cart_items.to_json)
      output_text = "#{product['name']} has been successfully added to the cart."
    else
      output_text = "Product not found. Please use the '-l' or '--list' option to list out the available products."
    end

    output_text
  end
 end
end
