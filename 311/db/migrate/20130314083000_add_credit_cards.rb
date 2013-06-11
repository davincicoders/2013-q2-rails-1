class AddCreditCards < ActiveRecord::Migration
  def up
    create_table "ex0311_credit_cards" do |t|
      t.integer "user_id"
      t.integer "num"
    end
  end

  def down
    drop_table "ex0311_credit_cards"
  end
end
