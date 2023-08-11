require 'json'
require 'pry'

module Cart
  extend self

  def add(uuid)
    output_text = ''
    product = Product.all.filter{ |p| p['uuid'] == uuid.to_i }[0]

    if !product.nil?
      output_text = "#{product['name']}"
    else
      output_text = "Product not found. Please use the '-l' or '--list' option to list out the available products."
    end

    puts output_text
  end
end
