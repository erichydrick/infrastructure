ATTACH MATERIALIZED VIEW _ UUID '9485377b-0b3d-409c-84a8-ad09c6b1ae79' TO signoz_traces.trace_summary
(
    `trace_id` FixedString(32),
    `start` DateTime64(9),
    `end` DateTime64(9),
    `num_spans` UInt64
) AS
SELECT
    trace_id,
    min(timestamp) AS start,
    max(timestamp) AS end,
    toUInt64(count()) AS num_spans
FROM signoz_traces.signoz_index_v3
GROUP BY trace_id
