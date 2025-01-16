ATTACH TABLE _ UUID '594e88c2-5e68-4539-90a3-e5d3ec1afb6b'
(
    `migration_id` UInt64,
    `status` String,
    `error` String,
    `created_at` DateTime64(9),
    `updated_at` DateTime64(9)
)
ENGINE = Distributed('cluster', 'signoz_metadata', 'schema_migrations_v2', rand())
