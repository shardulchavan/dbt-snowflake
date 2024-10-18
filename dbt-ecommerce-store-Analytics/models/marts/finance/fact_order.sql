with orders as (
    SELECT * FROM {{ref('stage_shop_orders')}}
),
payments as (
    SELECT * FROM {{ref('stage_stripe__payments')}}
),
order_payments as (
    SELECT 
    order_id, 
    sum(case when status ='success' then amount end) as amount
    FROM payments 
    group by 1
),
    final as (
        SELECT orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payments.amount,0) as amount
        FROM orders
        LEFT JOIN order_payments USING (order_id)
)

SELECT * FROM final

