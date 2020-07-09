namespace Infra.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class _2migracao : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "Estado", c => c.Boolean(nullable: false));
            AddColumn("dbo.AspNetUserLogins", "Email", c => c.String());
            AddColumn("dbo.AspNetUserLogins", "Senha", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUserLogins", "Senha");
            DropColumn("dbo.AspNetUserLogins", "Email");
            DropColumn("dbo.AspNetUsers", "Estado");
        }
    }
}
