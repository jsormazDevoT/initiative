connection: "insights_athena"

include: "/amazon/**/*.view"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

datagroup: insights_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: insights_default_datagroup

explore: persona_demographics{

    join: persona_demographics_propertyownership {
      relationship: one_to_many
      sql: ,
          unnest(
            _airbyte_data.response.propertyownership
          ) t(persona_demographics_propertyownership) ;;
    }

  join: persona_demographics_income {
    relationship: one_to_many
    sql: ,
          unnest(
            _airbyte_data.response.income
          ) t(persona_demographics_income) ;;
  }

  join: persona_demographics_relationship {
    relationship: one_to_many
    sql: ,
          unnest(
            _airbyte_data.response.relationship
          ) t(persona_demographics_relationship) ;;
  }

  join: persona_demographics_gender {
    relationship: one_to_many
    sql: ,
          unnest(
            _airbyte_data.response.gender
          ) t(persona_demographics_gender) ;;
  }

  join: persona_demographics_age {
    relationship: one_to_many
    sql: ,
          unnest(
            _airbyte_data.response.age
          ) t(persona_demographics_age) ;;
  }
  }




# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
