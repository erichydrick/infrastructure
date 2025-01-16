ATTACH TABLE _ UUID 'e8941dea-995f-4508-95f2-5435f7e12cbe'
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
