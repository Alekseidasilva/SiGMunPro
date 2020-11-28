CREATE TABLE [dbo].[TB_Marcas]
(
	MarcaId int identity(1,1),
	Marcadescricao varchar(100) not null

CONSTRAINT PK_MarcaId PRIMARY KEY(MarcaId),
)
