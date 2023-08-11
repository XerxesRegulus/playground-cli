require 'optparse'
require 'pry'

Dir['./lib/*rb'].each { |file| require file }

options = {
  product: {},
  cart: {}
}

option_parser = OptionParser.new do |parser|
  parser.on('-l', '--list', 'lists the available products') do |l|
    options[:product][:list] = l
  end
  parser.on('--add-to-cart UUID', "adds a product to the cart using the product's UUID") do |uuid|
    options[:cart][:add] = uuid
  end
end.parse!

options.each do |klass, method_details|
  method_details.each do |method_name, args|
    Object.const_get(klass.capitalize).send(method_name, args)
  end
end
