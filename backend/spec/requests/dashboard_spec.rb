require "rails_helper"
RSpec.describe "Dashboard API", type: :request do
  it "returns compensation summary" do
    e=Employee.create!(employee_number:"EMP00001",first_name:"A",last_name:"B",email:"a@example.com",country:"India",department:"Engineering",job_title:"Engineer",employment_status:"Active",joining_date:Date.today)
    e.salaries.create!(amount:100_000,currency:"INR",effective_from:Date.today)
    get "/api/v1/dashboard"
    expect(response).to have_http_status(:ok)
    body=JSON.parse(response.body)
    expect(body["headcount"]).to eq(1)
    expect(body["total_payroll"]).to eq(100000.0)
  end
end
