view: audience_targeting_criteria {

  dimension: urn {
    sql: ${TABLE}.urn ;;
  }

  dimension: value {
    sql: ${TABLE}.value ;;
  }

  }

view: audience_targeting_criteria_value {
  dimension: audience_targeting_criteria_value {
    label: "Value"
    sql: ${TABLE} ;;
  }
}
