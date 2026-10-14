class Employee < ApplicationRecord
  has_many :salaries, dependent: :destroy
  validates :employee_number, :first_name, :last_name, :email, :country, :department, :job_title, :employment_status, :joining_date, presence: true
  validates :employee_number, :email, uniqueness: true

  def current_salary
    salaries.order(effective_from: :desc, id: :desc).first
  end
end
