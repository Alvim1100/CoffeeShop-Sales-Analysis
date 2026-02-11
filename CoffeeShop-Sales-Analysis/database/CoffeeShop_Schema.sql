-- 1. Cria a tabela temporária para receber os dados crus do CSV
CREATE TABLE temp_coffee_sales (
    hour_of_day INT,
    cash_type VARCHAR(50),
    money DECIMAL(10, 2),
    coffee_name VARCHAR(100),
    Time_of_Day VARCHAR(50),
    Weekday VARCHAR(50),
    Month_name VARCHAR(50),
    Weekdaysort INT,
    Monthsort INT,
    Date DATE,
    Time TIME
);

--Dimensão de Produtos
CREATE TABLE Dim_Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(100) UNIQUE NOT NULL
);

--Dimensão de Datas
CREATE TABLE Dim_Dates (
    Date DATE PRIMARY KEY,
    Weekday VARCHAR(50),
    Month_name VARCHAR(50),
    Weekdaysort INT,
    Monthsort INT
);

--Dimensão de Pagamento 
CREATE TABLE Dim_Payment (
    PaymentTypeID SERIAL PRIMARY KEY,
    CashType VARCHAR(50) UNIQUE NOT NULL
);

--Tabela principal FATO para numeros
CREATE TABLE Fact_Sales (
    SaleID SERIAL PRIMARY KEY,
    Date DATE REFERENCES Dim_Dates(Date), -- Chave Estrangeira
    ProductID INT REFERENCES Dim_Products(ProductID), -- Chave Estrangeira
    PaymentTypeID INT REFERENCES Dim_Payment(PaymentTypeID), -- Chave Estrangeira
    hour_of_day INT,
    Time_of_Day VARCHAR(50),
    Time TIME,
    TotalAmount DECIMAL(10, 2)
);

--Popula a Dim_Products
INSERT INTO Dim_Products (ProductName)
SELECT DISTINCT coffee_name FROM temp_coffee_sales;

--Popula a Dim_Payment
INSERT INTO Dim_Payment (CashType)
SELECT DISTINCT cash_type FROM temp_coffee_sales;

--Popula a Dim_Dates
INSERT INTO Dim_Dates (Date, Weekday, Month_name, Weekdaysort, Monthsort)
SELECT DISTINCT
    Date,
    Weekday,
    Month_name,
    Weekdaysort,
    Monthsort
FROM temp_coffee_sales;

--Popula a Fact_Sales
-- Aqui usamos JOINs para trocar os NOMES pelos IDs
INSERT INTO Fact_Sales (
    Date,
    ProductID,
    PaymentTypeID,
    hour_of_day,
    Time_of_Day,
    Time,
    TotalAmount
)
SELECT
    t.Date,
    p.ProductID,     -- O ID do produto (da Dim_Products)
    pay.PaymentTypeID, -- O ID do pagamento (da Dim_Payment)
    t.hour_of_day,
    t.Time_of_Day,
    t.Time,
    t.money        
FROM
    temp_coffee_sales t
JOIN
    Dim_Products p ON t.coffee_name = p.ProductName
JOIN
    Dim_Payment pay ON t.cash_type = pay.CashType;
