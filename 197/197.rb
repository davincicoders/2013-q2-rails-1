require './connect_to_db.rb'

puts "Enter the first name of a sales rep:"
sales_rep_first_name = readline.chomp

# TODO: Implement the rest of GitHub challenge 197 here.


person = G197SalesRep.where(first_name: sales_rep_first_name).first
total_commissions = 0

if person == nil
  puts "Unknown sales rep."

else

  orders = person.g197_orders
  for order in orders
    customer = order.g197_customer
    items = order.g197_order_items
    array = []
    commissions = 0.0
      for item in items
        product  = item.g197_product
        array[array.size] = product.name
        commissionrate = person.commission_rate / 100.0
        commissions = (commissions + (product.price_per_year * commissionrate)).round(2)
      end
    
      if array == []
      array = ["none"]
      else
      end
    
    output = array.join(", ")
    commissions_string = "$%.2f" % commissions
    total_commissions = total_commissions + commissions
    total_commissions_string = "$%.2f" % total_commissions  
    puts "Order ##{order.id} - #{customer.first_name} #{customer.last_name} - #{output} - #{commissions_string}"
  end
  puts "Total commission: #{total_commissions_string}"
end
  
  
  
  
