ATTACH TABLE _ UUID '93707e0b-548f-4f47-9f35-c876650e33d6'
(
    `name` String,
    `datatype` String
)
ENGINE = ReplacingMergeTree
ORDER BY (name, datatype)
SETTINGS index_granularity = 8192
