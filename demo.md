## Purpose of the application
Acme Salary Manager is a web-based HR tool designed to help an HR Manager explore employee records and understand compensation across a multi-country workforce. It replaces scattered spreadsheet lookups with a central employee directory, workforce summaries, currency-aware salary benchmarks, and a place to maintain employee and salary records.

## Features of the application
1. Workforce summary cards:	Shows total employees, active employees, number of countries, and number of departments.
2. Country breakdown: Shows active employee counts grouped by country.
3. Department breakdown: Shows active employee counts grouped by department.
4. Salary benchmarks by currency: Shows employee counts and average/minimum/maximum salary amounts grouped by currency. It does not add different currencies together.
5. Employee directory: Lists employee number, name, title, department, country, current salary/currency, and status.
6. Search and filters: Searches employee number, first name, last name, or email; filters by country and department.
7. Pagination: Shows 25 records per page.
8. Employee detail panel: Opens a record, shows editable fields, and lists salary history.
9. Edit employee: Updates country, department, job title, and employment status.
10. Add salary record: Adds an amount, currency, and effective date while retaining previous salary rows.
11. CSV export: Downloads matching search/filter results, up to the prototype limit of 100 records.


## Step-by-step: how to use the application
1.	Open the dashboard: Load the app and wait for summary cards, country/department breakdowns, currency table, and employee list.
2.	Read the overview: Use the cards for workforce size and the breakdowns to see where active employees work.
3.	Compare salaries responsibly: Read the salary benchmark table one currency at a time. Raw INR, USD, GBP, EUR, SGD, and AUD amounts are not directly comparable.
4.	Find an employee: Enter a name, employee number, or email. Optionally select a country and/or department, then click Search.
5.	Navigate the list: Use Previous and Next. The page indicator shows the range and number of matching records.
6.	Inspect a record: Click an employee row to open a panel with details, editable fields, and salary history.
7.	Edit an employee: Change country, department, job title, or status and click Save changes.
8.	Add salary history: Enter an amount, currency, and effective date, then click Add salary. This creates a new history row rather than overwriting earlier rows.
9.	Export a CSV: Apply search/filters and click Export CSV. The current prototype exports up to 100 matching records.


## Technical overview
Frontend: Static HTML, CSS, and JavaScript.
Backend: Ruby on Rails
Database: PostgreSQL.
Tables: employees stores identity, country, department, title, status, and joining date. salaries stores employee link, amount, currency, and effective date.
API endpoints: GET /api/dashboard; GET /api/employees; GET/PUT /api/employees/:id; POST /api/salaries.
Data volume: Seeded with 10,000 synthetic employees and an initial salary row per employee.
Performance choices: Database-side grouping, server-side search/filter/pagination, indexes on country/department, and current-salary lookup ordered by effective date.


## Limitations to be transparent about
1. It is not production-ready HR software and has no role-based access control or audit trail for sensitive salary changes.
2. CSV export currently returns at most 100 matching records; production export should stream all authorized results.
3. Salary inputs have only basic required-field checks; production should validate numeric bounds, currency codes, dates, and effective-date rules.
4. No currency conversion, payroll/tax calculation, payment processing, benefits, or approval workflow is included.
5. The current UI is a compact prototype and should be polished and tested before final submission.
