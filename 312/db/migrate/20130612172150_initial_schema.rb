class InitialSchema < ActiveRecord::Migration
  def up
    create_table :cars do |t|
      t.string :color
      t.string :model
      t.integer :car_share_member_id
    end
    create_table :car_share_members do |t|
      t.string :first_name
      t.string :username
      t.string :password_digest
    end
  end

  def down
    drop_table :cars
    drop_table :car_share_members
  end
end
