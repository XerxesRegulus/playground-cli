require './lib/product.rb'

describe Product do
  context '#list' do
    it 'prints the list of products available' do
      products_list = Product.list

      expect(products_list).to eq(
        "Available Products: \n" \
        "ID | Name | Price \n" \
        "1 | Jockey Wheels - Orange | 15.39 \n" \
        "2 | Chain Ring 146mm | 65.95 \n" \
        "3 | Carbon Brake Pads | 92.00 \n" \
        "4 | Front Derailleur - 34.9mm | 31.22 \n" \
      )
    end
  end
end
