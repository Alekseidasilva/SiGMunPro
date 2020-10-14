CREATE TABLE [dbo].[TB_GrausAcademicos]
(
	GrauAcademicoId INT IDENTITY(1,1),
	GrauAcademicoNome VARCHAR(50) NOT NULL,
	GrauAcademicoIdAnoConclusao INT NOT NULL,
	IdCadastrador INT NOT NULL
	CONSTRAINT PK_GrauAcademicoId PRIMARY KEY(GrauAcademicoId),
	CONSTRAINT FK_UsuarioQCadastraOGrauAcademico FOREIGN KEY (IdCadastrador)REFERENCES dbo.TB_Usuarios(Id)
)
