class CreatePropertyAdmins < ActiveRecord::Migration
  def up
    create_table "property_admins" do |t|
      t.string "username"
      t.string "password"
    end
  end

  def down
    drop_table "property_admins"
  end
end
