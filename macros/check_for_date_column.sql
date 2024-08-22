{% macro check_for_date_column(table_name) %}
    {%- set columns = adapter.get_columns_in_relation(ref(table_name)) -%}
    
    {% for column in columns %}
        {% do log('カラム名: ' ~ column.column ~ ', データ型: ' ~ column.data_type, info=True) %}
        {% if column.data_type | lower == "date" %}
            {% do log(table_name ~ ' has a date column.', info=True) %}
            {% do return(true) %}
        {% endif %}
    {% endfor %}
    
    {% do log(table_name ~ ' does not have a date column.', info=True) %}
    {% do return(false) %}
{% endmacro %}