require "csv"
module Api
  module V1
    class EmployeesController < ApplicationController
      def index
        employees = Employee.all
        if params[:q].present?
          q = "%#{Employee.sanitize_sql_like(params[:q])}%"
          employees = employees.where("first_name LIKE :q OR last_name LIKE :q OR email LIKE :q OR employee_number LIKE :q OR job_title LIKE :q", q: q)
        end
        employees = employees.where(country: params[:country]) if params[:country].present?
        employees = employees.where(department: params[:department]) if params[:department].present?
        page = [params.fetch(:page, 1).to_i, 1].max
        per_page = [[params.fetch(:per_page, 25).to_i, 1].max, 100].min
        total = employees.count
        employees = employees.order(:last_name, :first_name).offset((page - 1) * per_page).limit(per_page)
        render json: { data: employees.map { |e| employee_json(e) }, meta: { page: page, per_page: per_page, total: total, total_pages: (total.to_f / per_page).ceil } }
      end

      def show
        render json: employee_json(Employee.find(params[:id]), include_history: true)
      end

      def update
        employee = Employee.find(params[:id])
        if employee.update(employee_params)
          render json: employee_json(employee)
        else
          render json: { errors: employee.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def export
        csv = CSV.generate(headers: true) do |out|
          out << %w[employee_number name email country department job_title status current_salary currency]
          Employee.includes(:salaries).find_each do |e|
            s = e.current_salary
            out << [e.employee_number, "#{e.first_name} #{e.last_name}", e.email, e.country, e.department, e.job_title, e.employment_status, s&.amount, s&.currency]
          end
        end
        send_data csv, filename: "employees.csv", type: "text/csv"
      end

      private
      def employee_params
        params.require(:employee).permit(:first_name, :last_name, :email, :country, :department, :job_title, :employment_status, :joining_date)
      end
      def employee_json(e, include_history: false)
        s = e.current_salary
        payload = { id: e.id, employee_number: e.employee_number, first_name: e.first_name, last_name: e.last_name, email: e.email, country: e.country, department: e.department, job_title: e.job_title, employment_status: e.employment_status, joining_date: e.joining_date, current_salary: s && { amount: s.amount.to_f, currency: s.currency, effective_from: s.effective_from } }
        payload[:salary_history] = e.salaries.order(effective_from: :desc).map { |x| { id: x.id, amount: x.amount.to_f, currency: x.currency, effective_from: x.effective_from } } if include_history
        payload
      end
    end
  end
end
