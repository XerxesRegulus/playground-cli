require 'optparse'

Dir['./lib/*rb'].each { |file| require file }


OptionParser.new do |parser|
  parser.on('-l', '--list', 'lists the available products') do |l|
    puts Product.list
  end
  parser.on('-a', '--add-to-cart PRODUCTNAME', "adds a product to the cart using the product's ID, you can find a product's id using --list") do |product_name|
    puts Cart.add(product_name)
  end
  parser.on('-c', '--cart-list', 'lists the current items in your cart with a total') do |c|
    puts Cart.list
  end
  parser.on('-r', '--remove-from-cart CARTINDEX', Integer, 'lists the current items in your cart with a total') do |ci|
    puts Cart.remove(ci)
  end
end.parse!
