ATTACH TABLE _ UUID '451ed323-bd0e-4eb4-9f57-2d109b73be19'
(
    `name` String,
    `datatype` String
)
ENGINE = ReplacingMergeTree
ORDER BY (name, datatype)
SETTINGS index_granularity = 8192
