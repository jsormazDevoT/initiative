connection: "insights_athena"

# include all the views
include: "/views/**/*.view"

datagroup: insights_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: insights_default_datagroup

explore: snap {}
