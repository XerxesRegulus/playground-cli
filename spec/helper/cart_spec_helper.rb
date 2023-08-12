RSpec.configure do |config|
  temp_file_location = './spec/temp/test_cart.json'

  config.before(:each, type: :cart) do
    stub_const 'Cart::FILE_LOCATION', temp_file_location
  end

  config.after(:each, type: :cart) do
    File.delete(temp_file_location) if File.exist?(temp_file_location)
  end
end
