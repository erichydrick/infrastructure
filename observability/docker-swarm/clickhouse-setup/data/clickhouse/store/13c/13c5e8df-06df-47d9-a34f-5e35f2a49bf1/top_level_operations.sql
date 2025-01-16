ATTACH TABLE _ UUID '94f1a0d2-c2a6-4c2a-864d-82a422de07f2'
(
    `name` LowCardinality(String) CODEC(ZSTD(1)),
    `serviceName` LowCardinality(String) CODEC(ZSTD(1)),
    `time` DateTime DEFAULT now() CODEC(ZSTD(1))
)
ENGINE = ReplacingMergeTree
ORDER BY (serviceName, name)
TTL time + toIntervalMonth(1)
SETTINGS index_granularity = 8192
