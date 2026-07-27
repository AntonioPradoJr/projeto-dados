# 🇧🇷 Pipeline de Analytics Engineering — E-Commerce Olist

## Sobre o Projeto

Pipeline completo de dados construído com a stack moderna de Analytics Engineering, utilizando dados reais do e-commerce brasileiro Olist (113k+ pedidos). O projeto segue as melhores práticas do mercado: modelagem em camadas, testes de qualidade, documentação e versionamento.

## Stack Utilizada

- **Warehouse:** Google BigQuery (GCP)
- **Transformação:** dbt (data build tool)
- **Versionamento:** Git + GitHub
- **Visualização:** Looker Studio

## Arquitetura do Pipeline

```
CSV (Kaggle)
    ↓
BigQuery — schema raw (dado bruto)
    ↓
dbt — staging (limpeza e padronização)
    ↓
dbt — marts (métricas e dimensões de negócio)
    ↓
Looker Studio (dashboard)
```

## Estrutura do Projeto

```
models/
├── staging/
│   └── olist/
│       ├── sources.yml
│       ├── _olist_staging.yml          # testes e documentação
│       ├── stg_olist_orders.sql        # pedidos limpos
│       ├── stg_olist_customers.sql     # clientes limpos
│       ├── stg_olist_products.sql      # produtos limpos
│       ├── stg_olist_sellers.sql       # vendedores limpos
│       └── stg_olist_payments.sql      # pagamentos limpos
│
└── marts/
    └── olist/
        ├── _olist_marts.yml            # testes e documentação
        ├── fct_orders.sql              # volume de pedidos por mês
        ├── fct_delivery.sql            # atrasos e prazo de entrega
        ├── fct_payments.sql            # métricas por método de pagamento
        ├── dim_customers.sql           # perfil e recorrência de clientes
        └── dim_products.sql            # produtos com classificação de peso
```

## Modelagem Dimensional

### Tabelas Fato

| Modelo | Descrição | Métricas |
|---|---|---|
| `fct_orders` | Volume de pedidos agrupado por mês e status | Quantidade de pedidos por período |
| `fct_delivery` | Performance de entrega | Dias de atraso, entrega no prazo (sim/não) |
| `fct_payments` | Métricas financeiras por método de pagamento | Quantidade, ticket médio, total pago, média de parcelas |

### Tabelas Dimensão

| Modelo | Descrição | Atributos |
|---|---|---|
| `dim_customers` | Perfil do cliente com comportamento de compra | Cidade, estado, quantidade de pedidos, recorrência |
| `dim_products` | Catálogo de produtos com classificação | Categoria, peso, classificação de peso (leve/médio/pesado) |

## Transformações Aplicadas

### Staging (limpeza)

- `LOWER()` e `TRIM()` — padronização de texto
- `CAST()` — conversão de tipos de dados
- `DATE()` — padronização de datas
- Renomeação de colunas para linguagem de negócio

### Marts (regras de negócio)

- `DATE_DIFF()` — cálculo de dias de atraso na entrega
- `FORMAT_DATE()` — agrupamento por período
- `CASE WHEN` — classificação de peso de produtos
- Agregações: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `DISTINCT` — deduplicação na dimensão de produtos

## Testes de Qualidade

O projeto possui testes automatizados em todas as camadas:

- `not_null` — garante que campos obrigatórios estão preenchidos
- `unique` — garante unicidade de chaves nas dimensões
- `accepted_values` — valida valores esperados (status de pedido, métodos de pagamento)

## Principais Insights

- **92 mil clientes únicos** na base
- **85% dos clientes não são recorrentes** — oportunidade de retenção
- **73.8% dos pagamentos** são feitos com cartão de crédito
- **93.5% das entregas** realizadas dentro do prazo
- Volume de pedidos com tendência de queda nos últimos meses

## Dashboard

[Acesse o dashboard no Looker Studio](https://datastudio.google.com/s/voDQ9-jAqOE)

## Como Executar

1. Clone o repositório:
```bash
git clone https://github.com/AntonioPradoJr/projeto-dados.git
```

2. Configure o dbt Cloud com BigQuery

3. Execute os modelos:
```bash
dbt run
```

4. Execute os testes:
```bash
dbt test
```

## Fonte dos Dados

[Brazilian E-Commerce Public Dataset by Olist — Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

---

# 🇺🇸 Analytics Engineering Pipeline — Olist E-Commerce

## About

End-to-end data pipeline built with the modern Analytics Engineering stack, using real data from Brazilian e-commerce company Olist (113k+ orders). The project follows industry best practices: layered modeling, data quality tests, documentation, and version control.

## Tech Stack

- **Warehouse:** Google BigQuery (GCP)
- **Transformation:** dbt (data build tool)
- **Version Control:** Git + GitHub
- **Visualization:** Looker Studio

## Pipeline Architecture

```
CSV (Kaggle)
    ↓
BigQuery — raw schema (raw data)
    ↓
dbt — staging (cleaning and standardization)
    ↓
dbt — marts (business metrics and dimensions)
    ↓
Looker Studio (dashboard)
```

## Project Structure

```
models/
├── staging/
│   └── olist/
│       ├── sources.yml
│       ├── _olist_staging.yml          # tests and documentation
│       ├── stg_olist_orders.sql        # cleaned orders
│       ├── stg_olist_customers.sql     # cleaned customers
│       ├── stg_olist_products.sql      # cleaned products
│       ├── stg_olist_sellers.sql       # cleaned sellers
│       └── stg_olist_payments.sql      # cleaned payments
│
└── marts/
    └── olist/
        ├── _olist_marts.yml            # tests and documentation
        ├── fct_orders.sql              # order volume by month
        ├── fct_delivery.sql            # delivery delays and on-time rate
        ├── fct_payments.sql            # metrics by payment method
        ├── dim_customers.sql           # customer profile and recurrence
        └── dim_products.sql            # products with weight classification
```

## Dimensional Modeling

### Fact Tables

| Model | Description | Metrics |
|---|---|---|
| `fct_orders` | Order volume grouped by month and status | Order count per period |
| `fct_delivery` | Delivery performance | Delay in days, on-time delivery (yes/no) |
| `fct_payments` | Financial metrics by payment method | Count, average ticket, total paid, average installments |

### Dimension Tables

| Model | Description | Attributes |
|---|---|---|
| `dim_customers` | Customer profile with purchasing behavior | City, state, order count, recurrence |
| `dim_products` | Product catalog with classification | Category, weight, weight class (light/medium/heavy) |

## Applied Transformations

### Staging (cleaning)

- `LOWER()` and `TRIM()` — text standardization
- `CAST()` — data type conversion
- `DATE()` — date standardization
- Column renaming to business-friendly language

### Marts (business rules)

- `DATE_DIFF()` — delivery delay calculation
- `FORMAT_DATE()` — period grouping
- `CASE WHEN` — product weight classification
- Aggregations: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `DISTINCT` — deduplication in product dimension

## Data Quality Tests

Automated tests across all layers:

- `not_null` — ensures required fields are populated
- `unique` — ensures key uniqueness in dimensions
- `accepted_values` — validates expected values (order status, payment methods)

## Key Insights

- **92k unique customers** in the dataset
- **85% of customers are non-recurring** — retention opportunity
- **73.8% of payments** made with credit card
- **93.5% of deliveries** completed on time
- Order volume showing a downward trend in recent months

## Dashboard

[View the dashboard on Looker Studio](https://datastudio.google.com/s/voDQ9-jAqOE)

## How to Run

1. Clone the repository:
```bash
git clone https://github.com/AntonioPradoJr/projeto-dados.git
```

2. Set up dbt Cloud with BigQuery

3. Run the models:
```bash
dbt run
```

4. Run the tests:
```bash
dbt test
```

## Data Source

[Brazilian E-Commerce Public Dataset by Olist — Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
