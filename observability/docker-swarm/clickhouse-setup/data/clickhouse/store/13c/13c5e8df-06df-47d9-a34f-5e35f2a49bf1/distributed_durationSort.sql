ATTACH TABLE _ UUID '42044bdc-700f-4af3-909f-f8dabe6d87d2'
(
    `timestamp` DateTime64(9) CODEC(DoubleDelta, LZ4),
    `traceID` FixedString(32) CODEC(ZSTD(1)),
    `spanID` String CODEC(ZSTD(1)),
    `parentSpanID` String CODEC(ZSTD(1)),
    `serviceName` LowCardinality(String) CODEC(ZSTD(1)),
    `name` LowCardinality(String) CODEC(ZSTD(1)),
    `kind` Int8 CODEC(T64, ZSTD(1)),
    `durationNano` UInt64 CODEC(T64, ZSTD(1)),
    `statusCode` Int16 CODEC(T64, ZSTD(1)),
    `httpMethod` LowCardinality(String) CODEC(ZSTD(1)),
    `httpUrl` LowCardinality(String) CODEC(ZSTD(1)),
    `httpRoute` LowCardinality(String) CODEC(ZSTD(1)),
    `httpHost` LowCardinality(String) CODEC(ZSTD(1)),
    `hasError` Bool CODEC(T64, ZSTD(1)),
    `rpcSystem` LowCardinality(String) CODEC(ZSTD(1)),
    `rpcService` LowCardinality(String) CODEC(ZSTD(1)),
    `rpcMethod` LowCardinality(String) CODEC(ZSTD(1)),
    `responseStatusCode` LowCardinality(String) CODEC(ZSTD(1)),
    `stringTagMap` Map(String, String) CODEC(ZSTD(1)),
    `numberTagMap` Map(String, Float64) CODEC(ZSTD(1)),
    `boolTagMap` Map(String, Bool) CODEC(ZSTD(1)),
    `isRemote` LowCardinality(String) CODEC(ZSTD(1)),
    `statusMessage` String CODEC(ZSTD(1)),
    `statusCodeString` String CODEC(ZSTD(1)),
    `spanKind` String CODEC(ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_traces', 'durationSort', cityHash64(traceID))
