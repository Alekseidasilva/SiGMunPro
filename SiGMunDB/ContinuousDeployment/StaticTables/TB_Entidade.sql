CREATE TABLE [dbo].[TB_Entidade]
(
  EntidadeId INT IDENTITY(1,1),
  EntidadeNomeMunicipio VARCHAR(100) NOT NULL, 
  EntidadeMoradaId INT NOT NULL,
  EntidadeCasaN VARCHAR(20)NULL
  CONSTRAINT PK_EntidadeId PRIMARY KEY(EntidadeId),
  CONSTRAINT FK_RuaQPertenceAEntidade FOREIGN KEY(EntidadeRuaId) REFERENCES dbo.TB_Ruas(RuaId)
  )
