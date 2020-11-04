CREATE PROCEDURE [dbo].[SP_MoradaInserir]
    @MoradaMunicuipeNM VARCHAR(20),
	@MoradaCasaNumero VARCHAR(20),	
	@MoradaZona varchar(20),
	@MoradaRuaId int,
	@MoradaDataCadastro date,
	@MoradaEstado bit, 
    @IdCadastrador int 
AS

DECLARE @@id int
BEGIN	 
SELECT @@id=MAX(MoradaId) FROM dbo.TB_Moradas tm
    WHERE tm.MoradaMunicuipeNM=@MoradaMunicuipeNM
    if @@id is not null
    BEGIN
    	UPDATE dbo.TB_Moradas 
            SET MoradaEstado = 0   
                WHERE MoradaId = @@id;
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
    
END   
END