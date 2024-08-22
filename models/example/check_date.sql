-- models/verify_date_columns.sql
select
    '{{ ref('my_first_dbt_model') }}' as table_name,
    
    {{ check_for_date_column('my_first_dbt_model') }} as has_date_column
from
    {{ ref('my_first_dbt_model') }}