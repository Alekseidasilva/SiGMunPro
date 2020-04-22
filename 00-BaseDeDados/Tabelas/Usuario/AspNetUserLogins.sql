CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [NVARCHAR](128) NOT NULL,
	[ProviderKey] [NVARCHAR](128) NOT NULL,
	[UserId] [NVARCHAR](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
))
