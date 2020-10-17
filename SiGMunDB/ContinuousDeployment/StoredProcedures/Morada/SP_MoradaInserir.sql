CREATE PROCEDURE [dbo].[SP_MoradaInserir]
@MoradaMunicuipeNM	int,	
@MoradaRua	varchar(100),
@MoradaZona	varchar(20),
@MoradaBairroId	int	
AS

BEGIN
    INSERT dbo.TB_Moradas
    (
    MoradaMunicuipeNM,
	MoradaRua,
	MoradaZona,
	MoradaBairroId,
	MoradaDataCadastro,
	MoradaEstado, 
    IdCadastrador, 
    )
    VALUES
    (
    @MoradaMunicuipeNM,	
    @MoradaRua,
    @MoradaZona,
    @MoradaBairroId	
    )
END

