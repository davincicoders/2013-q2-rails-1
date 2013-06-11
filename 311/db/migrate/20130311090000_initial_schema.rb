class InitialSchema < ActiveRecord::Migration
  def up
    create_table "ex0311_users" do |t|
      t.string "name"
    end
    create_table "ex0311_items" do |t|
      t.string "description"
    end
    create_table "ex0311_items_users" do |t|
      t.integer "ex0311_item_id"
      t.integer "ex0311_user_id"
    end
  end

  def down
    drop_table "ex0311_users"
    drop_table "ex0311_items"
    drop_table "ex0311_items_users"
  end
end
