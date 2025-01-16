ATTACH MATERIALIZED VIEW _ UUID '8b0824bd-e01e-4eed-97b3-2ac374c0eb8a' TO signoz_logs.logs_attribute_keys
(
    `name` String,
    `datatype` String
) AS
SELECT DISTINCT
    arrayJoin(mapKeys(attributes_number)) AS name,
    'Float64' AS datatype
FROM signoz_logs.logs_v2
ORDER BY name ASC
