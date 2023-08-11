require 'json'

class Product
  class << self
    def list(*args)
      product_file = File.read('./products.json')
      @products_json ||= JSON.parse(product_file)

      puts 'Avaliable Products:'
      @products_json.each do |product|
        puts "#{product['uuid']} : #{product['name']} : #{product['price']}"
      end
    end
  end
end
