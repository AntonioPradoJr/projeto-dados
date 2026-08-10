{#Transforma para float64#}

{% macro cast_float64(col_name) %}
    CAST({{ col_name }} AS FLOAT64) AS {{ col_name }}
{% endmacro %}