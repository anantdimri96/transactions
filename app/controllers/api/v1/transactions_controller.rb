module Api
  module V1
    class TransactionsController < ApplicationController

      before_action :set_transaction, only: [:calculate_sum]

      # PUT /transactions/:transaction_id
      def create
        transaction = ::TransactionService::Create.new(create_params).call
        render json: transaction, status: :created
      end

      # GET /transactions/:type
      def type
        @transaction = Transaction.where(t_type: params[:type].strip).pluck(:transaction_id)
        render json: {transactions: @transaction}
      end

      # GET /sum/:transaction_id
      def calculate_sum
        data = ::TransactionService::ResultantSum.new(@transaction).call
        render json: {sum: data}
      end

      private

      def set_transaction
        @transaction = Transaction.where(transaction_id: params[:transaction_id]).last
      end

      def create_params
        {
            t_type: params[:type],
            amount: params[:amount],
            parent: params[:parent_id] || nil,
            transaction_id: params[:transaction_id]
        }
      end

      # Whitelisted params
      def transaction_params
        params.require(:transaction).permit(:type, :amount, :parent_id, :transaction_id)
      end
    end
  end
end
