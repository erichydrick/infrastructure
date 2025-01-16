ATTACH TABLE _ UUID '80599cae-8b4e-475e-8151-a45b4d0adf5b'
(
    `labels` String CODEC(ZSTD(5)),
    `fingerprint` String CODEC(ZSTD(1)),
    `seen_at_ts_bucket_start` Int64 CODEC(Delta(8), ZSTD(1)),
    INDEX idx_labels lower(labels) TYPE ngrambf_v1(4, 1024, 3, 0) GRANULARITY 1,
    INDEX idx_labels_v1 labels TYPE ngrambf_v1(4, 1024, 3, 0) GRANULARITY 1
)
ENGINE = ReplacingMergeTree
PARTITION BY toDate(seen_at_ts_bucket_start / 1000)
ORDER BY (labels, fingerprint, seen_at_ts_bucket_start)
TTL (toDateTime(seen_at_ts_bucket_start) + toIntervalSecond(1296000)) + toIntervalSecond(1800)
SETTINGS ttl_only_drop_parts = 1, index_granularity = 8192
