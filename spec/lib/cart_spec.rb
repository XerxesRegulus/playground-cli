require './lib/cart.rb'
require 'pry'

describe Cart do
  let!(:temp_file_location) { './spec/temp/test_cart.json' }

  before :each do
    stub_const 'Cart::FILE_LOCATION', temp_file_location
  end

  after :each do
    File.delete(temp_file_location) if File.exist?(temp_file_location)
  end

  context '#add' do
    context 'the product exists' do
      it 'adds the product to the cart' do
        expect(Cart.add('1')).to eq('Jockey Wheels - Orange has been successfully added to the cart.')
        cart_items = JSON.parse(File.read(temp_file_location))

        expect(cart_items).not_to be_empty
        expect(cart_items[0]['name']).to eq 'Jockey Wheels - Orange'
        expect(cart_items[0]['amount']).to eq 1
      end
    end

    context 'product does not exist' do
      it 'returns a warning saying the product is not found' do
        expect(Cart.add('99999')).to eq("Product not found. Please use the '-l' or '--list' option to list out the available products.")
      end
    end

    context 'input is invalid' do
      it 'returns an error message' do
        expect(Cart.add('not a number')).to eq("Invalid Product ID.")
      end
    end
  end
end
