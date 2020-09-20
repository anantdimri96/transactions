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
      process_transaction_params
    end

    def get_parent
      unless @params[:transaction_id].nil?
        Transaction.where(transaction_id: @params[:parent]).last
      else
        nil
      end
    end

    def process_transaction_params
      resp = check_duplicate
      if(resp.success?)
        return create_transaction
      else
        return resp
      end

    end

    def check_duplicate
      transaction = Transaction.where( t_type: @params[:t_type],
                                       amount: @params[:amount],
                                       transaction_id: @params[:transaction_id]).last
      if transaction.present? && transaction.transaction_id == @params[:transaction_id].to_i
        return failure_params("Duplicate found.")
      else
        return success_params
      end
    end

    def create_transaction

      transaction = Transaction.new(
          t_type: @params[:t_type],
          amount: @params[:amount],
          parent: get_parent,
          transaction_id: @params[:transaction_id]
      )

      if transaction.save
        return success_params
      else
        return failure_params("creation failure")
      end

    end

    def success_params
      OpenStruct.new(success?: true)

    end

    def failure_params(msg)
      OpenStruct.new(success?: false,
                     message: msg)
    end
  end
end