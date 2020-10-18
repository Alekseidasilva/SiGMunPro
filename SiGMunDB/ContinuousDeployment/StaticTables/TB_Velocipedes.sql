CREATE TABLE [dbo].[TB_Velocipedes]
(
  VelocipedeId INT IDENTITY(1,1),
  VelocipedeMunicipeNM BIGINT NOT NULL,
  VelocipedeNLivrete INT NOT NULL,
  VelocipedeNChapa VARCHAR(30)NOT NULL,
  VelocipedeMarca INT NOT NULL,
  VelocipedeNQuadro VARCHAR(30) NOT NULL,
  VelocipedeCom_S_Motor BIT NOT NULL,
  VelocipedeNMotor VARCHAR(50) NULL,
  VelocipedeDestinadoServico VARCHAR(100) NULL,
  VelocipedeCilindragem VARCHAR(10) NULL,
  VelocipedeCor VARCHAR(30)NULL, 
  VelocipedeEstado BIT NOT NULL,
  VelocipeDataCadastro DATETIME,
  IdCadastrador INT NOT NULL
  
  CONSTRAINT PK_VelocipeId PRIMARY KEY(VelocipedeId),
  CONSTRAINT FK_MunicipeQPertenceOVelocipede FOREIGN KEY(VelocipedeMunicipeNM) REFERENCES dbo.TB_Municipes(MunicipeNM),
  CONSTRAINT FK_UsuarioQCadastraVelocipede FOREIGN KEY (IdCadastrador) REFERENCES dbo.TB_Usuarios(Id)

)
