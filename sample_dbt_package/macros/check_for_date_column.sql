{% macro check_for_date_column(table_name) %}
    {%- set columns = adapter.get_columns_in_relation(ref(table_name)) -%}
    
    {% for column in columns %}
        {% if "date" in column.data_type %}
            {% do log(table_name ~ ' has a date column.', info=True) %}
            {% do return(true) %}
        {% endif %}
    {% endfor %}
    
    {% do log(table_name ~ ' does not have a date column.', info=True) %}
    {% do return(false) %}
{% endmacro %}