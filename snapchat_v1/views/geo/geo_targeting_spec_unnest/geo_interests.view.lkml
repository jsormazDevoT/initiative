view: geo_interests {

    view_label: "Targeting Audience Filters"

    dimension: interest{
      hidden: yes
      type: string
      sql: ${TABLE} ;;
    }

  }

  view: geo_interest_category {
    view_label: "Targeting Audience Filters"
    dimension: category_id{
      label: "Interest Category ID"
      type: string
      sql: ${TABLE} ;;
    }
  }
