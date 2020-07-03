namespace _06_Web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "TB_Perfis",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 256),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => t.Name, unique: true, name: "RoleNameIndex");
            
            CreateTable(
                "TB_PerfisPorUsuario",
                c => new
                    {
                        UserId = c.Int(nullable: false),
                        RoleId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.UserId, t.RoleId })
                .ForeignKey("TB_Perfis", t => t.RoleId, cascadeDelete: true)
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
                "TB_AfirmacoesUsuarios",
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
                "TB_LoginUsuarios",
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
            DropForeignKey("TB_PerfisPorUsuario", "UserId", "TB_Usuarios");
            DropForeignKey("TB_LoginUsuarios", "UserId", "TB_Usuarios");
            DropForeignKey("TB_AfirmacoesUsuarios", "UserId", "TB_Usuarios");
            DropForeignKey("TB_PerfisPorUsuario", "RoleId", "TB_Perfis");
            DropIndex("TB_LoginUsuarios", new[] { "UserId" });
            DropIndex("TB_AfirmacoesUsuarios", new[] { "UserId" });
            DropIndex("TB_Usuarios", "UserNameIndex");
            DropIndex("TB_PerfisPorUsuario", new[] { "RoleId" });
            DropIndex("TB_PerfisPorUsuario", new[] { "UserId" });
            DropIndex("TB_Perfis", "RoleNameIndex");
            DropTable("TB_LoginUsuarios");
            DropTable("TB_AfirmacoesUsuarios");
            DropTable("TB_Usuarios");
            DropTable("TB_PerfisPorUsuario");
            DropTable("TB_Perfis");
        }
    }
}
