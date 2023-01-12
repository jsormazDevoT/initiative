view: propertyownership {

  view_label: "Persona Insights Demographics"

  dimension: property_ownership_attribute {
    type: string
    sql: ${TABLE}.attribute ;;
  }

  dimension: property_ownership_percent {
    type: number
    sql: ${TABLE}.percentage ;;
  }

  dimension: property_ownership_affinity {
    type: number
    sql: ${TABLE}.affinity ;;
  }

  measure: total_property_ownership_percentage {
    type: sum
    sql: ${property_ownership_percent}/100 ;;
    value_format: "0%"
  }

  measure: total_property_ownership_affinity {
    type: sum
    sql: ${property_ownership_affinity} ;;
    value_format: "0.0"
  }
  }
