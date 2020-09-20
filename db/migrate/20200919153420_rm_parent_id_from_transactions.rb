class RmParentIdFromTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :parent_id, :integer
  end
end
