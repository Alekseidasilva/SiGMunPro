CREATE TABLE [dbo].[TB_Gestores]
(
	GestorId INT identity(1,1),	
	GestorUsuarioId int not null,
	GestorDataNomeacao date not null,
	GestorDataCadastro date not null,
	IdCadastrador int
	constraint PK_EntidadeGestorId primary key (GestorId),
	constraint FK_UsuarioQEGestor FOREIGN KEY (GestorUsuarioId) REFERENCES dbo.TB_Usuarios  
)
