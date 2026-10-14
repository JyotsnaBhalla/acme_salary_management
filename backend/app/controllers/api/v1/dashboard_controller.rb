module Api
  module V1
    class DashboardController < ApplicationController
      def show
        current_ids = Salary.select("MAX(id)").group(:employee_id)
        current = Salary.where(id: current_ids).joins(:employee).where(employees: { employment_status: "Active" })
        render json: {
          headcount: Employee.where(employment_status: "Active").count,
          total_payroll: current.sum(:amount).to_f,
          average_salary: current.average(:amount).to_f.round(2),
          median_salary: median(current.pluck(:amount)),
          by_country: grouped(current, "employees.country"),
          by_department: grouped(current, "employees.department"),
          distribution: distribution(current)
        }
      end
      private
      def grouped(scope, column)
        scope.group(column).sum(:amount).map { |k,v| { name: k, total: v.to_f.round(2) } }.sort_by { |x| -x[:total] }
      end
      def median(values)
        a = values.map(&:to_f).sort
        return 0 if a.empty?
        m = a.length / 2
        a.length.odd? ? a[m] : ((a[m-1] + a[m]) / 2.0).round(2)
      end
      def distribution(scope)
        buckets = { "<50k"=>0, "50k-100k"=>0, "100k-150k"=>0, "150k-250k"=>0, "250k+"=>0 }
        scope.pluck(:amount).each do |amount|
          x=amount.to_f; key=x<50_000 ? "<50k" : x<100_000 ? "50k-100k" : x<150_000 ? "100k-150k" : x<250_000 ? "150k-250k" : "250k+"; buckets[key]+=1
        end
        buckets.map { |k,v| {name:k,count:v} }
      end
    end
  end
end
