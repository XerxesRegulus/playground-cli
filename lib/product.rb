require 'json'

class Product
  class << self
      def list(*args)
      output_text = ''
      output_text += "Available Products: \n"
      self.all.each do |product|
        output_text += "#{product['uuid']} : #{product['name']} : #{product['price']} \n"
      end

      puts output_text
      output_text
    end

    private

    def all
      product_file = File.read('./products.json')
      JSON.parse(product_file)
    end
  end
end
