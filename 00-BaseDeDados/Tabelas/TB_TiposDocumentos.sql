﻿CREATE TABLE [dbo].[TB_TiposDocumentos]
(
	DocumentoId INT NOT NULL,
	DocumentoNome VARCHAR(max)NOT NULL,
	DocumentoValor DECIMAL(18,2)NOT NULL,
	DocumentoUsuarioId INT NOT NULL

	CONSTRAINT PK_DocumentoId PRIMARY KEY (DocumentoId)
	--CONSTRAINT FK_UsuarioQCadastraODocumento FOREIGN KEY (DocumentoUsuarioId) REFERENCES dbo.AspNetUsers
)
