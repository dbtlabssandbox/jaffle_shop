with orders as (

    select * from {{ ref('orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),

final as (

    select
        orders.customer_id,
        min(orders.order_date) as first_order_date,
        max(orders.order_date) as most_recent_order_date,
        count(distinct orders.order_id) as number_of_orders,
        sum(payments.amount) as total_amount

    from orders

    left join payments
        on orders.order_id = payments.order_id

    group by orders.customer_id

)

select * from final
