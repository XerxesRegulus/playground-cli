require './lib/product.rb'

describe Product do
  before(:each) do
    allow($stdout).to receive(:write).and_return(nil)
  end

  context '#list' do
    it 'prints the list of products available' do
      products_list = Product.list

      expect(products_list).to match(/Available Products:/)
      expect(products_list).to match(/Front Derailleur/)
    end
  end
end
