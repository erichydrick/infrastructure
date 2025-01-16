ATTACH TABLE _ UUID 'ba6fa0bb-20b9-4b50-b9fe-62c3a720f62c'
(
    `trace_id` String CODEC(ZSTD(1)),
    `start` SimpleAggregateFunction(min, DateTime64(9)) CODEC(ZSTD(1)),
    `end` SimpleAggregateFunction(max, DateTime64(9)) CODEC(ZSTD(1)),
    `num_spans` SimpleAggregateFunction(sum, UInt64) CODEC(ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_traces', 'trace_summary', cityHash64(trace_id))
