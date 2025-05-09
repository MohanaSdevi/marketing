# The name of this view in Looker is "Stores Copy"
view: stores_copy {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `marketing_analytics.stores_copy` ;;
  drill_fields: [store_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: store_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.store_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Location" in Explore.

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: manager {
    type: string
    sql: ${TABLE}.manager ;;
  }
  measure: count {
    type: count
    drill_fields: [store_id]
  }
}
