using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Entidades
{
   public class UsuarioVM
    {
        public string Email { get; set; }
         public string Senha { get; set; }
         public bool LembrarMe { get; set; }
         public string ReturnUrl { get; set; }


    }
}
