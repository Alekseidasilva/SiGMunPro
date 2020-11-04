CREATE PROCEDURE [dbo].[SP_MoradaInserir]
    @MoradaMunicuipeNM VARCHAR(20),
	@MoradaCasaNumero VARCHAR(20),	
	@MoradaZona varchar(20),
	@MoradaRuaId int,
	@MoradaDataCadastro date,
	@MoradaEstado bit, 
    @IdCadastrador int 
AS
BEGIN TRANSACTION
DECLARE @@IdMoradaAnterior INT
BEGIN
	SELECT  @@IdMoradaAnterior= max(MoradaId) FROM dbo.TB_Moradas tm
    WHERE tm.MoradaMunicuipeNM=@MoradaMunicuipeNM
    IF @@IdMoradaAnterior IS NULL BEGIN  
    	ROLLBACK
    END
    ELSE
    BEGIN
    	UPDATE dbo.TB_Moradas 
            SET MoradaEstado = 1   
                WHERE MoradaId = @@IdMoradaAnterior;
    END
    
END
BEGIN
	 INSERT dbo.TB_Moradas
    (
    MoradaMunicuipeNM,
	MoradaCasaNumero,	
	MoradaZona,
	MoradaRuaId,
	MoradaDataCadastro,
	MoradaEstado, 
    IdCadastrador 
    )
    VALUES
    (
    @MoradaMunicuipeNM,
	@MoradaCasaNumero,   
    @MoradaZona,
    @MoradaRuaId,
    @MoradaDataCadastro,
    @MoradaEstado,
    @IdCadastrador
    )
    
    IF @@identity IS NOT NULL BEGIN  
    RETURN @@identity
    	COMMIT
    END
END