require 'json'

module Product
  extend self

  def list(args = {})
    output_text = ''
    output_text += "Available Products: \n"
    output_text += "ID | Name | Price \n"
    all.each.with_index(1) do |product, index|
      output_text += "#{index} | #{product['name']} | #{product['price']} \n"
    end

    output_text
  end

  def all
    product_file = File.read('./products.json')
    JSON.parse(product_file)
  end
end
