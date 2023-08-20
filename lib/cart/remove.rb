module Cart
  module Remove
    def remove(cart_index)
      cart_items = parse_cart_contents
      reduced_index = cart_index.to_i - 1

      return 'Invalid index' if reduced_index <= 0

      cart_items.delete_at(reduced_index)
      write_to_file(cart_items.to_json)

      'Cart Item has been removed'
    end
  end
end
