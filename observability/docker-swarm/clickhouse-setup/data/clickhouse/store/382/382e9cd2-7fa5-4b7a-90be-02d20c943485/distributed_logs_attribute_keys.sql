ATTACH TABLE _ UUID '1eeb4abe-34e4-4afd-97b9-b75603dd493b'
(
    `name` String,
    `datatype` String
)
ENGINE = Distributed('cluster', 'signoz_logs', 'logs_attribute_keys', cityHash64(datatype))
