# The name of this view in Looker is "Social Media Engagement"
view: social_media_engagement {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `marketing_analytics.social_media_engagement` ;;
  drill_fields: [engagement_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: engagement_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.engagement_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Campaign ID" in Explore.

  dimension: campaign_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  measure: comments {
    type: sum
    sql: ${TABLE}.comments ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: engagement {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.engagement_date ;;
  }

  measure: likes {
    type: sum
    sql: ${TABLE}.likes ;;
  }

  dimension: post_id {
    type: string
    sql: ${TABLE}.post_id ;;
  }

  measure: shares {
    type: sum
    sql: ${TABLE}.shares ;;
  }
  measure: count {
    type: count
    drill_fields: [engagement_id, campaigns.name, campaigns.campaign_id]
  }
}
