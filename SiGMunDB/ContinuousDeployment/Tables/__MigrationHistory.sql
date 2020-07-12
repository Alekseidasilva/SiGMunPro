CREATE TABLE dbo.__MigrationHistory (
  MigrationId nvarchar(150) NOT NULL,
  ContextKey nvarchar(300) NOT NULL,
  Model varbinary(max) NOT NULL,
  ProductVersion nvarchar(32) NOT NULL,
  CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED (MigrationId, ContextKey)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
