ATTACH TABLE _ UUID 'c3ed1747-1442-4c33-9387-a99139380a4b'
(
    `tenant` String CODEC(ZSTD(1)),
    `collector_id` String CODEC(ZSTD(1)),
    `exporter_id` String CODEC(ZSTD(1)),
    `timestamp` DateTime CODEC(ZSTD(1)),
    `data` String CODEC(ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_logs', 'usage', cityHash64(rand()))
