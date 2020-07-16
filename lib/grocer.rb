def find_item_by_name_in_collection(name, collection)
  item = nil
collection.each do |each_hash|
  each_hash.each do |key, value|
    if value == name 
      item = {key => value}
    end
  end
end
item
end 

def consolidate_cart(unconsolidated_cart)
  new_cart = []
  unconsolidated_cart.each do |hash|
    hash.each do |key, value|
      matching_value = find_item_by_name_in_collection(value, new_cart)
      if !matching_value
        new_cart << hash 
        new_cart[-1][:count] = 1 
      else
        new_cart.each do |new_hash|
          new_hash.each do |new_key, new_value|
            if new_value == value 
              new_hash[:count] += 1 
            end
          end
        end
      end
    end
  end
  new_cart
end 