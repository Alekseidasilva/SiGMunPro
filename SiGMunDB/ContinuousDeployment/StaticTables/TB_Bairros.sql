CREATE TABLE [dbo].[TB_Bairros]

(
BairroId int NOT NULL,
BairroComunaId INT NOT NULL,
BairroNome varchar(50) NOT NULL,
BairroUsuarioId int NOT NULL,
BairroDataCadastro date NOT NULL,
BairroEstado BIT not NULL,
CONSTRAINT PK_BairroId PRIMARY KEY (BairroId),
CONSTRAINT FK_ComunaQPertenceOBairro FOREIGN KEY(BairroComunaId) REFERENCES dbo.TB_Comunas,
CONSTRAINT FK_UsuarioQCadatrouOBairro FOREIGN KEY(BairroUsuarioId) REFERENCES dbo.TB_Usuarios




)

