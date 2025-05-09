connection: "analytics"

include: "/views/**/*.view.lkml"

datagroup: marketing_analytics_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: marketing_analytics_default_datagroup

explore: interactions {
  label: "Interactions Customers Campaigns"
  join: customers {
    type: left_outer
    sql_on: ${interactions.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
  join: campaigns {
    type: left_outer
    sql_on: ${interactions.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }
}

explore: social_media_engagement {
  label: "SocialMediaEngagement Campaigns"
  join: campaigns {
    type: left_outer
    sql_on: ${social_media_engagement.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }
}


explore: transactions {
  label: "Transactions Stores Products Customers"
  join: stores {
    type: left_outer
    sql_on: ${transactions.store_id} = ${stores.store_id} ;;
    relationship: many_to_one
  }
  join: products {
    type: left_outer
    sql_on: ${transactions.product_id} = ${products.product_id} ;;
    relationship: many_to_one
  }
  join: customers {
    type: left_outer
    sql_on: ${transactions.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}
