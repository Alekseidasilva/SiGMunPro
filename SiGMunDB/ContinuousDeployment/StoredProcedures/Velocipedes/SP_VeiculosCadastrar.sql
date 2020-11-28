CREATE PROCEDURE [dbo].[SP_VeiculosCadastrar]
  @VelocipedeMunicipeNM varchar(20),
  @VelocipedeNLivrete varchar(30),
  @VelocipedeNChapa varchar(30),
  @VelocipedeMarca int,
  @VelocipeModelo int,
  @VelocipedeNQuadro varchar(30),
  @VelocipedeCom_S_Motor bit,
  @VelocipedeNMotor varchar(50),
  @VelocipedeDestinadoServico varchar(100) ,
  @VelocipedeCilindragem varchar(10),
  @VelocipedeCor varchar(20),
  @VelocipedeEstado bit,
  @VelocipeDataCadastro date, 
  @IdCadastrador int
AS
Begin
INSERT INTO dbo.TB_Velocipedes (
  VelocipedeMunicipeNM,
  VelocipedeNLivrete,
  VelocipedeNChapa,
  VelocipedeMarca,
  VelocipeModelo,
  VelocipedeNQuadro,
  VelocipedeCom_S_Motor,
  VelocipedeNMotor,
  VelocipedeDestinadoServico,
  VelocipedeCilindragem,
  VelocipedeCor,
  VelocipedeEstado,
  VelocipeDataCadastro,
  IdCadastrador
  )
  VALUES (
  @VelocipedeMunicipeNM,
  @VelocipedeNLivrete,
  @VelocipedeNChapa,
  @VelocipedeMarca,
  @VelocipeModelo,
  @VelocipedeNQuadro,
  @VelocipedeCom_S_Motor,
  @VelocipedeNMotor,
  @VelocipedeDestinadoServico,
  @VelocipedeCilindragem,
  @VelocipedeCor,
  @VelocipedeEstado,
  @VelocipeDataCadastro,
  @IdCadastrador  
  )
  select @VelocipedeNChapa as retorno
End