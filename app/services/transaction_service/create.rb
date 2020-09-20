module TransactionService
  class Create

    def initialize(params)
      @params = params
    end

    def call
      prepare_transaction
    end

    private

    def prepare_transaction
      create_transaction
    end

    def get_parent
      unless @params[:transaction_id].nil?
        Transaction.where(transaction_id: @params[:parent]).last
      else
        nil
      end
    end

    def create_transaction
      return Transaction.create(
            t_type: @params[:type],
            amount: @params[:amount],
            parent: get_parent,
            transaction_id: @params[:transaction_id]
      )
    end

    def success_params
      OpenStruct.new(success?: true)

    end

    def failure_params
      OpenStruct.new(success?: false)
    end
  end
end