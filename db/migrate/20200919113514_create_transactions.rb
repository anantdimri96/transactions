class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :t_type
      t.float :amount
      t.integer :transaction_id
      t.integer :parent_id, default: 0
      t.timestamps
    end
  end
end
