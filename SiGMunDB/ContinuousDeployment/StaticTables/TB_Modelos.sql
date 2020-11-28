CREATE TABLE [dbo].[TB_Modelos]
(
	ModeloId INT identity(1,1),
	ModeloDescricao varchar(100) not null,
	ModeloMarcaId int not null

   CONSTRAINT PK_Modeloid PRIMARY KEY(ModeloId),
  CONSTRAINT FK_MarcaQPertenceOModelo FOREIGN KEY(ModeloMarcaId) REFERENCES dbo.TB_Marcas,
)
