CREATE PROCEDURE [dbo].[SP_MoradaInserir]
    @MoradaMunicuipeNM int,
	@MoradaCasaNumero VARCHAR(20),
	@MoradaRua varchar(100),
	@MoradaZona varchar(20),
	@MoradaBairroId int,
	@MoradaDataCadastro datetime,
	@MoradaEstado bit, 
    @IdCadastrador int 
AS

BEGIN
    INSERT dbo.TB_Moradas
    (
    MoradaMunicuipeNM,
	MoradaCasaNumero,
	MoradaRua,
	MoradaZona,
	MoradaBairroId,
	MoradaDataCadastro,
	MoradaEstado, 
    IdCadastrador 
    )
    VALUES
    (
    @MoradaMunicuipeNM,
	@MoradaCasaNumero,
    @MoradaRua,
    @MoradaZona,
    @MoradaBairroId,
    @MoradaDataCadastro,
    @MoradaEstado,
    @IdCadastrador
    )
END

