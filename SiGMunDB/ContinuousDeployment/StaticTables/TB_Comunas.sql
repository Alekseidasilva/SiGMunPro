CREATE TABLE [dbo].[TB_Comunas]
(
	
	ComunaId int NOT NULL IDENTITY,
	ComunaNome varchar(50) NOT NULL,
	ComunaMunicipioId int NOT NULL	
	CONSTRAINT PK_ComunaId PRIMARY KEY (ComunaId)
	CONSTRAINT FK_MunicipioQPertenceAComuna FOREIGN KEY(ComunaMunicipioId) REFERENCES dbo.TB_Municipios
	


)
