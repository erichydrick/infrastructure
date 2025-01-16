ATTACH TABLE _ UUID 'a16c37d1-442b-4ce1-bac5-79cddeb6a772'
(
    `timestamp` DateTime64(9) CODEC(DoubleDelta, LZ4),
    `service_name` LowCardinality(String) CODEC(ZSTD(1)),
    `count` UInt64 CODEC(T64, ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_traces', 'usage_explorer', cityHash64(rand()))
