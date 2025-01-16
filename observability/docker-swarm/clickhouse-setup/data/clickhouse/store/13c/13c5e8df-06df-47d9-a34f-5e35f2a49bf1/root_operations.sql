ATTACH MATERIALIZED VIEW _ UUID 'a20393d8-6a0d-49e2-8051-f0c0d6433f0c' TO signoz_traces.top_level_operations
(
    `name` LowCardinality(String),
    `serviceName` LowCardinality(String)
) AS
SELECT DISTINCT
    name,
    `resource_string_service$$name` AS serviceName
FROM signoz_traces.signoz_index_v3
WHERE parent_span_id = ''
