require './spec/helper/cart_spec_helper.rb'
require './lib/cart.rb'

require 'pry'

describe Cart, type: :cart do
  let(:temp_file_location) { './spec/temp/test_cart.json' }

  context '#list' do
    context 'the cart is empty' do
      it 'notifies the user that the cart is empty' do
        expect(Cart.list).to eq 'Your cart is currently empty'
      end
    end

    context 'the cart has items' do
      let(:cart_item) do
        {'uuid' => 1, 'name' => 'Sample Cart Item', 'price' => '10.00', 'amount' => 1}
      end

      context 'no discount is applicable' do
        it 'displays the total without a discount' do
          File.write(temp_file_location, [cart_item].to_json)

          cart_list = Cart.list
          expect(cart_list).to match(/Products in Shopping Cart/)
          expect(cart_list).to match(/Sample Cart Item/)
          expect(cart_list).to match(/\nYour total amount is \$10.0/)
        end
      end

      context 'discount is applicable' do
        it 'gives a discount of 10% for a total greater than $20' do
          cart_item['price'] = '21'
          File.write(temp_file_location, [cart_item].to_json)

          cart_list = Cart.list
          expect(cart_list).to match(/10% off on total greater than \$20/)
          expect(cart_list).to match(/\n\nTOTAL: \$18.90/)
        end

        it 'gives a discount of 15% for a total greater than $50' do
          cart_item['price'] = '51'
          File.write(temp_file_location, [cart_item].to_json)

          cart_list = Cart.list
          expect(cart_list).to match(/15% off on total greater than \$50/)
          expect(cart_list).to match(/\n\nTOTAL: \$43.35/)
        end

        it 'gives a discount of 20% for a total greater than $100' do
          cart_item['price'] = '101'
          File.write(temp_file_location, [cart_item].to_json)

          cart_list = Cart.list
          expect(cart_list).to match(/20% off on total greater than \$100/)
          expect(cart_list).to match(/\n\nTOTAL: \$80.80/)
        end
      end

      context 'with multiple amounts' do
        it 'displays the total based on the amount' do
          cart_item['amount'] = 11
          File.write(temp_file_location, [cart_item].to_json)

          cart_list = Cart.list
          expect(cart_list).to match(/Sample Cart Item | 11 | \$110.00/)
          expect(cart_list).to match(/20% off on total greater than \$100/)
          expect(cart_list).to match(/\n\nTOTAL: \$88.00/)
        end
      end
    end
  end
end
