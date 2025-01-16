ATTACH TABLE _ UUID '91798632-8663-4ee1-bd02-4cb6b7e36471'
(
    `unix_milli` Int64 CODEC(Delta(8), ZSTD(1)),
    `tag_key` String CODEC(ZSTD(1)),
    `tag_type` LowCardinality(String) CODEC(ZSTD(1)),
    `tag_data_type` LowCardinality(String) CODEC(ZSTD(1)),
    `string_value` String CODEC(ZSTD(1)),
    `number_value` Nullable(Float64) CODEC(ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_logs', 'tag_attributes_v2', cityHash64(rand()))
