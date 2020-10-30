CREATE PROCEDURE [dbo].[SP_MoradaInserir]
    @MoradaMunicuipeNM int,
	@MoradaCasaNumero VARCHAR(20),	
	@MoradaZona varchar(20),
	@MoradaRuaId int,
	@MoradaDataCadastro date,
	@MoradaEstado bit, 
    @IdCadastrador int 
AS

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

