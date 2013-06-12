class AddLicensePlate < ActiveRecord::Migration
  def up
    add_column :cars, :license_plate, :string
  end

  def down
    remove_column :cars, :license_plate
  end
end
