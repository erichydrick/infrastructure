ATTACH TABLE _ UUID '426cd460-a63b-43e1-bb02-acdd84a8d6a8'
(
    `rule_id` LowCardinality(String),
    `rule_name` LowCardinality(String),
    `overall_state` LowCardinality(String),
    `overall_state_changed` Bool,
    `state` LowCardinality(String),
    `state_changed` Bool,
    `unix_milli` Int64 CODEC(Delta(8), ZSTD(1)),
    `fingerprint` UInt64 CODEC(ZSTD(1)),
    `value` Float64 CODEC(Gorilla, ZSTD(1)),
    `labels` String CODEC(ZSTD(5))
)
ENGINE = Distributed('cluster', 'signoz_analytics', 'rule_state_history_v0', cityHash64(rule_id, rule_name, fingerprint))