class Transaction < ApplicationRecord
  has_ancestry

  validates :transaction_id, uniqueness: { scope: [:t_type, :amount] }
end
