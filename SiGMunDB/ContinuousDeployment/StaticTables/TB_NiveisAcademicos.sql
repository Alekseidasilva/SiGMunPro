CREATE TABLE [dbo].[TB_NiveisAcademicos]
(
	NivelAcademicoId INT IDENTITY(1,1),
	NivelAcademicoNome VARCHAR(50) NOT NULL,

	CONSTRAINT PK_NivelAcademicoId PRIMARY KEY(NivelAcademicoId),
	
)
