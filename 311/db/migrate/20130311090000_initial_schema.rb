class InitialSchema < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
    end
    create_table :items do |t|
      t.string :description
      t.string :sku
    end
    create_table :items_users do |t|
      t.integer :item_id
      t.integer :user_id
    end
  end

  def down
    drop_table :users
    drop_table :items
    drop_table :items_users
  end
end
