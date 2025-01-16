ATTACH TABLE _ UUID '426036a2-b981-44b6-9c3b-2c83c3320bdc'
(
    `unix_milli` UInt64,
    `data_source` String,
    `resource_fingerprint` UInt64,
    `attrs_fingerprint` UInt64,
    `resource_attributes` Map(LowCardinality(String), String),
    `attributes` Map(LowCardinality(String), String)
)
ENGINE = Distributed('cluster', 'signoz_metadata', 'attributes_metadata', cityHash64(data_source, resource_fingerprint, attrs_fingerprint))
