# Agentic AI Usage

## Planning
"Act as a senior Rails architect. Given a salary-management application for an HR manager and 10,000 employees, propose a minimal data model, API boundaries, dashboard aggregations, tests and performance considerations. Explicitly identify what should remain out of scope."

## Backend
"Implement a Rails JSON API for employees and append-only salary history. Validate fields, paginate employee results, and expose dashboard aggregation endpoints. Keep SQL-heavy aggregations out of Ruby loops."

## Frontend
"Build an HR dashboard in React/TypeScript that consumes the Rails JSON API. Prioritize readable tables, compensation metrics, search/filter controls and salary history."

## Review
"Review for N+1 queries, unbounded API responses, accidental salary-history mutation, missing validation and weak tests. Suggest only changes that materially improve correctness or performance."

AI output should be treated as a starting point; scope, schema, API boundaries and trade-offs remain human decisions.
