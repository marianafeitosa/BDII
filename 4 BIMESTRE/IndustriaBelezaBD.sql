--Criando Banco de Dados
CREATE DATABASE IndustriaBeleza; 
USE IndustriaBeleza; 


--Criação das tabelas 

-- Tabela Regiao
CREATE TABLE Regiao (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT
);

-- Tabela Ponto_Estrategico
CREATE TABLE Ponto_Estrategico (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco TEXT,
    codigo_regiao INT,
    FOREIGN KEY (codigo_regiao) REFERENCES Regiao(codigo)
);

-- Tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco TEXT,
    telefone VARCHAR(15)
);

-- Tabela Vendedor 
CREATE TABLE Vendedor (
    id_vendedor INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(15),
    email VARCHAR(100),
    codigo_da_regiao INT,
    FOREIGN KEY (codigo_da_regiao) REFERENCES Regiao(codigo)
);

-- Tabela Veiculo 
CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY,
    placa VARCHAR(10),
    modelo VARCHAR(50),
    ano INT,
    id_vendedor INT,
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor)
);

-- Tabela Locacao
CREATE TABLE Locacao (
    id_veiculo INT,
    id_vendedor INT,
    data DATE,
    PRIMARY KEY (id_veiculo, id_vendedor, data),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor)
);

-- Tabela Produto
CREATE TABLE Produto (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    preco DECIMAL(10, 2),
    quant_estoque INT
);

-- Tabela Nota_Fiscal
CREATE TABLE Nota_Fiscal (
    id_nota_fiscal INT PRIMARY KEY,
    id_cliente INT,
    data DATE,
    id_vendedor INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor)
);

-- Tabela Item_Nota_Fiscal
CREATE TABLE Item_Nota_Fiscal (
    id INT PRIMARY KEY,
    id_nota_fiscal INT,
    id_produto INT,
    quant_vendida INT,
    FOREIGN KEY (id_nota_fiscal) REFERENCES Nota_Fiscal(id_nota_fiscal),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);


-- Inserts para a tabela Regiao
INSERT INTO Regiao (codigo, nome, descricao) VALUES
(1, 'Região Norte', 'Estados do norte do Brasil'),
(2, 'Região Sul', 'Estados do sul do Brasil'),
(3, 'Região Sudeste', 'Estados do sudeste do Brasil'),
(4, 'Região Centro-Oeste', 'Estados do centro-oeste do Brasil'),
(5, 'Região Nordeste', 'Estados do nordeste do Brasil');

-- Inserts para a tabela Ponto_Estrategico
INSERT INTO Ponto_Estrategico (id, nome, endereco, codigo_regiao) VALUES
(1, 'Ponto de Vendas Amazonas', 'Av. Manaus, 200, Manaus', 1),
(2, 'Ponto Sul', 'Rua Paraná, 45, Curitiba', 2),
(3, 'Ponto de Acesso São Paulo', 'Rua Paulista, 100, São Paulo', 3),
(4, 'Centro Oeste Atacadista', 'Av. Goiás, 75, Goiânia', 4),
(5, 'Nordeste Center', 'Rua Bahia, 88, Salvador', 5);

-- Inserts para a tabela Cliente
INSERT INTO Cliente (id_cliente, nome, endereco, telefone) VALUES
(1, 'Luiz', 'Rua das Flores, 123, Brasília', '(61) 91234-5678'),
(2, 'Ana Luisa', 'Avenida Brasil, 456, Rio de Janeiro', '(21) 98765-4321'),
(3, 'Sofia', 'Rua dos Limoeiros, 789, Belo Horizonte', '(31) 99876-5432'),
(4, 'Larissa', 'Praça das Águas, 321, São Paulo', '(11) 93456-7890'),
(5, 'Marcos', 'Alameda das Palmeiras, 654, Porto Alegre', '(51) 91234-0987');

-- Inserts para a tabela Vendedor
INSERT INTO Vendedor (id_vendedor, nome, telefone, email, codigo_da_regiao) VALUES
(1, 'Giovana', '(61) 90000-0001', 'giovana@gmail.com', 1),
(2, 'Nicole', '(21) 90000-0002', 'nicole@gmail.com', 2),
(3, 'Jorge', '(31) 90000-0003', 'jorge@gmail.com', 3),
(4, 'Laura', '(11) 90000-0004', 'laura@gmail.com', 4),
(5, 'Fernanda', '(51) 90000-0005', 'fernanda@gmail.com', 5);

-- Inserts para a tabela Veiculo
INSERT INTO Veiculo (id_veiculo, placa, modelo, ano, id_vendedor) VALUES
(1, 'ABC-1A2', 'Fusca', 1974, 1),
(2, 'XYZ-3B4', 'Civic', 2020, 2),
(3, 'DEF-5C6', 'Corolla', 2021, 3),
(4, 'GHI-7D8', 'Fiesta', 2022, 4),
(5, 'JKL-9E0', 'Onix', 2023, 5);

-- Inserts para a tabela Locacao
INSERT INTO Locacao (id_veiculo, id_vendedor, data) VALUES
(1, 1, '2023-10-01'),
(2, 2, '2023-10-05'),
(3, 3, '2023-10-10'),
(4, 4, '2023-10-15'),
(5, 5, '2023-10-20');

-- Inserts para a tabela Produto
INSERT INTO Produto (id_produto, nome, descricao, preco, quant_estoque) VALUES
(1, 'Rádio', 'Rádio para carro', 12.99, 150),
(2, 'Capas para banco', 'Protetores para os bancos do carro', 5.50, 200),
(3, 'Câmeras de ré', 'Câmeras que ajudam na visualização ao dar marcha à ré.', 3.00, 300),
(4, 'Suportes para celular', 'Permitem fixar o celular em um local acessível.', 1.50, 1000),
(5, 'Organizadores ', 'Organizadores para carro', 4.75, 250);
(6, 'Antena', 'Antena', 3.50, 100);

-- Inserts para a tabela Nota_Fiscal
INSERT INTO Nota_Fiscal (id_nota_fiscal, id_cliente, data, id_vendedor) VALUES
(1, 1, '2023-10-02', 1),
(2, 2, '2023-10-06', 2),
(3, 3, '2023-10-11', 3),
(4, 4, '2023-10-16', 4),
(5, 5, '2023-10-21', 5);

-- Inserts para a tabela Item_Nota_Fiscal
INSERT INTO Item_Nota_Fiscal (id, id_nota_fiscal, id_produto, quant_vendida) VALUES
(1, 1, 1, 3),
(2, 2, 2, 1),
(3, 3, 3, 5),
(4, 4, 4, 10),
(5, 5, 5, 2);

-- Ver os dados da tabela Regiao
SELECT * FROM Regiao;

-- Ver os dados da tabela Ponto_Estrategico
SELECT * FROM Ponto_Estrategico;

-- Ver os dados da tabela Cliente
SELECT * FROM Cliente;

-- Ver os dados da tabela Vendedor
SELECT * FROM Vendedor;

-- Ver os dados da tabela Veiculo
SELECT * FROM Veiculo;

-- Ver os dados da tabela Locacao
SELECT * FROM Locacao;

-- Ver os dados da tabela Produto
SELECT * FROM Produto;

-- Ver os dados da tabela Nota_Fiscal
SELECT * FROM Nota_Fiscal;

-- Ver os dados da tabela Item_Nota_Fiscal
SELECT * FROM Item_Nota_Fiscal;

-- CONSULTAS REALIZADAS
-- A – Listar todos os pontos estratégicos de cada região.
SELECT 
    R.nome AS Nome_Regiao,
    P.nome AS Nome_Ponto_Estrategico
FROM 
    Regiao R
JOIN 
    Ponto_Estrategico P ON R.codigo = P.codigo_regiao;

-- B – Listar os nomes das regiões cadastradas.
SELECT 
    nome AS Nome_Regiao
FROM 
    Regiao;

--C – Listar todos os vendedores e quais veículos que eles utilizaram no último mês.
SELECT 
    V.nome AS Nome_Vendedor,
    VE.modelo AS Modelo_Veiculo
FROM 
    Vendedor V
JOIN 
    Veiculo VE ON V.id_vendedor = VE.id_vendedor
JOIN 
    Locacao L ON VE.id_veiculo = L.id_veiculo
WHERE 
    L.data >= DATEADD(MONTH, -1, GETDATE()); 

--D – Listar todos os vendedores responsáveis por cada região.
   SELECT 
    R.nome AS Nome_Regiao,
    V.nome AS Nome_Vendedor
FROM 
    Regiao R
JOIN 
    Vendedor V ON R.codigo = V.codigo_da_regiao;

--E – Todos os produtos vendidos por um determinado vendedor.
DECLARE @id_vendedor INT = 1;  

SELECT 
    P.nome AS Nome_Produto
FROM 
    Produto P
JOIN 
    Item_Nota_Fiscal INF ON P.id_produto = INF.id_produto
JOIN 
    Nota_Fiscal NF ON INF.id_nota_fiscal = NF.id_nota_fiscal
WHERE 
    NF.id_vendedor = @id_vendedor;
;

--F – Todos os vendedores que venderam um determinado produto.
DECLARE @id_produto INT = 1;  

SELECT 
    V.nome AS Nome_Vendedor
FROM 
    Vendedor V
JOIN 
    Nota_Fiscal NF ON V.id_vendedor = NF.id_vendedor
JOIN 
    Item_Nota_Fiscal INF ON NF.id_nota_fiscal = INF.id_nota_fiscal
WHERE 
    INF.id_produto = @id_produto;

--G – Todos os produtos que ainda não foram vendidos.
SELECT 
    P.nome AS Nome_Produto
FROM 
    Produto P
LEFT JOIN 
    Item_Nota_Fiscal INF ON P.id_produto = INF.id_produto
WHERE 
    INF.id_produto IS NULL;

--H – Listar o histórico de utilização de um determinado veículo.
DECLARE @id_veiculo INT = 1;  

SELECT 
    L.data AS Data_Locacao,
    V.nome AS Nome_Vendedor  
FROM 
    Locacao L
JOIN 
    Vendedor V ON L.id_vendedor = V.id_vendedor  
WHERE 
    L.id_veiculo = @id_veiculo;

--I – A quantidade de itens de cada nota fiscal.
SELECT 
    NF.id_nota_fiscal AS ID_Nota_Fiscal,
    SUM(INF.quant_vendida) AS Total_Itens  
FROM 
    Nota_Fiscal NF
JOIN 
    Item_Nota_Fiscal INF ON NF.id_nota_fiscal = INF.id_nota_fiscal 
GROUP BY 
    NF.id_nota_fiscal;


