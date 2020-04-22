CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [NVARCHAR](128) NOT NULL,
	[RoleId] [NVARCHAR](128) NOT NULL
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
))
