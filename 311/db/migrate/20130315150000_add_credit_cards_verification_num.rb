class AddCreditCardsVerificationNum < ActiveRecord::Migration
  def up
    add_column :credit_cards, :verification_num, :integer
  end

  def down
    remove_column :credit_cards, :verification_num
  end
end
