with source as (
    select * from {{source("jaffle_shop","customers")}}
), 
renamed as (
    SELECT 
        id as customer_id,
        first_name,
        last_name
    FROM source 
)

SELECT * FROM renamed 