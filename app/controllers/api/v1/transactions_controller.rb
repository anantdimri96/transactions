module Api
  module V1
    class TransactionsController < ApplicationController

      before_action :set_transaction, only: [:show, :calculate_sum]

      # PUT /transactions/:transaction_id
      def create
        response = ::TransactionService::Create.new(create_params).call
        if response.success?
          render json: {status: response.success?}, status: :ok
        else
          render json: {status: response.success?, message: response.message}, status: :not_acceptable
        end

      end

      # GET /transactions/:type
      def type
        @transaction = Transaction.where(t_type: params[:type].strip).pluck(:transaction_id)
        if @transaction.present?
          res = {transactions: @transaction}
        else
          res = {transactions: @transaction, message: "No transaction type: #{params[:type].strip}"}
        end

        render json: res, status: :ok
      end

      # GET /sum/:transaction_id
      def calculate_sum
        data = ::TransactionService::ResultantSum.new(@transaction).call
        render json: {sum: data}
      end

      def show
        if @transaction.present?
          render json: @transaction, status: :ok
        else
          render json: {}, status: :ok
        end
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
