ATTACH TABLE _ UUID '87a79074-a981-4ea3-ba54-c7c527ffec02'
(
    `tagKey` LowCardinality(String) CODEC(ZSTD(1)),
    `tagType` Enum8('tag' = 1, 'resource' = 2) CODEC(ZSTD(1)),
    `dataType` Enum8('string' = 1, 'bool' = 2, 'float64' = 3) CODEC(ZSTD(1)),
    `isColumn` Bool CODEC(ZSTD(1))
)
ENGINE = ReplacingMergeTree
ORDER BY (tagKey, tagType, dataType, isColumn)
SETTINGS index_granularity = 8192
