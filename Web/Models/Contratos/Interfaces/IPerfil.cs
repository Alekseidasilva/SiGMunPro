using System.Collections.Generic;
using Web.Models.Entidades.Perfis;

namespace Web.Models.Contratos.Interfaces
{
    interface IPerfil:IBase<Role>
    {
        List<Role> CarregarPorUsuario(int UserId);
    }
}
