view: audience_insights {
  sql_table_name: "airbyte-dev-linkedin-ads-glue-ctg-db".audience_insights
    ;;
  # suggestions: no

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

  dimension: response {
    hidden: yes
    type: string
    sql: ${_airbyte_data}.response ;;
  }

  dimension: response_value {
    hidden: yes
    type: string
    sql: ${response}.value ;;
  }

  dimension: audienceinsight {
    hidden: yes
    type: string
    sql: ${response_value}.audienceinsight ;;
  }

   dimension: totalaudiencecount {
     type: number
    sql: ${response_value}.totalaudiencecount;;
   }

  dimension: groupedby {
    type: string
    sql: ${audienceinsight}.groupedby ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
