ATTACH TABLE _ UUID 'e68e1858-2dd6-4cf3-9484-2f0c9912ed34'
(
    `migration_id` UInt64,
    `status` String,
    `error` String,
    `created_at` DateTime64(9),
    `updated_at` DateTime64(9)
)
ENGINE = Distributed('cluster', 'signoz_logs', 'schema_migrations_v2', rand())
