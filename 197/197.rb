require './connect_to_db.rb'
require 'pry'

puts "Enter the first name of a sales rep:"
sales_rep_first_name = readline.chomp

# TODO: Implement the rest of GitHub challenge 197 here.

#binding.pry

line_item, products, i, subtot, tot, sales_rep, orders_by_rep, tot_com = [], [], 0, 0.0, 0.0, nil, nil, 0.0

#Victoria
sales_rep = G197SalesRep.where(first_name: sales_rep_first_name).first

orders_by_rep = sales_rep.g197_orders.order("id") if sales_rep

if sales_rep
  for order in orders_by_rep
    line_item[i] = "Order \##{order.id} - #{order.g197_customer.first_name} #{order.g197_customer.last_name}"
    products[i] = []
    for order_item in order.g197_order_items
      products[i].push order_item.g197_product.name
      
      subtot += (order_item.g197_product.price_per_year.to_f)
      subtot = subtot.round(1)
    end
    tot = ((sales_rep.commission_rate.to_i * 1.0) / 100) * subtot
    tot = tot.round(2)

    if products[i].first
      products[i] = products[i].join(", ")
      line_item[i] += " - #{products[i]}"
    else
      line_item[i] += " - none"
    end
    
    tot_string = "%.2f" % tot
    line_item[i] += " - $#{tot_string}"
    puts line_item[i]
    tot_com += tot
    i = i + 1
    tot = 0.0
    subtot = 0.0
  end
  puts "Total commission: $#{'%.2f' % tot_com}"
else
  puts "Unknown sales rep."
end
