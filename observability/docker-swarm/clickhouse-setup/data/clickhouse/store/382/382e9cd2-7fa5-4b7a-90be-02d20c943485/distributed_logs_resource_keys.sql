ATTACH TABLE _ UUID '3901b542-30ab-4222-a588-c4514b2cead2'
(
    `name` String,
    `datatype` String
)
ENGINE = Distributed('cluster', 'signoz_logs', 'logs_resource_keys', cityHash64(datatype))
