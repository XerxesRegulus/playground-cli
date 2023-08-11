require 'json'

class Product
  class << self
    def list(*args)
      product_file = File.read('./products.json')
      @products_json ||= JSON.parse(product_file)

      output_text = ''
      output_text += "Available Products: \n"
      @products_json.each do |product|
        output_text += "#{product['uuid']} : #{product['name']} : #{product['price']} \n"
      end

      puts output_text
      output_text
    end
  end
end
