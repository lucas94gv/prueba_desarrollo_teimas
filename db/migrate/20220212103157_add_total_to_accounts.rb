class AddTotalToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :total, :float
  end
end
