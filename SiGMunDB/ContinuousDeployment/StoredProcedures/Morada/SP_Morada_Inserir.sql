CREATE PROCEDURE [dbo].[SP_Morada_Inserir]
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
    MoradaBairroId
    )
    VALUES
    (
    @MoradaMunicuipeNM,	
    @MoradaRua,
    @MoradaZona,
    @MoradaBairroId	
    )
END

