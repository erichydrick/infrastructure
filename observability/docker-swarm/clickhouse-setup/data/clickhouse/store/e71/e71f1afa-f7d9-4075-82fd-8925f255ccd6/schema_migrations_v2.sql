ATTACH TABLE _ UUID '892ef892-ad13-446b-986d-ce43bff17073'
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
