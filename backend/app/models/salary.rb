class Salary < ApplicationRecord
  belongs_to :employee
  CURRENCIES = %w[USD EUR GBP INR CAD AUD SGD AED].freeze
  validates :amount, numericality: { greater_than: 0 }
  validates :currency, inclusion: { in: CURRENCIES }
  validates :effective_from, presence: true
end
