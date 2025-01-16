ATTACH MATERIALIZED VIEW _ UUID '3b5ce2d8-de68-4468-a329-1e09a909010e' TO signoz_logs.logs_attribute_keys
(
    `name` String,
    `datatype` String
) AS
SELECT DISTINCT
    arrayJoin(mapKeys(attributes_string)) AS name,
    'String' AS datatype
FROM signoz_logs.logs_v2
ORDER BY name ASC
