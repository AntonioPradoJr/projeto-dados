{# Transforma para caixa baixa e limpa espaços excedentes#}

{% macro clean_text(col_name) %}
    LOWER(TRIM({{col_name}}))
{% endmacro %}