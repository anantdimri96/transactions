class AddIndexToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_index :transactions, [:transaction_id, :t_type, :amount], unique: true
  end
end
