class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :facebook_user_id
      t.string :facebook_photo_url
      t.timestamps
    end
    add_index :users, :facebook_user_id
  end

  def down
    drop_table :users
  end
end
