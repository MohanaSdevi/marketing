# The name of this view in Looker is "Nestedbigquery 1"
view: nestedbigquery_1 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `marketing_analytics.nestedbigquery_1` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: col1 {
    hidden: yes
    sql: ${TABLE}.col1 ;;
  }
  measure: count {
    type: count
  }
}

# The name of this view in Looker is "Nestedbigquery 1 Col1"
view: nestedbigquery_1__col1 {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: item_name {
    hidden: yes
    sql: Item_Name ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Nestedbigquery 1 Col1" in Explore.

  dimension: nestedbigquery_1__col1 {
    type: string
    hidden: yes
    sql: nestedbigquery_1__col1 ;;
  }

  dimension: order_id {
    type: string
    sql: Order_Id ;;
  }
}

# The name of this view in Looker is "Nestedbigquery 1 Col1 Item Name"
view: nestedbigquery_1__col1__item_name {

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Nestedbigquery 1 Col1 Item Name" in Explore.

  dimension: nestedbigquery_1__col1__item_name {
    type: string
    sql: nestedbigquery_1__col1__item_name ;;
  }
}
