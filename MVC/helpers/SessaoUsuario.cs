using System;

namespace MVC.helpers
{
    public  class SessaoUsuario
    {
        public static int Id { get; set; }
        public static string NomeCompleto { get; set; }
        public static bool Estado { get; set; }
        public static DateTime DataCadastro { get; set; }
        public static string Email { get; set; }
        public static bool EmailConfirmed { get; set; }
        public static string PhoneNumber { get; set; }
        public static bool PhoneNumberConfirmed { get; set; }
        public static bool TwoFactorEnabled { get; set; }
        public static DateTime LockoutEndDateUtc { get; set; }
        public static bool LockoutEnabled { get; set; }
          public static int AccessFailedCount { get; set; }
          public static string UserName { get; set; }
       
       

        
         
      
            
             








         public static int PerfilId { get; set; }
         public static string PerfilNome { get; set; }
    }
}