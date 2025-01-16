ATTACH TABLE _ UUID '1ea6447b-3774-459e-abc7-86b4d51c6082'
(
    `timestamp` DateTime64(9) CODEC(DoubleDelta, LZ4),
    `traceID` FixedString(32) CODEC(ZSTD(1)),
    `model` String CODEC(ZSTD(9))
)
ENGINE = MergeTree
PARTITION BY toDate(timestamp)
ORDER BY traceID
TTL toDateTime(timestamp) + toIntervalSecond(1296000)
SETTINGS index_granularity = 1024, ttl_only_drop_parts = 1
