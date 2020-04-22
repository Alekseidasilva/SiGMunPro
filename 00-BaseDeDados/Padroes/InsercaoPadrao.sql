/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/*
-------------------------Inserir Perfil------------------------------------
GO
EXEC dbo.SP_Perfil_Usuario_Inserir @PerfilNome = 'Administrador' 

---------------------------Inserir Usuario------------------------------------
EXEC dbo.SP_Usuario_Inserir @UsuNomeCompleto = 'Aleksei da Silva',
                            @UsuEmail = 'obduSLYnNjiRg8srS9DkMIz8FRu8h6btWHd47xO17OJfjKelyQ43WPcje+CBOrJv14on1vF0yJ4QFnYeAdJETQ==',
                            @UsuSenha = 'Bl5OFCke6PIi86qVjVIMfw==',
                            @UsuPerfilId = 1,
                            @UsuDataCadastro = '2020-01-07', 
                            @UsuIdUsuario = 1,
                            @UsuEstado = 1  
------------------Estado Civil----------------------------
INSERT dbo.TB_EstadoCivil(EstadoCivilId,EstadoCivilNome)VALUES(1,'SOLTEIRO'),(2,'CASADO'),(3,'DIVORCIADO'),(4,'VIÚVO')
---------------------------------Generos-----------------------------------------
INSERT dbo.TB_Generos(GeneroId,GeneroNome)VALUES(1,'MASCULINO'),(2,'FEMENINO')


------------------------------Grau Parentesco-------------------------
INSERT dbo.TB_GrauParentesco(GrauParentescoId,GrauParentescoIdNome)
VALUES
(1,'AVÓS(MATERNO)'),
(2,'AVÓS(PATERNO)'),
(3,'MÃE'),
(4,'PAI'),
(5,'FILHO(A)'),
(7,'NETO(A)'),
(8,'BISNETO(A)'),
(9,'TIO(A)'),
(10,'PRIMO(A)'),
(11,'IRMÃO(Ã)'),
(12,'ESPOSO(A)'),
(13,'SOGRO(A)'),
(14,'CUNHADO(A)'),
(15,'CONCUNHADO(A)')
---------------------------Provibncias--------------------------------
INSERT INTO dbo.TB_Provincias(ProvinciaId,ProvinciaNome)VALUES
(1, 'BENGO'),
(2, 'BENGUELA'),
(3, 'BIÉ'),
(4, 'CABINDA'),
(5, 'CUANDO-CUBANCO'),
(6, 'CUNENE'),
(7, 'HUAMBO'),
(8, 'HUÍLA'),
(9, 'KWANZA NORTE'),
(10,'KWANZA SUL'),
(11,'LUANDA'),
(12,'LUNDA NORTE'),
(13,'LUNDA SUL'),
(14,'MALANJE'),
(15,'MOXICO'),
(16,'NAMIBE'),
(17,'UÍGE'),
(18,'ZAIRE')


-----------------------------inserir Municipios--------------------------------------------
INSERT dbo.TB_Municipios(MunicipioNome,MunicipioProvinciaId)VALUES

----BENGO
('AMBRIZ', 1),('BULA ATUMBA', 1),('DANDE', 1),('DEMBOS', 1),('NAMBUANGONGO', 1),('PANGO ALUQUÉM', 1),

-------BENGUELA
('BALOMBO', 2),('BAÍA FARTA', 2),('BENGUELA', 2),('BOCOIO', 2),('CAIMBAMBO', 2),('CATUMBELA', 2),('CHONGORÓI', 2),('CUBAL', 2),
('GANDA', 2),('LOBITO', 2),
------BIÉ
('ANDULO', 3),('CAMACUPA', 3),('CATABOLA', 3),('CHINGUAR', 3),('CHITEMBO', 3),('CUEMBA', 3),('CUNHINGA', 3),('KUITO', 3),('NHAREA', 3),
-----CABINDA
('BELIZE', 4),('BUCO-ZAU', 4),('CABINDA', 4),('CACONGO', 4),
----CUANDO CUBANGO
('CALAI', 5),('CUANGAR', 5),('CUCHI', 5),('CUITO CUANAVALE', 5),('DIRICO', 5),('LONGA', 5),('MAVINGA', 5),('MENONGUE', 5),
('NANCOVA', 5),('RIVUNGO', 5),
---CUNENE
('CAHAMA', 6),('CUANHAMA', 6),('CUROCA', 6),('CUVELAI', 6),('NAMACUNDE', 6),('OMBADJA', 6),
---HUAMBO
('BAILUNDO', 7),('CATCHIUNGO', 7),('CAÁLA', 7),('EKUNHA', 7),('HUAMBO', 7),('LONDUIMBALE', 7),('LONGONJO', 7),('MUNGO', 7),
('TCHICALA-TCHOLOANGA', 7),('TCHINDJENDJE', 7),('UCUMA', 7),


---HUÍLA
('CACONDA', 8),('CACULA', 8),('CALUQUEMBE', 8),('CHIANGE', 8),('CHIBIA', 8),('CHICOMBA', 8),('CHIPINDO', 8),('CUVANGO', 8),
('HUMPATA', 8),('JAMBA', 8),('LUBANGO', 8),('MATALA', 8),('QUILENGUES', 8),('QUIPUNGO', 8),

----KWANZA NORTE
('AMBACA', 9),('BANGA', 9),('BOLONGONGO', 9),('CAMBAMBE', 9),('CAZENGO', 9),('GOLUNGO ALTO', 9),('GONGUEMBO', 9),('LUCALA', 9),
('QUICULUNGO', 9),('SAMBA CAJÚ', 9),

----KWANZA SUL
('AMBOIM', 10),('CASSONGUE', 10),('CELA', 10),('CONDA', 10),('EBO', 10),('LIBOLO', 10),('MUSSENDE', 10),('PORTO AMBOIM',10),
('QUIBALA', 10),('QUILENDA', 10),('SELES', 10),('SUMBE', 10),
---LUANDA
('BELAS', 11),('CACUACO', 11),('CAZENGA', 11),('ÍCOLO E BENGO', 11),('LUANDA', 11),('QUIÇAMA', 11),('VIANA', 11),

---LUNDA NORTE
('CAMBULO', 12),('CAPENDA-CAMULEMBA', 12),('CAUNGULA', 12),('CHITATO', 12),('CUANGO', 12),('CUÍLO', 12),('LUBALO', 12),
('LUCAPA', 12),('XÁ MUTEBA', 12),

----LUNDA SUL
('CACOLO', 13),('DALA', 13),('MUCONDA', 13),('SAURIMO', 13),

----MALANJE
('CACUSO', 14),('CALANDULA', 14),('CAMBUNDI-CATEMBO', 14),('CANGANDALA', 14),('CAOMBO', 14),('CUABA N´ZOGE', 14),
('CUNDA-DIA-BASE', 14),('LUQUEMBO', 14),('MALANJE', 14),('MARIMBA', 14),('MASSANGO', 14),('MUCARI', 14),('QUELA', 14),
('QUIRIMA', 14),


-----MOXICO
('ALTO ZAMBEZE', 15),('BUNDAS', 15),('CAMANONGUE', 15),('LÉUA', 15),('LUAU', 15),('LUACANO', 15),('LUCHAZES', 15),
('LUENA', 15),('LUMEJE', 15),('MOXICO', 15),


-----NAMIBE
('BIBALA', 16),('CXAMUCUIO', 16),('MOÇÂMEDES', 16),('TÔMBUA', 16),('VIREI',16),

-----UIGE
('ALTO CAUALE', 17),('AMBUÍLA', 17),('BEMBE', 17),('BUENGAS', 17),('BUNGO', 17),('DAMBA', 17),('MACOCOLA', 17),
('MILUNGA', 17),('MUCABA', 17),('NEGAGE', 17),('PURI', 17),('QUIMBELE', 17),('QUITEXE', 17),('SANZA POMBO', 17),
('SONGO', 17),('UÍGE', 17),('ZOMBO', 17),

-----ZAIRE
('CUIMBA', 18),('M´BANZA KONGO', 18),('NOQUI', 18),('N´ZETO', 18),('SOYO',18),('TOMBOCO',18)





-- BEGIN
--DECLARE @@NM int 
--DECLARE @@ID_AUTO INT
--SELECT @@ID_AUTO=MAX(MUN_ID) FROM TB_MUNICIPE
--SET
--@@ID_AUTO=@@ID_AUTO+1
--IF @@ID_AUTO IS NULL
--SET
--@@ID_AUTO=1
----CAPTURAR OS DADOS PARA Nº MUNICIPE,               
----CONCATENAMOS OS  VALORES E ATRIBUOU A VARIAVEL @@NM 
----SELECT @@NM=CONCAT (BAIRRO.BAI_ID,COMUNA.COM_ID,MUNICIPIO.MUN_ID,P.PROV_ID,@@ID_AUTO)   Codigo Antigo           
--SELECT @@NM=CONCAT (PROVINCIA.PROV_ID,MUNICIPIO.MUN_ID,COMUNA.COM_ID,@@ID_AUTO)   --Codigo Novo
--FROM TB_MUNICIPE MUN
--JOIN TB_BAIRRO BAIRRO ON @MUN_BAIRRO_ACTUAL=BAIRRO.BAI_ID
--JOIN TB_COMUNA COMUNA ON COMUNA.COM_ID = BAIRRO.COM_ID
--JOIN TB_MUNICIPIO MUNICIPIO ON COMUNA.MUN_ID=MUNICIPIO.MUN_ID
--JOIN TB_PROVINCIA PROVINCIA ON MUNICIPIO.PROV_ID=PROVINCIA.PROV_ID






*/


--ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
