class LicencePlate < ActiveRecord::Migration
  def up
    add_column :cars, :licence_plate, :string
  end

  def down
    remove_column :cars, :licence_plate
  end
end
