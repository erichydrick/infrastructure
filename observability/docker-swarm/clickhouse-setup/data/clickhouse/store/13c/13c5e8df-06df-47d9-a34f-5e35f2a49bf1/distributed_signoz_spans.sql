ATTACH TABLE _ UUID 'dee5d50b-18e0-478c-9f8e-500e9f975b56'
(
    `timestamp` DateTime64(9) CODEC(DoubleDelta, LZ4),
    `traceID` FixedString(32) CODEC(ZSTD(1)),
    `model` String CODEC(ZSTD(9))
)
ENGINE = Distributed('cluster', 'signoz_traces', 'signoz_spans', cityHash64(traceID))
