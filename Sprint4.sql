/*Grupo MegaTech (Nome e RM):
98552 - Amorgan Mendes Lopes
98698 - Melissa de Oliveira Pecoraro
99585 - Gustavo Godoi da Silva
99069 - Vinicius Luna Rodrigues dos Santos
552520 - Roberto Menezes Dos Santos
*/


--Os scripts a seguir tem relaï¿½ï¿½o com o pedido do sprint 3 que foram criados com o intuito de criar por via dos mesmos as tabelas do diagrama SQL.

--Parte Apaga tabelas:

DROP TABLE T_MGT_PESSOA_JURIDICA;

DROP TABLE T_MGT_PESSOA_FISICA;

DROP TABLE T_MGT_VISTORIA;

DROP TABLE T_MGT_MODIFICACAO_BIKE;

DROP TABLE T_MGT_TIPO_MODIFICACAO;

DROP TABLE T_MGT_BIKE;

DROP TABLE T_MGT_CLIENTE;

--Apagar sequences:

DROP SEQUENCE id_cliente;
DROP SEQUENCE nm_fantasia;
DROP SEQUENCE nm_cliente;
DROP SEQUENCE id_bike;
DROP SEQUENCE id_vistoria;
DROP SEQUENCE id_componente;
DROP SEQUENCE id_tipo_componente;

--Parte "Cria":
-- Criar sequencia
CREATE SEQUENCE id_cliente START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE ORDER;
CREATE SEQUENCE nm_fantasia START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE ORDER;
CREATE SEQUENCE nm_cliente START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE ORDER;
CREATE SEQUENCE id_bike START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE ORDER;
CREATE SEQUENCE id_vistoria START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE ORDER;
CREATE SEQUENCE id_componente START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE ORDER;
CREATE SEQUENCE id_tipo_componente START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE ORDER;

 

-- Criar tabelas


CREATE TABLE T_MGT_CLIENTE ( --Tabela para armazenar informaï¿½ï¿½es do cliente.
    id_cliente NUMERIC(10) PRIMARY KEY NOT NULL
);

 

CREATE TABLE T_MGT_PESSOA_JURIDICA ( --Tabela para armazenar informaï¿½ï¿½es de entidades jurï¿½dicas (empresas).
    nm_fantasia CHAR(30) PRIMARY KEY NOT NULL,
    nr_cnpj NUMERIC(14) UNIQUE NOT NULL,
    id_cliente NUMERIC(10) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES T_MGT_CLIENTE(id_cliente)
);

 

CREATE TABLE T_MGT_PESSOA_FISICA ( --Tabela para armazenar informaï¿½ï¿½es de pessoas fï¿½sicas.
    nm_cliente CHAR(30) PRIMARY KEY NOT NULL,
    nr_cpf NUMERIC(11) UNIQUE NOT NULL,
    id_cliente NUMERIC(10) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES T_MGT_CLIENTE(id_cliente)
);

 

CREATE TABLE T_MGT_BIKE ( --Tabela para armazenar informaï¿½ï¿½es sobre bicicletas, incluindo detalhes como marca, modelo e data de compra.
    id_bike NUMERIC(10) NOT NULL,
    id_cliente NUMERIC(10) NOT NULL,
    nm_marca CHAR(30) NOT NULL,
    tp_modelo CHAR(30) NOT NULL,
    dt_compra DATE NOT NULL,
    ds_ano_bike DATE NOT NULL,
    funcao_bike CHAR(30) NOT NULL,
    tp_cor CHAR(20) NOT NULL,
    vl_mercado NUMERIC(30) NOT NULL,
    tp_chassi NUMERIC NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES T_MGT_CLIENTE(id_cliente),
    PRIMARY KEY (id_bike, id_cliente)
);

 

CREATE TABLE T_MGT_VISTORIA ( -- Tabela para armazenar detalhes e imagens de inspeï¿½ï¿½o de bicicletas.
    id_vistoria NUMBER(10) PRIMARY KEY NOT NULL,
    id_bike NUMBER(10) NOT NULL,
    id_cliente NUMBER(10) NOT NULL,
    ft_bike VARCHAR2(255 CHAR) NOT NULL,
    ft_nota_fiscal VARCHAR2(255 CHAR) NOT NULL,
    vd_bike VARCHAR2(255 CHAR) NOT NULL,
    tp_modelo CHAR(50 CHAR) NOT NULL,
    FOREIGN KEY (id_bike, id_cliente) REFERENCES T_MGT_BIKE(id_bike, id_cliente)
);

 

CREATE TABLE T_MGT_TIPO_MODIFICACAO ( -- Tabela para armazenar tipos de modificaï¿½ï¿½es ou componentes de bicicletas.
    id_tipo_componente NUMERIC(10) PRIMARY KEY NOT NULL,
    nm_componente CHAR(30) 
);

 

CREATE TABLE T_MGT_MODIFICACAO_BIKE (  --Tabela para armazenar detalhes de modificaï¿½ï¿½es de bicicletas, incluindo o tipo de modificaï¿½ï¿½o e a bicicleta relacionada e o cliente.
    id_componente NUMERIC(10) PRIMARY KEY NOT NULL,
    ds_bike VARCHAR(255) NOT NULL,  
    id_tipo_componente NUMERIC(10) NOT NULL,
    id_bike NUMERIC(10) NOT NULL,
    id_cliente NUMERIC(10) NOT NULL,
    FOREIGN KEY (id_tipo_componente) REFERENCES T_MGT_TIPO_MODIFICACAO(id_tipo_componente),
    FOREIGN KEY (id_bike, id_cliente) REFERENCES T_MGT_BIKE(id_bike, id_cliente)
);
-----------------------------------------------------------------------------------------
-- Triggers:

CREATE OR REPLACE TRIGGER tr_update_id_cliente_juridica
BEFORE UPDATE OF id_cliente ON T_MGT_CLIENTE
FOR EACH ROW
BEGIN

  UPDATE T_MGT_PESSOA_JURIDICA
  SET id_cliente = :new.id_cliente
  WHERE id_cliente = :old.id_cliente;
END;

CREATE OR REPLACE TRIGGER tr_update_id_cliente_fisica
BEFORE UPDATE OF id_cliente ON T_MGT_CLIENTE
FOR EACH ROW
BEGIN

  UPDATE T_MGT_PESSOA_FISICA
  SET id_cliente = :new.id_cliente
  WHERE id_cliente = :old.id_cliente;
END;

CREATE OR REPLACE TRIGGER tr_update_id_cliente_fisica
BEFORE UPDATE OF id_cliente ON T_MGT_CLIENTE
FOR EACH ROW
BEGIN

  UPDATE T_MGT_PESSOA_FISICA
  SET id_cliente = :new.id_cliente
  WHERE id_cliente = :old.id_cliente;
END;


CREATE OR REPLACE TRIGGER tr_update_id_cliente_fisica
BEFORE UPDATE OF id_cliente ON T_MGT_CLIENTE
FOR EACH ROW
BEGIN

  UPDATE T_MGT_PESSOA_FISICA
  SET id_cliente = :new.id_cliente
  WHERE id_cliente = :old.id_cliente;
END;


CREATE OR REPLACE TRIGGER tr_update_id_cliente_fisica
BEFORE UPDATE OF id_cliente ON T_MGT_CLIENTE
FOR EACH ROW
BEGIN

  UPDATE T_MGT_PESSOA_FISICA
  SET id_cliente = :new.id_cliente
  WHERE id_cliente = :old.id_cliente;
END;

CREATE OR REPLACE TRIGGER tr_update_id_cliente_fisica
BEFORE UPDATE OF id_cliente ON T_MGT_CLIENTE
FOR EACH ROW
BEGIN

  UPDATE T_MGT_PESSOA_FISICA
  SET id_cliente = :new.id_cliente
  WHERE id_cliente = :old.id_cliente;
END;


CREATE OR REPLACE TRIGGER tr_update_id_cliente_fisica
BEFORE UPDATE OF id_cliente ON T_MGT_CLIENTE
FOR EACH ROW
BEGIN

  UPDATE T_MGT_PESSOA_FISICA
  SET id_cliente = :new.id_cliente
  WHERE id_cliente = :old.id_cliente;
END;


//--------------------------------------------------------------------------------------------------------------------------------------------------------
--Inserção de 7 linhas (Cliente)
INSERT INTO T_MGT_CLIENTE (id_cliente)
VALUES (1);
INSERT INTO T_MGT_CLIENTE (id_cliente)
VALUES (2);
INSERT INTO T_MGT_CLIENTE (id_cliente)
VALUES (3);
INSERT INTO T_MGT_CLIENTE (id_cliente)
VALUES (4);
INSERT INTO T_MGT_CLIENTE (id_cliente)
VALUES (5);
INSERT INTO T_MGT_CLIENTE (id_cliente)
VALUES (6);
INSERT INTO T_MGT_CLIENTE (id_cliente)
VALUES (7);
INSERT INTO T_MGT_CLIENTE (id_cliente)
VALUES (8);
INSERT INTO T_MGT_CLIENTE (id_cliente)
VALUES (9);
INSERT INTO T_MGT_CLIENTE (id_cliente)
VALUES (10);
INSERT INTO T_MGT_CLIENTE (id_cliente)
VALUES (11);
INSERT INTO T_MGT_CLIENTE (id_cliente)
VALUES (12);
INSERT INTO T_MGT_CLIENTE (id_cliente)
VALUES (13);
INSERT INTO T_MGT_CLIENTE (id_cliente)
VALUES (14);

--Inserção de 7 linhas (Pessoa Juridica)
INSERT INTO T_MGT_PESSOA_JURIDICA (nm_fantasia, nr_cnpj, id_cliente)
VALUES ('Saraiva', '49502749372952', 1);

INSERT INTO T_MGT_PESSOA_JURIDICA (nm_fantasia, nr_cnpj, id_cliente)
VALUES ('Americanas', '59002849914658', 2);

INSERT INTO T_MGT_PESSOA_JURIDICA (nm_fantasia, nr_cnpj, id_cliente)
VALUES ('Itau', '99338570193358', 3);

INSERT INTO T_MGT_PESSOA_JURIDICA (nm_fantasia, nr_cnpj, id_cliente)
VALUES ('Bradesco', '12345678901234', 4);

INSERT INTO T_MGT_PESSOA_JURIDICA (nm_fantasia, nr_cnpj, id_cliente)
VALUES ('TOTVS', '024771930638137', 5);

INSERT INTO T_MGT_PESSOA_JURIDICA (nm_fantasia, nr_cnpj, id_cliente)
VALUES ('Amazon', '68901479274927', 6);

INSERT INTO T_MGT_PESSOA_JURIDICA (nm_fantasia, nr_cnpj, id_cliente)
VALUES ('FIAP', '72009333784015', 7);

--Inserção de 7 linhas (Pessoa Fisica)
INSERT INTO T_MGT_PESSOA_FISICA (nm_cliente, nr_cpf, id_cliente)
VALUES ('Pedro', '12345678901', 8);

INSERT INTO T_MGT_PESSOA_FISICA (nm_cliente, nr_cpf, id_cliente)
VALUES ('Joao', '74830210394', 9);

INSERT INTO T_MGT_PESSOA_FISICA (nm_cliente, nr_cpf, id_cliente)
VALUES ('Matheus', '93174008679', 10);

INSERT INTO T_MGT_PESSOA_FISICA (nm_cliente, nr_cpf, id_cliente)
VALUES ('Fernanda', '39504294785', 11);

INSERT INTO T_MGT_PESSOA_FISICA (nm_cliente, nr_cpf, id_cliente)
VALUES ('Joaquim', '99673355558', 12);

INSERT INTO T_MGT_PESSOA_FISICA (nm_cliente, nr_cpf, id_cliente)
VALUES ('Juliana', '48765432101', 13);

INSERT INTO T_MGT_PESSOA_FISICA (nm_cliente, nr_cpf, id_cliente)
VALUES ('Amorgan', '52345670901', 14);

--Insercao de 7 linhas (Bike)
INSERT INTO T_MGT_BIKE (id_bike, id_cliente, nm_marca, tp_modelo, dt_compra, ds_ano_bike, funcao_bike, tp_cor, vl_mercado, tp_chassi)
VALUES (1, 1, 'Trek', 'Marlin', TO_DATE('2023-04-17', 'YYYY-MM-DD'), TO_DATE('2022-07-07', 'YYYY-MM-DD'), 'Trabalho', 'Azul', 5200, 12345);

INSERT INTO T_MGT_BIKE (id_bike, id_cliente, nm_marca, tp_modelo, dt_compra, ds_ano_bike, funcao_bike, tp_cor, vl_mercado, tp_chassi)
VALUES (2, 2, 'Specialized', 'Roubaix', TO_DATE('2023-08-15', 'YYYY-MM-DD'), TO_DATE('2022-09-01', 'YYYY-MM-DD'), 'Trabalho', 'Vermelho', 5700, 32145);

INSERT INTO T_MGT_BIKE (id_bike, id_cliente, nm_marca, tp_modelo, dt_compra, ds_ano_bike, funcao_bike, tp_cor, vl_mercado, tp_chassi)
VALUES (3, 3, 'Giant', 'TCR', TO_DATE('2023-01-02', 'YYYY-MM-DD'), TO_DATE('2022-01-15', 'YYYY-MM-DD'), 'Trabalho', 'Preto', 5000, 70983);

INSERT INTO T_MGT_BIKE (id_bike, id_cliente, nm_marca, tp_modelo, dt_compra, ds_ano_bike, funcao_bike, tp_cor, vl_mercado, tp_chassi)
VALUES (4, 4, 'Santa Cruz', 'Nomad', TO_DATE('2023-12-07', 'YYYY-MM-DD'), TO_DATE('2022-12-09', 'YYYY-MM-DD'), 'Trabalho', 'Azul', 6100, 54673);

INSERT INTO T_MGT_BIKE (id_bike, id_cliente, nm_marca, tp_modelo, dt_compra, ds_ano_bike, funcao_bike, tp_cor, vl_mercado, tp_chassi)
VALUES (5, 5, 'Bianchi', 'Aria', TO_DATE('2023-05-19', 'YYYY-MM-DD'), TO_DATE('2022-03-11', 'YYYY-MM-DD'), 'Trabalho', 'Branco', 6178, 90083);

INSERT INTO T_MGT_BIKE (id_bike, id_cliente, nm_marca, tp_modelo, dt_compra, ds_ano_bike, funcao_bike, tp_cor, vl_mercado, tp_chassi)
VALUES (6, 6, 'Canyon', 'Grail', TO_DATE('2023-09-28', 'YYYY-MM-DD'), TO_DATE('2022-07-03', 'YYYY-MM-DD'), 'Trabalho', 'Prata', 7000, 34440);

INSERT INTO T_MGT_BIKE (id_bike, id_cliente, nm_marca, tp_modelo, dt_compra, ds_ano_bike, funcao_bike, tp_cor, vl_mercado, tp_chassi)
VALUES (7, 7, 'Cervéio', 'C-Series', TO_DATE('2023-02-23', 'YYYY-MM-DD'), TO_DATE('2022-10-08', 'YYYY-MM-DD'), 'Trabalho', 'Verde', 5670, 98765);

--Insercao de 7 linhas (Vistoria)
INSERT INTO T_MGT_VISTORIA (id_vistoria, id_bike, id_cliente, ft_bike, ft_nota_fiscal, vd_bike, tp_modelo)
VALUES (1, 1, 1, 'bike_vistoria_001.jpg', 'caminho_da_nota_fiscal.jpg', 'vistoria_bike_video_001.mp4', 'Marlin');

INSERT INTO T_MGT_VISTORIA (id_vistoria, id_bike, id_cliente, ft_bike, ft_nota_fiscal, vd_bike, tp_modelo)
VALUES (2, 2, 2, 'vistoria_bike_frente.jpg', 'nota_fiscal_bike_001.jpg', 'vistoria_bike_roda_dianteira.mp4', 'Roubaix');

INSERT INTO T_MGT_VISTORIA (id_vistoria, id_bike, id_cliente, ft_bike, ft_nota_fiscal, vd_bike, tp_modelo)
VALUES (3, 3, 3, 'caminho_da_imagem_bike1.jpg', 'nf_bike_janeiro_2023.jpg', 'video_vistoria_lateral.mp4', 'TCR');

INSERT INTO T_MGT_VISTORIA (id_vistoria, id_bike, id_cliente, ft_bike, ft_nota_fiscal, vd_bike, tp_modelo)
VALUES (4, 4, 4, 'foto_vistoria_roda_dianteira.jpg', 'nf_compra_bike_12345.jpg', 'vistoria_bike_pedais.mp4', 'Nomad');

INSERT INTO T_MGT_VISTORIA (id_vistoria, id_bike, id_cliente, ft_bike, ft_nota_fiscal, vd_bike, tp_modelo)
VALUES (5, 5, 5, 'imagem_vistoria_pedais.jpg', 'nf_bicicleta_marca_ABC.jpg.jpg', 'video_vistoria_traseira.mp4', 'Aria');

INSERT INTO T_MGT_VISTORIA (id_vistoria, id_bike, id_cliente, ft_bike, ft_nota_fiscal, vd_bike, tp_modelo)
VALUES (6, 6, 6, 'vistoria_bike_traseira.jpg', 'nota_fisca1.jpg', 'vistoria_bike_corpo.mp4', 'Grail');

INSERT INTO T_MGT_VISTORIA (id_vistoria, id_bike, id_cliente, ft_bike, ft_nota_fiscal, vd_bike, tp_modelo)
VALUES (7, 7, 7, 'foto_vistoria_corpo_bike.jpg', 'notinha.jpg', 'caminho_da_vistoria1.mp4', 'C-Series');

--Insercao de 7 linhas (EspecificaÃ§Ã£o do componente)
INSERT INTO T_MGT_TIPO_MODIFICACAO (id_tipo_componente, nm_componente)
VALUES (1, 'Suspensão Dianteira');
INSERT INTO T_MGT_TIPO_MODIFICACAO (id_tipo_componente, nm_componente)
VALUES (2, 'Pneus Tubeless');
INSERT INTO T_MGT_TIPO_MODIFICACAO (id_tipo_componente, nm_componente)
VALUES (3, 'Freios a Disco');
INSERT INTO T_MGT_TIPO_MODIFICACAO (id_tipo_componente, nm_componente)
VALUES (4, 'Guidão Riser');
INSERT INTO T_MGT_TIPO_MODIFICACAO (id_tipo_componente, nm_componente)
VALUES (5, 'Selim Anatômico');
INSERT INTO T_MGT_TIPO_MODIFICACAO (id_tipo_componente, nm_componente)
VALUES (6, 'Transmissão Shimano Deore');
INSERT INTO T_MGT_TIPO_MODIFICACAO (id_tipo_componente, nm_componente)
VALUES (7, 'Pedais Clipless');

--Insercao de 7 linhas (Modificacao)
INSERT INTO T_MGT_MODIFICACAO_BIKE (id_componente, ds_bike, id_tipo_componente, id_bike, id_cliente)
VALUES (1, 'Troca de Suspensão', 1, 1, 1);

INSERT INTO T_MGT_MODIFICACAO_BIKE (id_componente, ds_bike, id_tipo_componente, id_bike, id_cliente)
VALUES (2, 'Pneus Tubeless', 2, 2, 2);

INSERT INTO T_MGT_MODIFICACAO_BIKE (id_componente, ds_bike, id_tipo_componente, id_bike, id_cliente)
VALUES (3, 'Pneus Tubeless', 3, 3, 3);

INSERT INTO T_MGT_MODIFICACAO_BIKE (id_componente, ds_bike, id_tipo_componente, id_bike, id_cliente)
VALUES (4, 'Guidão Riser 1', 4, 4, 4);

INSERT INTO T_MGT_MODIFICACAO_BIKE (id_componente, ds_bike, id_tipo_componente, id_bike, id_cliente)
VALUES (5, 'Selim Anatômico', 5, 5, 5);

INSERT INTO T_MGT_MODIFICACAO_BIKE (id_componente, ds_bike, id_tipo_componente, id_bike, id_cliente)
VALUES (6, 'Transmissão de Alta Gama', 6, 6, 6);

INSERT INTO T_MGT_MODIFICACAO_BIKE (id_componente, ds_bike, id_tipo_componente, id_bike, id_cliente)
VALUES (7, 'Pedais Clipless', 7, 7, 7);

//-------------------------------------------------------------------------------------------------------------------------------------------

--Testes de Atualizacao (Cliente)
UPDATE T_MGT_CLIENTE
SET id_cliente = 18
WHERE id_cliente = 1;

UPDATE T_MGT_CLIENTE
SET id_cliente = 19
WHERE id_cliente = 2;

UPDATE T_MGT_CLIENTE
SET id_cliente = 20
WHERE id_cliente = 3;



