require "rails_helper"
RSpec.describe Employee, type: :model do
  it "requires a unique employee number" do
    attrs={employee_number:"EMP00001",first_name:"A",last_name:"B",email:"a@example.com",country:"India",department:"Engineering",job_title:"Engineer",employment_status:"Active",joining_date:Date.today}
    Employee.create!(attrs)
    duplicate=Employee.new(attrs.merge(email:"b@example.com"))
    expect(duplicate).not_to be_valid
  end
end
