ATTACH TABLE _ UUID '3fda7d7e-f4f0-47dd-9053-be5b77c45538'
(
    `tenant` String CODEC(ZSTD(1)),
    `collector_id` String CODEC(ZSTD(1)),
    `exporter_id` String CODEC(ZSTD(1)),
    `timestamp` DateTime CODEC(ZSTD(1)),
    `data` String CODEC(ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_traces', 'usage', cityHash64(rand()))
