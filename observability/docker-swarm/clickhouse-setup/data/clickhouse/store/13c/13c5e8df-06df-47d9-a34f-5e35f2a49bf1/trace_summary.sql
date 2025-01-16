ATTACH TABLE _ UUID '73bc2df1-7e44-4db1-a3d5-da307b752205'
(
    `trace_id` String CODEC(ZSTD(1)),
    `start` SimpleAggregateFunction(min, DateTime64(9)) CODEC(ZSTD(1)),
    `end` SimpleAggregateFunction(max, DateTime64(9)) CODEC(ZSTD(1)),
    `num_spans` SimpleAggregateFunction(sum, UInt64) CODEC(ZSTD(1))
)
ENGINE = AggregatingMergeTree
PARTITION BY toDate(end)
ORDER BY trace_id
TTL toDateTime(end) + toIntervalSecond(1296000)
SETTINGS index_granularity = 8192, ttl_only_drop_parts = 1
