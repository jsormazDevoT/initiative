view: targeting_device_os_type {
  sql_table_name: "airbyte-dev-snapchat-marketing-glue-ctg-db".targeting_device_os_type
    ;;
  suggestions: no

  dimension: _airbyte_ab_id {
    type: string
    sql: ${TABLE}._airbyte_ab_id ;;
  }

  dimension: _airbyte_data {
    type: string
    sql: ${TABLE}._airbyte_data ;;
  }

  dimension: _airbyte_emitted_at {
    type: number
    sql: ${TABLE}._airbyte_emitted_at ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
