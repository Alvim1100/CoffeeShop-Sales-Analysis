# ☕ Coffee Shop Sales Analysis - Business Intelligence Project

![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![SQL](https://img.shields.io/badge/SQL-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![Data Modeling](https://img.shields.io/badge/Star_Schema-Modeling-blue?style=for-the-badge)

## 📌 Visão Geral (Overview)
Este projeto consiste em um dashboard de Business Intelligence desenvolvido para analisar as operações de venda de uma rede de cafeterias. O objetivo foi transformar dados brutos de transações em insights acionáveis sobre comportamento do consumidor, performance de produtos e tendências sazonais.

O projeto abrange desde a modelagem do banco de dados (SQL) até a visualização final (Power BI).

---

## 🖼️ Dashboard Preview
> *Nota: Como o relatório é interativo, abaixo estão capturas de tela das principais visões.*

### 1. Visão Geral de Vendas
![Overview](images/overview.png)
<img width="1510" height="848" alt="image" src="https://github.com/user-attachments/assets/6606fcfe-a8fa-4d4e-a206-88e67ccbf40b" />


### 2. Análise por Produto
![Products](images/details.png)
<img width="1510" height="851" alt="image" src="https://github.com/user-attachments/assets/404bdda1-7ba0-45de-8e0d-ace51d4a1070" />


---

## 💼 Problema de Negócio
A gerência da cafeteria precisava responder a perguntas estratégicas que os dados brutos (CSVs) não respondiam facilmente:
* Quais são os horários de pico de vendas?
* Quais produtos têm a melhor performance de vendas?
* Existe sazonalidade nas vendas (dias da semana ou meses específicos)?

---

## 🛠️ Tecnologias e Técnicas Utilizadas

### 1. SQL (Data Engineering)
* Criação da estrutura do banco de dados utilizando o script `CoffeShop.sql`.
* Definição de **Primary Keys** e **Foreign Keys** para garantir a integridade dos dados.

### 2. Modelagem de Dados (Star Schema)
Os dados foram estruturados em um modelo dimensional (Star Schema) para otimizar a performance do Power BI:
* **Tabela Fato (`fact_sales`):** Contém as transações e métricas quantitativas.
* **Tabelas Dimensão (`dim_products`, `dim_payment`, `dim_dates`):** Contém os contextos descritivos para filtragem.

### 3. Power BI (Data Visualization)
* **ETL:** Importação e tratamento dos dados.
* **DAX:** Criação de medidas calculadas para análise de faturamento e contagem de pedidos.
* **Storytelling:** Layout focado em facilitar a tomada de decisão rápida.

---

## 📊 Estrutura dos Dados

| Tabela | Descrição |
| :--- | :--- |
| `fact_sales` | Registro de cada venda individual, conectada às dimensões via IDs. |
| `dim_products` | Detalhes dos produtos (Nome, Categoria, Preço Unitário). |
| `dim_dates` | Tabela calendário para análise temporal. |

---

## 🚀 Como Executar o Projeto
1. Clone este repositório.
2. Os dados brutos estão na pasta `/data`.
3. O script de criação do banco está em `/database`.
4. Para visualizar o dashboard, abra o arquivo `.pbix` na pasta `/dashboard` utilizando o **Power BI Desktop**.

---

## 📢 Conclusão e Insights
* A performance geral da cafeteria é sólida em termos de volume, com uma demanda bem distribuída ao longo dos períodos (Manhã, Tarde e Noite).
* Identificou-se que segmento noturno gera o maior valor total com o menor volume de vendas.
* O produto com menos taxa de venda em todos os períodos do dia é o "Espresso".

---

**Autor:** Eric Weber Alvim
https://www.linkedin.com/in/eric-weber-alvim/
