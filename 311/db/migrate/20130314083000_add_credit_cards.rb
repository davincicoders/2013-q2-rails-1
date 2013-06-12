class AddCreditCards < ActiveRecord::Migration
  def up
    create_table :credit_cards do |t|
      t.integer :user_id
      t.integer :num
    end
  end

  def down
    drop_table :credit_cards
  end
end
