CREATE TABLE [dbo].[TB_Bairros]

(
BairroId int NOT NULL,
BairroNome varchar(50) NOT NULL,
BairroComunaId INT NOT NULL
CONSTRAINT PK_BairroId PRIMARY KEY (BairroId),
CONSTRAINT FK_ComunaQPertenceOBairro FOREIGN KEY(BairroComunaId) REFERENCES dbo.TB_Comunas,





)

