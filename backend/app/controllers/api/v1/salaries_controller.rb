module Api
  module V1
    class SalariesController < ApplicationController
      def index
        e = Employee.find(params[:employee_id])
        render json: e.salaries.order(effective_from: :desc).map { |s| salary_json(s) }
      end
      def create
        e = Employee.find(params[:employee_id])
        s = e.salaries.new(salary_params)
        if s.save
          render json: salary_json(s), status: :created
        else
          render json: { errors: s.errors.full_messages }, status: :unprocessable_entity
        end
      end
      private
      def salary_params = params.require(:salary).permit(:amount, :currency, :effective_from)
      def salary_json(s) = { id: s.id, amount: s.amount.to_f, currency: s.currency, effective_from: s.effective_from }
    end
  end
end
