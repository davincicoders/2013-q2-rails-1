require './connect_to_db.rb'

puts "Enter the first name of a sales rep:"
sales_rep_first_name = readline.chomp
sales_rep = G197SalesRep.where(first_name: sales_rep_first_name).first
total_commission = 0.0

if sales_rep == nil
  puts "Unknown sales rep."
else
  for order in sales_rep.g197_orders
    product_names = []
    commission = 0.0
    for order_item in order.g197_order_items
      product_names.push(order_item.g197_product.name)
      commission += (order_item.g197_product.price_per_year *
        sales_rep.commission_rate / 100).round(2)
    end
    if product_names == []
      product_names = ["none"]
    end
  
    total_commission += commission
  
    print "Order ##{order.id} - "
    print "#{order.g197_customer.first_name} #{order.g197_customer.last_name} - "
    print "#{product_names.join(', ')} - "
    commission_string = "$%.2f" % commission
    print "#{commission_string}\n"
  end
  
  total_commission_string = "$%.2f" % total_commission
  puts "Total commission: #{total_commission_string}"
end
