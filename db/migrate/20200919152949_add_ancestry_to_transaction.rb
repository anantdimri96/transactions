class AddAncestryToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :ancestry, :string
    add_index :transactions, :ancestry
  end
end
