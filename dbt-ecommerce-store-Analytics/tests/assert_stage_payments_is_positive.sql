WITH payments as (
    SELECT * FROM {{ref("stage_stripe__payments")}}
)

SELECT order_id,
    sum(amount) as total_amount
FROM
    payments
GROUP BY 
    order_id
HAVING
    total_amount < 0 

