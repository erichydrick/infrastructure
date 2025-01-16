ATTACH TABLE _ UUID 'a185e15a-c3d8-4227-8a7b-a84e161089b7'
(
    `name` LowCardinality(String) CODEC(ZSTD(1)),
    `serviceName` LowCardinality(String) CODEC(ZSTD(1)),
    `time` DateTime DEFAULT now() CODEC(ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_traces', 'top_level_operations', cityHash64(rand()))
