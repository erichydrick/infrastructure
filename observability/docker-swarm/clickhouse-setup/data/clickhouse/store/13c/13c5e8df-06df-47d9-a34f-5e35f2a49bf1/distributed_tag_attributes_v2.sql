ATTACH TABLE _ UUID '1b9294f4-2a8f-4f6a-a197-979da2202f11'
(
    `unix_milli` Int64 CODEC(Delta(8), ZSTD(1)),
    `tag_key` String CODEC(ZSTD(1)),
    `tag_type` LowCardinality(String) CODEC(ZSTD(1)),
    `tag_data_type` LowCardinality(String) CODEC(ZSTD(1)),
    `string_value` String CODEC(ZSTD(1)),
    `number_value` Nullable(Float64) CODEC(ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_traces', 'tag_attributes_v2', cityHash64(rand()))