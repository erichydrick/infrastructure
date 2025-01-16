ATTACH TABLE _ UUID '84b4607e-6bf9-4117-a5cb-a69246a39a61'
(
    `migration_id` UInt64,
    `status` String,
    `error` String,
    `created_at` DateTime64(9),
    `updated_at` DateTime64(9)
)
ENGINE = Distributed('cluster', 'signoz_metrics', 'schema_migrations_v2', rand())
