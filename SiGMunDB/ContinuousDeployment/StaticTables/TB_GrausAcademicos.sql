CREATE TABLE [dbo].[TB_GrausAcademicos]
(
	GrauAcademicoId INT IDENTITY(1,1),
	GrauMunicipeNM VARCHAR(20) NOT NULL,
	GrauNivelAcademicoId INT NOT NULL,
	GrauAcademicoIdAnoConclusao INT NOT NULL,
	IdCadastrador INT NOT NULL
	CONSTRAINT PK_GrauAcademicoId PRIMARY KEY(GrauAcademicoId),
	CONSTRAINT FK_GrauAcademicoDoMunicipe FOREIGN KEY (GrauMunicipeNM)REFERENCES dbo.TB_Municipes(MunicipeNM),
	CONSTRAINT FK_GrauNivelAcademico FOREIGN KEY (GrauNivelAcademicoId)REFERENCES dbo.TB_NiveisAcademicos(NivelAcademicoId),
	CONSTRAINT FK_UsuarioQCadastraOGrauAcademico FOREIGN KEY (IdCadastrador)REFERENCES dbo.TB_Usuarios(Id)
)
