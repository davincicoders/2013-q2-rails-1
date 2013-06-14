class InitialSchema < ActiveRecord::Migration
  def up
  	create_table :credit_cards do |t|
  		t.string :card_type
      t.string :number
      t.string :expiration_month,    :limit => 2
      t.string :expiration_year,     :limit => 4
      t.string :verification_number
      t.timestamps
    end
  end

  def down
  	drop_table :credit_cards
  end
end
