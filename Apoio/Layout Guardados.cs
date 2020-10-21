-------------Tabela de Municipes-----------------------


            <table class="table table-borderless table-striped table-hover table-responsive">
                <thead style="background-color: #fcb216" >
                <th class="text-center">NM</th>
                <th class="text-center">Nome Completo</th>
                <th class="text-center">Data Nasc</th>
                <th class="text-center">Doc Identif</th>
                <th class="text-center">Data Emissão</th>
                <th class="text-center">Data Validade</th>
                <th class="text-center">Idade</th>
                <th class="text-center">Género</th>
                <th class="text-center" style="size: auto">Acções</th>
                </thead>
                <tbody>
                @foreach (var item in Model)
                {
                    <tr>
                        <td class="text-center">@item.MunicipeNm</td>
                        <td >@item.Nome</td>
                        <td class="text-center" >@item.MunicipeDataNascimento.ToShortDateString()</td>
                        <td class="text-center">@item.MunicipeNDocIdent</td>
                        <td class="text-center">@item.MunicipeNDocIdent</td>
                        @{
                            if (item.MunicipeDocDataValidade.Date==DateTime.Now.Date)
                            {
                                <td class="text-center bg-yellow">@item.MunicipeDocDataValidade.ToShortDateString()</td>
                                      
                            }
                            else if (item.MunicipeDocDataValidade>DateTime.Now.Date)
                            {
                                <td class="text-center bg-red-gradient">@item.MunicipeDocDataValidade.ToShortDateString()</td>
                            }
                            else
                            {
                                <td class="text-center">@item.MunicipeDocDataValidade.ToShortDateString()</td>
                            }
                            int idade = DateTime.Now.Year - @item.MunicipeDataNascimento.Year;
                            <td class="text-center">@idade</td>
                            if (item.MunicipeGenero==1)
                            {
                                <td class="text-center"><i class="fa fa-male"></i> M</td> 
                            }
                            else
                            {
                                <td class="text-center"><i class="fa fa-female"></i> F</td> 
                            }

                        }
                        <td >
                            <div class="people-social mt-1"> 
                                @Html.ActionLink("'","Detalhes", new{ id=item.Id}, htmlAttributes:new{@class="bg-warning fa fa-info", style="font-size: large; color:#F8F8F8" })
                                @Html.ActionLink("'","ListarPorNm","Morada", new{ nm=item.MunicipeNm}, htmlAttributes:new{@class="bg-success fa fa-home", style="font-size: large; color:#F8F8F8" })
                                       
                                @Html.ActionLink("'","Excluir", new{ id=item.Id}, htmlAttributes:new{@class="bg-secondary fa fa-group", style="font-size: large; color:#F8F8F8" })
                                @Html.ActionLink("'","Excluir", new{ id=item.Id}, htmlAttributes:new{@class="bg-info fa fa-motorcycle", style="font-size: large; color:#F8F8F8" })
                                     
                            </div>      
                        </td>
                    </tr>
                }
                </tbody>
            </table>
			
			
			
			
			
			
			
			
			//////////////////////////////////////////////////layout de margens////////////////////////////////////////////////////////////////
			<body>
<div class="main-content">
    <div class="container-fluid content-top-gap">

        <div class="card card_border">
            <div class="cards__heading">
                <h3>Munícipes Cadastrados <span></span></h3>
                <div class="dropdown-divider"></div>
                <a href="@Url.Action("Cadastrar")" class="btn btn-outline-success"><i class="fa fa-plus"></i> Cadastrar</a>
                <a href="@Url.Action("#")" class="btn btn-outline-info pull-right"><i class="fa fa-print"></i> Imprimir</a>
            </div>
            <!--Inicio do Conteudo-->
            
            
            
            
            
            
            
            
            
            
            
            
            


        <!--Fim do Conteudo-->
        </div>
    </div>
</div>
</body>





 if (item.MunicipeGenero == 1)
            {
                <div class="container">

                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-4">
                        <div class="col mb-3">
                            <div class="card">
                                <img src="~/Content/images/New/Background Masculino.png" alt="Cover" class="card-img-top">
                                <div class="card-body text-center">
                                    <img src="~/Content/images/New/UserMale.png" style="width: 70px; margin-top: -85px" alt="User" class="img-fluid img-thumbnail rounded-circle border-0 mb-0">

                                    <h5 class="card-title">@item.Nome</h5>
                                    <p class="text-secondary mb-1">@item.MunicipeNm</p>
                                    <div class="dropdown-divider"></div>
                                    <small><span><b>Casa Nº: </b></span></small><small><span>50</span></small> <small><span><b>Zona Nº: </b></span></small><small><span>5</span></small> <br/>
                                    <small><span><b>Rua: </b></span></small><small><span>Estrada Direita da Guiné</span></small> <br/>
                                    <small><span><b>Bairro: </b></span></small><small><span>Ritondo</span></small> <br/>
                                    <small><span><b>Comuna: </b></span></small><small><span>Malanje</span></small> <br/>
                                    <small><span><b>Munícipio: </b></span></small><small><span>Malanje</span></small>
                                </div>

                                <div class="card-footer">
                                    @Html.ActionLink("'", "Detalhes", "Municipe", new {}, htmlAttributes: new {@class = "btn bg-warning fa fa-info", style = "font-size: large; color: #F8F8F8"})
                                    <button class="btn-warning"><i style="font-size: large; color: #F8F8F8" class="bg-warning fa fa-info"></i></button>
                                    <button class="btn-info"><i style="font-size: large; color: #F8F8F8" class="bg-success fa fa-group"></i></button>
                                    <button class="btn-info"><i style="font-size: large; color: #F8F8F8" class="bg-secondary fa fa-home"></i></button>
                                    <button class="btn-info"><i style="font-size: large; color: #F8F8F8" class="bg-info  fa fa-motorcycle"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



