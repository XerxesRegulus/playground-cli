require './lib/product.rb'

describe Product do
  context '#list' do
    it 'prints the list of products available' do
      products_list = Product.list

      expect(products_list).to match(/Available Products:/)
      expect(products_list).to match(/Front Derailleur/)
    end
  end
end
