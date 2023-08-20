require './spec/helper/cart_spec_helper.rb'
require './lib/cart.rb'

describe Cart, type: :cart do
  context '#remove' do
    context 'the cart item exists' do
      it 'removes the cart item from the cart' do
        expect(Cart.add('1')).to eq('Jockey Wheels - Orange has been successfully added to the cart.')
        cart_items = JSON.parse(File.read('./spec/temp/test_cart.json'))

        expect(cart_items).not_to be_empty
        expect(cart_items[0]['name']).to eq 'Jockey Wheels - Orange'
        expect(Cart.remove(1)).to eq('Cart Item has been removed')
        cart_items = JSON.parse(File.read('./spec/temp/test_cart.json'))
        expect(cart_items).to be_empty
      end
    end

    context 'product does not exist' do
      it 'returns a cart item has been removed message' do
        expect(Cart.remove(1)).to eq('Cart Item has been removed')
      end
    end

    context 'input is invalid' do
      it 'returns an error message' do
        expect(Cart.remove("wow")).to eq('Invalid index')
      end
    end
  end
end
