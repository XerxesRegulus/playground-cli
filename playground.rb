require 'optparse'

Dir['./lib/*rb'].each { |file| require file }

options = {
  product: {},
  cart: {}
}

option_parser = OptionParser.new do |parser|
  parser.on('-l', '--list', 'lists the available products') do |l|
    options[:product][:list] = l
  end
  parser.on('-a', '--add-to-cart PRODUCTID', "adds a product to the cart using the product's ID, you can find a product's id using --list. Example: playground -a 1") do |product_id|
    options[:cart][:add] = product_id
  end
  parser.on('-c', '--cart-list', 'lists the current items in your cart with a total amount that needs to be paid.') do |c|
    options[:cart][:list] = c
  end
end.parse!

options.each do |klass, method_details|
  method_details.each do |method_name, args|
    puts Object.const_get(klass.capitalize).send(method_name, args)
    puts "\n\n"
  end
end
