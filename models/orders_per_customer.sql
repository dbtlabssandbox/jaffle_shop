with orders as (

    select * from {{ ref('orders') }}

),

final as (

    select
        customer_id,
        count(order_id) as number_of_orders

    from orders

    group by customer_id

)

select * from final
