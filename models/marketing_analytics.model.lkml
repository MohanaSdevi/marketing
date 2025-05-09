connection: "analytics"

include: "/views/**/*.view.lkml"

datagroup: marketing_analytics_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: marketing_analytics_default_datagroup


explore: products {}

explore: campaigns {}

explore: nestedbigquery_1 {
    join: nestedbigquery_1__col1 {
      view_label: "Nestedbigquery 1: Col1"
      sql: LEFT JOIN UNNEST(${nestedbigquery_1.col1}) as nestedbigquery_1__col1 ;;
      relationship: one_to_many
    }
    join: nestedbigquery_1__col1__item_name {
      view_label: "Nestedbigquery 1: Col1 Item Name"
      sql: LEFT JOIN UNNEST(${nestedbigquery_1__col1.item_name}) as nestedbigquery_1__col1__item_name ;;
      relationship: one_to_many
    }
}

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

explore: connection_reg_r3 {}

explore: nestedbigquery {
    join: nestedbigquery__item_name__item_name {
      view_label: "Nestedbigquery: Item Name Item Name"
      sql: LEFT JOIN UNNEST(${nestedbigquery.item_name__item_name}) as nestedbigquery__item_name__item_name ;;
      relationship: one_to_many
    }
}

explore: nestedbigquery_2 {
    join: nestedbigquery_2__item_name__item_name {
      view_label: "Nestedbigquery 2: Item Name Item Name"
      sql: LEFT JOIN UNNEST(${nestedbigquery_2.item_name__item_name}) as nestedbigquery_2__item_name__item_name ;;
      relationship: one_to_many
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

explore: stores_copy {}
