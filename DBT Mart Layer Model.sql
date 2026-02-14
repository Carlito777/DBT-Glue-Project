-- I'm Fetch the distinct continent names for the transform table by running the query below in Snowflake. 

 SELECT DISTINCT COUNTRY_CONTINENT_NAME FROM GLUEDB.TRANSFORM.COUNTRY_DETAILS_TRANSFORM;


--Based on these continents we will create our respective mart tables
-- DBT CREATE TABLES


-- country_details_antarctica.sql -- TABLE
{{
config
({
"materialized":'table',
"schema": 'MART'
})
}}
WITH country_details_antarctica AS
(
SELECT *
FROM
{{ ref('country_details_transform') }}
WHERE UPPER(COUNTRY_CONTINENT_NAME) = 'ANTARCTICA'
)
SELECT *
FROM country_details_antarctica

-- country_details_north_america.sql  -- TABLE
{{
config
({
"materialized":'table',
"schema": 'MART'
})
}}
WITH country_details_north_america AS
(
SELECT *
FROM
{{ ref('country_details_transform') }}
WHERE UPPER(COUNTRY_CONTINENT_NAME) = 'NORTH AMERICA'
) 
SELECT *
FROM country_details_north_america

-- country_details_south_america.sql  -- TABLE
{{
config
({
"materialized":'table',
"schema": 'MART'
})
}} 
WITH country_details_south_america AS
(
SELECT *
FROM
{{ ref('country_details_transform') }}
WHERE UPPER(COUNTRY_CONTINENT_NAME) = 'SOUTH AMERICA'
) 
SELECT *
FROM country_details_south_america

--  country_details_europe.sql -- TABLE
{{
config
({
"materialized":'table',
"schema": 'MART'
})
}} 
WITH country_details_europe AS
(
SELECT *
FROM
{{ ref('country_details_transform') }}
WHERE UPPER(COUNTRY_CONTINENT_NAME) = 'EUROPE'
) 
SELECT *
FROM country_details_europe

-- country_details_africa.sql -- TABLE
{{
config
({
"materialized":'table',
"schema": 'MART'
})
}} 
WITH country_details_africa AS
(
SELECT *
FROM
{{ ref('country_details_transform') }}
WHERE UPPER(COUNTRY_CONTINENT_NAME) = 'AFRICA'
) 
SELECT *
FROM country_details_africa

-- country_details_asia.sql -- TABLE
{{
config
({
"materialized":'table',
"schema": 'MART'
})
}} 
WITH country_details_asia AS
(
SELECT *
FROM
{{ ref('country_details_transform') }}
WHERE UPPER(COUNTRY_CONTINENT_NAME) = 'ASIA'
) 
SELECT *
FROM country_details_asia

-- country_details_oceania.sql -- TABLE
{{
config
({
"materialized":'table',
"schema": 'MART'
})
}} 
WITH country_details_oceania AS
(
SELECT *
FROM
{{ ref('country_details_transform') }}
WHERE UPPER(COUNTRY_CONTINENT_NAME) = 'OCEANIA'
) 
SELECT *
FROM country_details_oceanina

-- mart.yml -- Configuration file
version: 2

 

models:

    - name: country_details_antarctica

      description: "dbt model to create the country details mart table for antartica continent"

      columns:

          - name: "(country_common_name||country_continent_name||country_currency_name)"

            description: "The primary key combination for this table"

            tests:

                - unique

                - not_null

          - name: country_continent_name

            description: "The column contain continent of the country"

            tests:

                - accepted_values:

                    values: ['Antarctica']

 

    - name: country_details_north_america

      description: "dbt model to create the country details mart table for north america continent"

      columns:

          - name: "(country_common_name||country_continent_name||country_currency_name)"

            description: "The primary key combination for this table"

            tests:

                - unique

                - not_null

          - name: country_continent_name

            description: "The column contain continent of the country"

            tests:

                - accepted_values:

                    values: ['North America']

 

    - name: country_details_south_america

      description: "dbt model to create the country details mart table for south america continent"

      columns:

          - name: "(country_common_name||country_continent_name||country_currency_name)"

            description: "The primary key combination for this table"

            tests:

                - unique

                - not_null

          - name: country_continent_name

            description: "The column contain continent of the country"

            tests:

                - accepted_values:

                    values: ['South America']

 

    - name: country_details_europe

      description: "dbt model to create the country details mart table for europe continent"

      columns:

          - name: "(country_common_name||country_continent_name||country_currency_name)"

            description: "The primary key combination for this table"

            tests:

                - unique

                - not_null

          - name: country_continent_name

            description: "The column contain continent of the country"

            tests:

                - accepted_values:

                    values: ['Europe']

 

    - name: country_details_africa

      description: "dbt model to create the country details mart table for africa continent"

      columns:

          - name: "(country_common_name||country_continent_name||country_currency_name)"

            description: "The primary key combination for this table"

            tests:

                - unique

                - not_null

          - name: country_continent_name

            description: "The column contain continent of the country"

            tests:

                - accepted_values:

                    values: ['Africa']

 

    - name: country_details_asia

      description: "dbt model to create the country details mart table for asia continent"

      columns:

          - name: "(country_common_name||country_continent_name||country_currency_name)"

            description: "The primary key combination for this table"

            tests:

                - unique

                - not_null

          - name: country_continent_name

            description: "The column contain continent of the country"

            tests:

                - accepted_values:

                    values: ['Asia']

 

    - name: country_details_oceania

      description: "dbt model to create the country details mart table for oceania continent"

      columns:

          - name: "(country_common_name||country_continent_name||country_currency_name)"

            description: "The primary key combination for this table"

            tests:

                - unique

                - not_null

          - name: country_continent_name

            description: "The column contain continent of the country"

            tests:

                - accepted_values:

                    values: ['Oceania']








 
