namespace Web.Helpers
{
    public static class PerfilAgrupamento
    {
        public const string ADMIN = "ADMINISTRADOR";
        public const string CD = "CHEFE DE DEPARTAMENTO";
        public const string FUNC = "FUNCIONARIO";

        public const string ADMIN_CD = ADMIN+","+CD;
        public const string ADMIN_CD_FUNC = ADMIN+","+CD+","+FUNC;
        
    }
}