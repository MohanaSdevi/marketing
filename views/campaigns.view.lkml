# The name of this view in Looker is "Campaigns"
view: campaigns {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `marketing_analytics.campaigns` ;;
  drill_fields: [campaign_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: campaign_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  # dimension: budget {
  #   type: number
  #   sql: ${TABLE}.budget ;;
  # }


  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.start_date ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: budget {
    type: sum
    sql: ${TABLE}.budget ;;
    value_format: "#,##0"
  }

  measure: count {
    type: count
    drill_fields: [campaign_id, name, interactions.count, social_media_engagement.count, social_media_engagement_1.count]
  }
}
