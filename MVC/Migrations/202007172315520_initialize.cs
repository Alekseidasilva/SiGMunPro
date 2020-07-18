namespace MVC.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initialize : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.TB_Perfil",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Estado = c.Boolean(nullable: false),
                        DataCadastro = c.DateTime(nullable: false),
                        Name = c.String(nullable: false, maxLength: 256),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => t.Name, unique: true, name: "RoleNameIndex");
            
            CreateTable(
                "dbo.TB_Permissoes",
                c => new
                    {
                        UserId = c.Int(nullable: false),
                        RoleId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.UserId, t.RoleId })
                .ForeignKey("dbo.TB_Perfil", t => t.RoleId, cascadeDelete: true)
                .ForeignKey("dbo.TB_Usuarios", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId)
                .Index(t => t.RoleId);
            
            CreateTable(
                "dbo.TB_Usuarios",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        NomeCompleto = c.String(),
                        Estado = c.Boolean(nullable: false),
                        DataCadastro = c.DateTime(nullable: false),
                        Email = c.String(maxLength: 256),
                        EmailConfirmed = c.Boolean(nullable: false),
                        PasswordHash = c.String(),
                        SecurityStamp = c.String(),
                        PhoneNumber = c.String(),
                        PhoneNumberConfirmed = c.Boolean(nullable: false),
                        TwoFactorEnabled = c.Boolean(nullable: false),
                        LockoutEndDateUtc = c.DateTime(),
                        LockoutEnabled = c.Boolean(nullable: false),
                        AccessFailedCount = c.Int(nullable: false),
                        UserName = c.String(nullable: false, maxLength: 256),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => t.UserName, unique: true, name: "UserNameIndex");
            
            CreateTable(
                "dbo.TB_UsuariosAfirmacoes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserId = c.Int(nullable: false),
                        ClaimType = c.String(),
                        ClaimValue = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.TB_Usuarios", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.TB_UsuarioLogin",
                c => new
                    {
                        LoginProvider = c.String(nullable: false, maxLength: 128),
                        ProviderKey = c.String(nullable: false, maxLength: 128),
                        UserId = c.Int(nullable: false),
                        Email = c.String(),
                        Senha = c.String(),
                    })
                .PrimaryKey(t => new { t.LoginProvider, t.ProviderKey, t.UserId })
                .ForeignKey("dbo.TB_Usuarios", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.TB_Permissoes", "UserId", "dbo.TB_Usuarios");
            DropForeignKey("dbo.TB_UsuarioLogin", "UserId", "dbo.TB_Usuarios");
            DropForeignKey("dbo.TB_UsuariosAfirmacoes", "UserId", "dbo.TB_Usuarios");
            DropForeignKey("dbo.TB_Permissoes", "RoleId", "dbo.TB_Perfil");
            DropIndex("dbo.TB_UsuarioLogin", new[] { "UserId" });
            DropIndex("dbo.TB_UsuariosAfirmacoes", new[] { "UserId" });
            DropIndex("dbo.TB_Usuarios", "UserNameIndex");
            DropIndex("dbo.TB_Permissoes", new[] { "RoleId" });
            DropIndex("dbo.TB_Permissoes", new[] { "UserId" });
            DropIndex("dbo.TB_Perfil", "RoleNameIndex");
            DropTable("dbo.TB_UsuarioLogin");
            DropTable("dbo.TB_UsuariosAfirmacoes");
            DropTable("dbo.TB_Usuarios");
            DropTable("dbo.TB_Permissoes");
            DropTable("dbo.TB_Perfil");
        }
    }
}
