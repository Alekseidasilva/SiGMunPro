using System.Collections.Generic;
using MVC.Models.Entidades.Perfils;

namespace MVC.Models.Contratos.Interfaces
{
   public interface IPerfil:IBase<Role>
   {
       List<Role> CarregarPorUsuario(int UserId);
   }
}
