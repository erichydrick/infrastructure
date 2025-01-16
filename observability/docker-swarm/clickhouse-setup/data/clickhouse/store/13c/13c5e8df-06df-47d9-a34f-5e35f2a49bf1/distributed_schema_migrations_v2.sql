ATTACH TABLE _ UUID '2ef18e6e-b2fc-4269-9d60-b719ddfaac59'
(
    `migration_id` UInt64,
    `status` String,
    `error` String,
    `created_at` DateTime64(9),
    `updated_at` DateTime64(9)
)
ENGINE = Distributed('cluster', 'signoz_traces', 'schema_migrations_v2', rand())
