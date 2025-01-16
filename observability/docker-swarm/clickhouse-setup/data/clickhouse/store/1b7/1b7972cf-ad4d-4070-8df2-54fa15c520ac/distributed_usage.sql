ATTACH TABLE _ UUID 'd6c96a47-0640-41ae-805d-b71f57d0691f'
(
    `tenant` String CODEC(ZSTD(1)),
    `collector_id` String CODEC(ZSTD(1)),
    `exporter_id` String CODEC(ZSTD(1)),
    `timestamp` DateTime CODEC(ZSTD(1)),
    `data` String CODEC(ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_metrics', 'usage', cityHash64(rand()))
