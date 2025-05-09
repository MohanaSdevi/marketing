connection: "analytics"

include: "/views/**/*.view.lkml"

datagroup: marketing_analytics_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: marketing_analytics_default_datagroup


explore: products {}

explore: campaigns {}

explore: customers {}

explore: interactions {
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
  join: campaigns {
    type: left_outer
    sql_on: ${social_media_engagement.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }
}

explore: social_media_engagement_1 {
  join: campaigns {
    type: left_outer
    sql_on: ${social_media_engagement_1.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }
}

explore: stores {}

explore: transactions {
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
