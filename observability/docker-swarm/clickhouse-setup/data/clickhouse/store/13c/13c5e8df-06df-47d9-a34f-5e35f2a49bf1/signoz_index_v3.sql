ATTACH TABLE _ UUID '771d3f00-a31c-4291-870a-9d264975ddfe'
(
    `ts_bucket_start` UInt64 CODEC(DoubleDelta, LZ4),
    `resource_fingerprint` String CODEC(ZSTD(1)),
    `timestamp` DateTime64(9) CODEC(DoubleDelta, LZ4),
    `trace_id` FixedString(32) CODEC(ZSTD(1)),
    `span_id` String CODEC(ZSTD(1)),
    `trace_state` String CODEC(ZSTD(1)),
    `parent_span_id` String CODEC(ZSTD(1)),
    `flags` UInt32 CODEC(T64, ZSTD(1)),
    `name` LowCardinality(String) CODEC(ZSTD(1)),
    `kind` Int8 CODEC(T64, ZSTD(1)),
    `kind_string` String CODEC(ZSTD(1)),
    `duration_nano` UInt64 CODEC(T64, ZSTD(1)),
    `status_code` Int16 CODEC(T64, ZSTD(1)),
    `status_message` String CODEC(ZSTD(1)),
    `status_code_string` String CODEC(ZSTD(1)),
    `attributes_string` Map(LowCardinality(String), String) CODEC(ZSTD(1)),
    `attributes_number` Map(LowCardinality(String), Float64) CODEC(ZSTD(1)),
    `attributes_bool` Map(LowCardinality(String), Bool) CODEC(ZSTD(1)),
    `resources_string` Map(LowCardinality(String), String) CODEC(ZSTD(1)),
    `events` Array(String) CODEC(ZSTD(2)),
    `links` String CODEC(ZSTD(1)),
    `response_status_code` LowCardinality(String) CODEC(ZSTD(1)),
    `external_http_url` LowCardinality(String) CODEC(ZSTD(1)),
    `http_url` LowCardinality(String) CODEC(ZSTD(1)),
    `external_http_method` LowCardinality(String) CODEC(ZSTD(1)),
    `http_method` LowCardinality(String) CODEC(ZSTD(1)),
    `http_host` LowCardinality(String) CODEC(ZSTD(1)),
    `db_name` LowCardinality(String) CODEC(ZSTD(1)),
    `db_operation` LowCardinality(String) CODEC(ZSTD(1)),
    `has_error` Bool CODEC(T64, ZSTD(1)),
    `is_remote` LowCardinality(String) CODEC(ZSTD(1)),
    `resource_string_service$$name` LowCardinality(String) DEFAULT resources_string['service.name'] CODEC(ZSTD(1)),
    `attribute_string_http$$route` LowCardinality(String) DEFAULT attributes_string['http.route'] CODEC(ZSTD(1)),
    `attribute_string_messaging$$system` LowCardinality(String) DEFAULT attributes_string['messaging.system'] CODEC(ZSTD(1)),
    `attribute_string_messaging$$operation` LowCardinality(String) DEFAULT attributes_string['messaging.operation'] CODEC(ZSTD(1)),
    `attribute_string_db$$system` LowCardinality(String) DEFAULT attributes_string['db.system'] CODEC(ZSTD(1)),
    `attribute_string_rpc$$system` LowCardinality(String) DEFAULT attributes_string['rpc.system'] CODEC(ZSTD(1)),
    `attribute_string_rpc$$service` LowCardinality(String) DEFAULT attributes_string['rpc.service'] CODEC(ZSTD(1)),
    `attribute_string_rpc$$method` LowCardinality(String) DEFAULT attributes_string['rpc.method'] CODEC(ZSTD(1)),
    `attribute_string_peer$$service` LowCardinality(String) DEFAULT attributes_string['peer.service'] CODEC(ZSTD(1)),
    `traceID` FixedString(32) ALIAS trace_id,
    `spanID` String ALIAS span_id,
    `parentSpanID` String ALIAS parent_span_id,
    `spanKind` String ALIAS kind_string,
    `durationNano` UInt64 ALIAS duration_nano,
    `statusCode` Int16 ALIAS status_code,
    `statusMessage` String ALIAS status_message,
    `statusCodeString` String ALIAS status_code_string,
    `references` String ALIAS links,
    `responseStatusCode` LowCardinality(String) ALIAS response_status_code,
    `externalHttpUrl` LowCardinality(String) ALIAS external_http_url,
    `httpUrl` LowCardinality(String) ALIAS http_url,
    `externalHttpMethod` LowCardinality(String) ALIAS external_http_method,
    `httpMethod` LowCardinality(String) ALIAS http_method,
    `httpHost` LowCardinality(String) ALIAS http_host,
    `dbName` LowCardinality(String) ALIAS db_name,
    `dbOperation` LowCardinality(String) ALIAS db_operation,
    `hasError` Bool ALIAS has_error,
    `isRemote` LowCardinality(String) ALIAS is_remote,
    `serviceName` LowCardinality(String) ALIAS `resource_string_service$$name`,
    `httpRoute` LowCardinality(String) ALIAS `attribute_string_http$$route`,
    `msgSystem` LowCardinality(String) ALIAS `attribute_string_messaging$$system`,
    `msgOperation` LowCardinality(String) ALIAS `attribute_string_messaging$$operation`,
    `dbSystem` LowCardinality(String) ALIAS `attribute_string_db$$system`,
    `rpcSystem` LowCardinality(String) ALIAS `attribute_string_rpc$$system`,
    `rpcService` LowCardinality(String) ALIAS `attribute_string_rpc$$service`,
    `rpcMethod` LowCardinality(String) ALIAS `attribute_string_rpc$$method`,
    `peerService` LowCardinality(String) ALIAS `attribute_string_peer$$service`,
    INDEX idx_trace_id trace_id TYPE tokenbf_v1(10000, 5, 0) GRANULARITY 1,
    INDEX idx_span_id span_id TYPE tokenbf_v1(5000, 5, 0) GRANULARITY 1,
    INDEX idx_duration duration_nano TYPE minmax GRANULARITY 1,
    INDEX idx_name name TYPE ngrambf_v1(4, 5000, 2, 0) GRANULARITY 1,
    INDEX idx_kind kind TYPE minmax GRANULARITY 4,
    INDEX idx_http_route `attribute_string_http$$route` TYPE bloom_filter GRANULARITY 4,
    INDEX idx_http_url http_url TYPE bloom_filter GRANULARITY 4,
    INDEX idx_http_host http_host TYPE bloom_filter GRANULARITY 4,
    INDEX idx_http_method http_method TYPE bloom_filter GRANULARITY 4,
    INDEX idx_timestamp timestamp TYPE minmax GRANULARITY 1,
    INDEX idx_rpc_method `attribute_string_rpc$$method` TYPE bloom_filter GRANULARITY 4,
    INDEX idx_response_statusCode response_status_code TYPE set(0) GRANULARITY 1,
    INDEX idx_status_code_string status_code_string TYPE set(3) GRANULARITY 4,
    INDEX idx_kind_string kind_string TYPE set(5) GRANULARITY 4,
    INDEX attributes_string_idx_key mapKeys(attributes_string) TYPE tokenbf_v1(1024, 2, 0) GRANULARITY 1,
    INDEX attributes_string_idx_val mapValues(attributes_string) TYPE ngrambf_v1(4, 5000, 2, 0) GRANULARITY 1,
    INDEX attributes_number_idx_key mapKeys(attributes_number) TYPE tokenbf_v1(1024, 2, 0) GRANULARITY 1,
    INDEX attributes_number_idx_val mapValues(attributes_number) TYPE bloom_filter GRANULARITY 1,
    INDEX attributes_bool_idx_key mapKeys(attributes_bool) TYPE tokenbf_v1(1024, 2, 0) GRANULARITY 1,
    INDEX resources_string_idx_key mapKeys(resources_string) TYPE tokenbf_v1(1024, 2, 0) GRANULARITY 1,
    INDEX resources_string_idx_val mapValues(resources_string) TYPE ngrambf_v1(4, 5000, 2, 0) GRANULARITY 1
)
ENGINE = MergeTree
PARTITION BY toDate(timestamp)
ORDER BY (ts_bucket_start, resource_fingerprint, has_error, name, timestamp)
TTL toDateTime(timestamp) + toIntervalSecond(1296000)
SETTINGS index_granularity = 8192, ttl_only_drop_parts = 1