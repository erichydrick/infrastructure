ATTACH TABLE _ UUID 'd825d6bd-3a08-4fd2-aca6-c2e66c1d0d84'
(
    `labels` String CODEC(ZSTD(5)),
    `fingerprint` String CODEC(ZSTD(1)),
    `seen_at_ts_bucket_start` Int64 CODEC(Delta(8), ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_logs', 'logs_v2_resource', cityHash64(labels, fingerprint))
