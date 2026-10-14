Employee.delete_all
Salary.delete_all
countries = [["United States","USD",120_000],["United Kingdom","GBP",85_000],["India","INR",1_800_000],["Germany","EUR",82_000],["Canada","CAD",105_000],["Australia","AUD",125_000],["Singapore","SGD",115_000],["UAE","AED",300_000]]
departments=%w[Engineering Product Sales Finance HR Operations Marketing Support]
titles=["Software Engineer","Senior Software Engineer","Staff Engineer","Product Manager","Sales Manager","HR Manager","Financial Analyst","Operations Lead"]
first=%w[Alex Jordan Taylor Morgan Casey Riley Avery Cameron Jamie Quinn]
last=%w[Smith Johnson Brown Davis Wilson Miller Moore Taylor Anderson Thomas]
rows=[]
10_000.times do |i|
  c,cur,base=countries[i%countries.length]; n=format("EMP%05d",i+1)
  rows << {employee_number:n,first_name:first[i%first.length],last_name:last[(i*7)%last.length],email:"#{n.downcase}@acme.example",country:c,department:departments[i%departments.length],job_title:titles[i%titles.length],employment_status:i%20==0 ? "Inactive":"Active",joining_date:Date.new(2018+i%8,1+i%12,1+i%27),created_at:Time.current,updated_at:Time.current}
end
Employee.insert_all!(rows)
salaries=[]
Employee.find_each do |e|
  c,cur,base=countries.find{|x|x[0]==e.country}; salaries << {employee_id:e.id,amount:(base*(1+(e.id%15)*0.025)).round(2),currency:cur,effective_from:Date.new(2025,1,1),created_at:Time.current,updated_at:Time.current}
end
Salary.insert_all!(salaries)
puts "Seeded #{Employee.count} employees and #{Salary.count} salary records."
