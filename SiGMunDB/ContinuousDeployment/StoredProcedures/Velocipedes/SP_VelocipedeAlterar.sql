CREATE PROCEDURE SP_VelocipedeAlterar
  @VelocipedeId int,
  @VelocipedeMunicipeNM varchar(20),
  @VelocipedeNLivrete VARCHAR(30),
  @VelocipedeNChapa varchar(30),
  @VelocipedeMarca int,
  @VelocipeModelo int,
  @VelocipedeNQuadro varchar(30),
  @VelocipedeCom_S_Motor bit,
  @VelocipedeNMotor varchar(50),
  @VelocipedeDestinadoServico varchar(100) ,
  @VelocipedeCilindragem varchar(10),
  @VelocipedeCor varchar(20),
  @VelocipedeEstado BIT
  AS
  BEGIN
  	UPDATE  dbo.TB_Velocipedes 
SET VelocipedeNLivrete = @VelocipedeNLivrete
   ,VelocipedeNChapa = @VelocipedeNChapa
   ,VelocipedeMarca = @VelocipedeMarca
   ,VelocipeModelo = @VelocipeModelo
   ,VelocipedeNQuadro = @VelocipedeNQuadro
   ,VelocipedeCom_S_Motor = @VelocipedeCom_S_Motor
   ,VelocipedeNMotor = @VelocipedeNMotor
   ,VelocipedeDestinadoServico = @VelocipedeDestinadoServico
   ,VelocipedeCilindragem = @VelocipedeCilindragem
   ,VelocipedeCor = @VelocipedeCor
   ,VelocipedeEstado = @VelocipedeEstado
   
   WHERE VelocipedeId = @VelocipedeId AND VelocipedeMunicipeNM=@VelocipedeMunicipeNM;
    SELECT @VelocipedeNChapa AS retorno
  END
