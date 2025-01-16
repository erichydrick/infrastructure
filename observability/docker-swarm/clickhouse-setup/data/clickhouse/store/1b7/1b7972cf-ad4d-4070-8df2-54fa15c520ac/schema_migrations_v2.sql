ATTACH TABLE _ UUID '56f4897b-a5ca-478c-a766-581c4768542e'
(
    `migration_id` UInt64,
    `status` String,
    `error` String,
    `created_at` DateTime64(9),
    `updated_at` DateTime64(9)
)
ENGINE = ReplacingMergeTree
PRIMARY KEY migration_id
ORDER BY migration_id
SETTINGS index_granularity = 8192
