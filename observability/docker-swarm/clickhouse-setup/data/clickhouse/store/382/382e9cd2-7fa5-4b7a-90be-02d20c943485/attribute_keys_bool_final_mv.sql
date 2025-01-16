ATTACH MATERIALIZED VIEW _ UUID '0ff59196-b72d-495f-b9b6-469c01b5ca7e' TO signoz_logs.logs_attribute_keys
(
    `name` String,
    `datatype` String
) AS
SELECT DISTINCT
    arrayJoin(mapKeys(attributes_bool)) AS name,
    'Bool' AS datatype
FROM signoz_logs.logs_v2
ORDER BY name ASC
