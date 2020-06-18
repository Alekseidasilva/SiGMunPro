using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio.Validacoes.helpers
{
   public enum EnumeradorEstado
    {
        Pendente=0,
        Ativo,
        Bloqueado,
        Fechado,
        Concluido,
        Eliminado
    }
}
