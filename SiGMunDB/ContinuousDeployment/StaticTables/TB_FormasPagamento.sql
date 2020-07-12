CREATE TABLE [dbo].[TB_FormasPagamento]
(
	FormaPagamentoId INT NOT NULL,
	FormaPagamentoNome VARCHAR(50) NOT NULL,
	FormaPagamentoBancoId INT NOT NULL,
	FormaPagamentoUsuarioId INT NOT NULL
	CONSTRAINT PK_FormaPagamentoId PRIMARY KEY (FormaPagamentoId)
	CONSTRAINT FK_BancoAssociadoAformaDePagamento FOREIGN KEY (FormaPagamentoBancoId) REFERENCES dbo.TB_Bancos,
	CONSTRAINT FK_UsuarioQCadastraAFormaPagamento FOREIGN KEY (FormaPagamentoUsuarioId) REFERENCES dbo.TB_Usuarios
)
