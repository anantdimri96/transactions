module TransactionService
  class ResultantSum

    def initialize(transaction)
      @transaction = transaction
    end

    def call
      process_transaction
    end

    private

    def process_transaction
      @transaction.amount + @transaction.descendants.sum(:amount)
    end
  end
end