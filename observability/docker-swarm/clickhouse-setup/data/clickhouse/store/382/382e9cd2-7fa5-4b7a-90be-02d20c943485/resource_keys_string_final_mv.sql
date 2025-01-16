ATTACH MATERIALIZED VIEW _ UUID '5625c88f-7fa4-4ae7-b096-d1596f887616' TO signoz_logs.logs_resource_keys
(
    `name` String,
    `datatype` String
) AS
SELECT DISTINCT
    arrayJoin(mapKeys(resources_string)) AS name,
    'String' AS datatype
FROM signoz_logs.logs_v2
ORDER BY name ASC
