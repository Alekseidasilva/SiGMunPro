namespace Infra.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initialize : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "TB_Perfils",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 256),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => t.Name, unique: true, name: "RoleNameIndex");
            
            CreateTable(
                "TB_PerfilsUsuario",
                c => new
                    {
                        UserId = c.Int(nullable: false),
                        RoleId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.UserId, t.RoleId })
                .ForeignKey("TB_Perfils", t => t.RoleId, cascadeDelete: true)
                .ForeignKey("TB_Usuarios", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId)
                .Index(t => t.RoleId);
            
            CreateTable(
                "TB_Usuarios",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
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
                "TB_UsuarioClaims",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserId = c.Int(nullable: false),
                        ClaimType = c.String(),
                        ClaimValue = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("TB_Usuarios", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "TB_UsuarioLogin",
                c => new
                    {
                        LoginProvider = c.String(nullable: false, maxLength: 128),
                        ProviderKey = c.String(nullable: false, maxLength: 128),
                        UserId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.LoginProvider, t.ProviderKey, t.UserId })
                .ForeignKey("TB_Usuarios", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("TB_PerfilsUsuario", "UserId", "TB_Usuarios");
            DropForeignKey("TB_UsuarioLogin", "UserId", "TB_Usuarios");
            DropForeignKey("TB_UsuarioClaims", "UserId", "TB_Usuarios");
            DropForeignKey("TB_PerfilsUsuario", "RoleId", "TB_Perfils");
            DropIndex("TB_UsuarioLogin", new[] { "UserId" });
            DropIndex("TB_UsuarioClaims", new[] { "UserId" });
            DropIndex("TB_Usuarios", "UserNameIndex");
            DropIndex("TB_PerfilsUsuario", new[] { "RoleId" });
            DropIndex("TB_PerfilsUsuario", new[] { "UserId" });
            DropIndex("TB_Perfils", "RoleNameIndex");
            DropTable("TB_UsuarioLogin");
            DropTable("TB_UsuarioClaims");
            DropTable("TB_Usuarios");
            DropTable("TB_PerfilsUsuario");
            DropTable("TB_Perfils");
        }
    }
}
