require 'optparse'

Dir['./lib/*rb'].each { |file| require file }


OptionParser.new do |parser|
  parser.on('-l', '--list', 'lists the available products') do |l|
    puts Product.list
  end
  parser.on('-a', '--add-to-cart PRODUCTINDEX', Integer,"adds a product to the cart using the product's ID, you can find a product's id using --list") do |product_index|
    puts Cart.add(product_index)
  end
  parser.on('-c', '--cart-list', 'lists the current items in your cart with a total') do |c|
    puts Cart.list
  end
  parser.on('-r', '--remove-from-cart CARTINDEX', Integer, 'Removes a cart item based on its cart index') do |ci|
    puts Cart.remove(ci)
  end
end.parse!
