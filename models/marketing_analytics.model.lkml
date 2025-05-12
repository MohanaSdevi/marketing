connection: "analytics"

include: "/views/**/*.view.lkml"

datagroup: marketing_analytics_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: marketing_analytics_default_datagroup

explore: customers {
  label: "Marketing Analytics"

  sql_always_where: ${products.category} IS NOT NULL
                    AND ${campaigns.type} IS NOT NULL
                    AND ${interactions.type} IS NOT NULL ;;

  join: transactions {
    sql_on: ${customers.customer_id} = ${transactions.customer_id} ;;
    relationship: one_to_many
  }
  join: interactions {
    sql_on: ${customers.customer_id} = ${interactions.customer_id} ;;
    relationship: one_to_many
  }
  join: products {
    sql_on: ${transactions.product_id} = ${products.product_id} ;;
    relationship: many_to_one
  }
  join: stores {
    sql_on: ${transactions.store_id} = ${stores.store_id} ;;
    relationship: many_to_one
  }
  join: campaigns {
    sql_on: ${interactions.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: one_to_many
  }
  join: social_media_engagement {
    sql_on: ${campaigns.campaign_id} = ${social_media_engagement.campaign_id} ;;
    relationship: one_to_many
  }
}
