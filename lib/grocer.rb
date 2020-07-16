def find_item_by_name_in_collection(name, collection)
  item = nil
collection.each do |each_hash|
  each_hash.each do |key, value|
    if value == name 
      item = each_hash
    end
  end
end
item
end 

def consolidate_cart(unconsolidated_cart)
  new_cart = []
  unconsolidated_cart.each do |hash|
      cart_item = find_item_by_name_in_collection(hash[:item], new_cart)
      if cart_item == nil 
        hash[:count] = 1 
        new_cart << hash
      else 
        new_cart.each do |new_hash|
            if new_hash[:item] == cart_item[:item]
              new_hash[:count] += 1 
            end
          end
        end
      end
  new_cart
end 