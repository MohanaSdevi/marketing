# The name of this view in Looker is "Nestedbigquery"
view: nestedbigquery {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `marketing_analytics.nestedbigquery` ;;
  drill_fields: [order_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }
  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: item_name__item_name {
    hidden: yes
    sql: ${TABLE}.item_name.item_name ;;
    group_label: "Item Name"
    group_item_label: "Item Name"
  }
  measure: count {
    type: count
    drill_fields: [order_id, item_name__item_name]
  }
}

# The name of this view in Looker is "Nestedbigquery Item Name Item Name"
view: nestedbigquery__item_name__item_name {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Nestedbigquery Item Name Item Name" in Explore.

  dimension: nestedbigquery__item_name__item_name {
    type: string
    sql: nestedbigquery__item_name__item_name ;;
  }
}
