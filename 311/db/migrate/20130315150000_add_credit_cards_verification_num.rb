class AddCreditCardsVerificationNum < ActiveRecord::Migration
  def up
    add_column "ex0311_credit_cards", "verification_num", :integer
  end

  def down
    remove_column "ex0311_credit_cards", "verification_num"
  end
end
