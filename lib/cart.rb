require 'json'

require './lib/cart/add.rb'

module Cart
  FILE_LOCATION = './cart.json'

  extend self
  extend Cart::Add

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
