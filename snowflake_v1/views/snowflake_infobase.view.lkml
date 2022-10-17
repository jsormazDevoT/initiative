view: snowflake_infobase {
  sql_table_name: "airbyte-dev-snowflake-glue-ctg-db".snowflake_infobase
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

  dimension: category {
    type: string
    sql: ${_airbyte_data}.category ;;
  }

  dimension: statement {
    type: string
    sql: ${_airbyte_data}.statement ;;
  }

  dimension: genpop_cnt {
    type: number
    sql: ${_airbyte_data}.genpop_cnt ;;
  }

  dimension: genpop_total {
    type: number
    sql: ${_airbyte_data}.genpop_total ;;
  }

  dimension: genpop_percent {
    type: number
    sql: ${_airbyte_data}.genpop_percent ;;
  }

  dimension: target_cnt {
    type: number
    sql: ${_airbyte_data}.target_cnt ;;
  }

  dimension: target_total {
    type: number
    sql: ${_airbyte_data}.target_total ;;
  }

  dimension: target_percent {
    type: number
    sql: ${_airbyte_data}.target_percent ;;
  }

  dimension: target_index {
    type: number
    sql: ${_airbyte_data}.target_index ;;
  }

  dimension: agency {
    type: string
    sql: ${_airbyte_data}.agency ;;
  }

  dimension: client {
    type: string
    sql: ${_airbyte_data}.client ;;
  }

  dimension: audience_name {
    type: string
    sql: ${_airbyte_data}.audience_name ;;
    suggestions: ["Guy.Fieri.Foodies.and.Indulgers", "Statement.Seekers.18.24", "Brand.Competitors"]
  }

  dimension: created {
    type: string
    sql: ${_airbyte_data}.created ;;
  }

  dimension: infobase_version {
    type: string
    sql: ${_airbyte_data}.infobase_version ;;
  }

  dimension: source {
    type: string
    sql: ${_airbyte_data}.source ;;
  }

  dimension: audience_size {
    type: string
    sql: ${_airbyte_data}.audience_size ;;
  }

  dimension: _ab_source_file_last_modified {
    type: date
    sql: ${_airbyte_data}._ab_source_file_last_modified ;;
  }

  dimension: _ab_source_file_url {
    type: string
    sql: ${_airbyte_data}._ab_source_file_url ;;
  }

  dimension: demo_age {
    hidden: yes
    type: string
    sql: CASE WHEN ${statement} IN ('DEMO_AGE_RANGE_HOH_18_24', 'DEMO_AGE_RANGE_HOH_25_29',
    'DEMO_AGE_RANGE_HOH_30_34', 'DEMO_AGE_RANGE_HOH_35_39', 'DEMO_AGE_RANGE_HOH_40_44',
    'DEMO_AGE_RANGE_HOH_45_49', 'DEMO_AGE_RANGE_HOH_50_54', 'DEMO_AGE_RANGE_HOH_55_59',
    'DEMO_AGE_RANGE_HOH_60_64', 'DEMO_AGE_RANGE_HOH_65PLUS') THEN  ${statement}
    ELSE NULL END;;
  }

  dimension: age {
    type: string
    sql: substring (${demo_age}, 20) ;;
  }

  dimension: demo_ethnicity {
    type: string
    sql: CASE WHEN ${statement} IN ('DEMO_ETHNICITY_INDIVIDUAL_AFRICAN_AMERICAN',
    'DEMO_ETHNICITY_INDIVIDUAL_ASIAN', 'DEMO_ETHNICITY_INDIVIDUAL_HISPANIC',
    'DEMO_ETHNICITY_INDIVIDUAL_WHITE') THEN  ${statement}
    ELSE NULL END;;
  }

  dimension: ethnicity {
    type: string
    sql: substring (${demo_ethnicity}, 27) ;;
  }

  dimension: demo_gender {
    hidden: yes
    type: string
    sql: CASE WHEN ${statement} IN ('DEMO_GENDER_HOH_FEMALE', 'DEMO_GENDER_HOH_MALE') THEN  ${statement}
    ELSE NULL END;;
  }

  dimension: gender {
    type: string
    sql: substring (${demo_gender}, 17) ;;
  }

  dimension: demo_home_ownership {
    hidden: yes
    type: string
    sql: CASE WHEN ${statement} IN ('DEMO_HOME_OWNER', 'DEMO_HOME_RENTER') THEN  ${statement}
      ELSE NULL END;;
  }

  dimension: home_ownership {
    type: string
    sql: substring (${demo_home_ownership}, 6) ;;
  }

  dimension: demo_prefer_language {
    hidden: yes
    type: string
    sql: CASE WHEN ${statement} IN ('DEMO_PREFER_LANGUAGE_INDIVIDUAL_BILINGUAL_SPANISH_ENGLISH',
              'DEMO_PREFER_LANGUAGE_INDIVIDUAL_NON_HISPANIC', 'DEMO_PREFER_LANGUAGE_INDIVIDUAL_SPANISH',
              'DEMO_PREFER_LANGUAGE_INDIVIDUAL_SPEAK_SPANISH') THEN  ${statement}
      ELSE NULL END;;
  }

  dimension: prefer_language {
    type: string
    sql: substring (${demo_prefer_language}, 33) ;;
  }

  measure: target_percentage {
    type: sum
    sql: ${target_percent} ;;
    value_format_name: percent_1
  }

  measure: genpop_percentage {
    type: sum
    sql: ${genpop_percent} ;;
    value_format_name: percent_1
  }

  measure: index {
    type: sum
    sql: ${target_index} ;;
    value_format: "0"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
