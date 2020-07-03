using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Web.Models.Role
{
    public class Role
    :IdentityRole<int,UserRole>
    {
    }
}