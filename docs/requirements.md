# Requirements

## Goal
Replace spreadsheet-based compensation tracking with a simple web application that lets HR understand, search and maintain employee salary data across countries.

## In scope
1. Employee directory with search, filters and pagination.
2. Employee profile editing.
3. Salary history with effective dates.
4. Dashboard answering common compensation questions: headcount, total payroll, average/median salary, country/department comparisons and salary distribution.
5. CSV export.
6. Seed data representing 10,000 employees.
7. Automated tests.
8. Responsive HR-friendly UI.

## Out of scope
Payroll execution/payment processing; tax/statutory calculations; currency conversion/FX; benefits; employee self-service; complex RBAC/SSO; approvals; automated salary recommendations; real-time notifications.

## Rationale
The assessment asks how the organization pays people rather than implementing payroll. This scope gives HR immediate value while keeping the take-home project realistic.

## Non-functional
Deterministic seed data, paginated APIs, database-level aggregations where practical, validation, preserved salary history, and clean separation between UI/API/persistence.
