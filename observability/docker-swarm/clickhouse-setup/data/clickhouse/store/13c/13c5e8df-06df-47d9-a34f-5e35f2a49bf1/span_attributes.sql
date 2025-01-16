ATTACH TABLE _ UUID '2f2da4bf-75e9-42c2-8497-63114b52d65c'
(
    `timestamp` DateTime CODEC(DoubleDelta, ZSTD(1)),
    `tagKey` LowCardinality(String) CODEC(ZSTD(1)),
    `tagType` Enum8('tag' = 1, 'resource' = 2) CODEC(ZSTD(1)),
    `dataType` Enum8('string' = 1, 'bool' = 2, 'float64' = 3) CODEC(ZSTD(1)),
    `stringTagValue` String CODEC(ZSTD(1)),
    `float64TagValue` Nullable(Float64) CODEC(ZSTD(1)),
    `isColumn` Bool CODEC(ZSTD(1))
)
ENGINE = ReplacingMergeTree
ORDER BY (tagKey, tagType, dataType, stringTagValue, float64TagValue, isColumn)
TTL toDateTime(timestamp) + toIntervalSecond(172800)
SETTINGS index_granularity = 8192, ttl_only_drop_parts = 1, allow_nullable_key = 1
