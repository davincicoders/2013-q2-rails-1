class InitialSchema < ActiveRecord::Migration
  def up
    create_table :menu_items do |t|
      t.string :name
      t.float  :price
    end
    create_table :restaurant_tables do |t|
      t.integer  :number_of_chairs  
    end
    create_table :restaurant_orders do |t|
      t.integer :party_size
      t.integer :restaurant_table_id
      t.boolean :is_closed
      t.timestamps
    end
    create_table :ordered_menu_items do |t|
      t.integer :restaurant_order_id
      t.integer :menu_item_id
      t.integer :chair_number
      t.timestamps
    end
  end
      
  def down
    drop_table :menu_items
    drop_table :restaurant_tables
    drop_table :restaurant_orders
    drop_table :ordered_menu_items
  end
end
