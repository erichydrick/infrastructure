ATTACH MATERIALIZED VIEW _ UUID 'c18dc332-ab45-4a71-a6d8-cc465e3c5807' TO signoz_metrics.time_series_v4_6hrs
(
    `env` LowCardinality(String) DEFAULT 'default',
    `temporality` LowCardinality(String) DEFAULT 'Unspecified',
    `metric_name` LowCardinality(String),
    `description` LowCardinality(String) DEFAULT '' CODEC(ZSTD(1)),
    `unit` LowCardinality(String) DEFAULT '' CODEC(ZSTD(1)),
    `type` LowCardinality(String) DEFAULT '' CODEC(ZSTD(1)),
    `is_monotonic` Bool DEFAULT false CODEC(ZSTD(1)),
    `fingerprint` UInt64 CODEC(Delta(8), ZSTD(1)),
    `unix_milli` Int64 CODEC(Delta(8), ZSTD(1)),
    `labels` String CODEC(ZSTD(5)),
    `attrs` Map(LowCardinality(String), String) CODEC(ZSTD(1)),
    `scope_attrs` Map(LowCardinality(String), String) CODEC(ZSTD(1)),
    `resource_attrs` Map(LowCardinality(String), String) CODEC(ZSTD(1))
) AS
SELECT
    env,
    temporality,
    metric_name,
    description,
    unit,
    type,
    is_monotonic,
    fingerprint,
    floor(unix_milli / 21600000) * 21600000 AS unix_milli,
    labels,
    attrs,
    scope_attrs,
    resource_attrs
FROM signoz_metrics.time_series_v4
