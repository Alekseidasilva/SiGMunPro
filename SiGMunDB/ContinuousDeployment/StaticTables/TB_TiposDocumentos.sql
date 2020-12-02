CREATE TABLE [dbo].[TB_TiposDocumentos]
(
	DocumentoId INT identity(1,1) NOT NULL,
	DocumentoNome VARCHAR(max)NOT NULL,
	DocumentoEstado bit not null,
	DocumentoUsuarioId INT NOT NULL

	CONSTRAINT PK_DocumentoId PRIMARY KEY (DocumentoId)
	CONSTRAINT FK_UsuarioQCadastraODocumento FOREIGN KEY (DocumentoUsuarioId) REFERENCES TB_Usuarios
	--constraint UQ_UnicoNomeDoDocumento Unique (DocumentoNome)
)
