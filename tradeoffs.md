# Trade-offs and Performance

SQLite is used because the assessment explicitly permits it and it keeps local setup simple. PostgreSQL is the production recommendation.

Dashboard grouping and summary calculations are performed in the database where practical. Employee APIs are paginated and indexed. The UI never requests all 10,000 employees at once.

For production scale, move to PostgreSQL, add caching for expensive dashboard queries, background CSV imports/exports, object storage and observability.
