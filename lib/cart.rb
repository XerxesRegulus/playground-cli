require 'json'

module Cart
  extend self
  FILE_LOCATION = './cart.json'

  def add(uuid)
    output_text = ''
    product = Product.all.filter{ |p| p['uuid'] == uuid.to_i }[0]

    unless product.nil?
      cart_items = parse_cart_contents
      same_item = cart_items.select { |cart_item| cart_item['uuid'] == product['uuid'] }[0]

      if same_item.empty?
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

    puts output_text
  end

  private

  def parse_cart_contents
    file = find_or_create_file
    file.empty? ? [] : JSON.parse(file)
  end

  def find_or_create_file
    unless File.exist?(FILE_LOCATION)
      File.write(FILE_LOCATION, '')
    end

    File.read(FILE_LOCATION)
  end

  def write_to_file(json_data)
    File.write(FILE_LOCATION, json_data)
  end
end
