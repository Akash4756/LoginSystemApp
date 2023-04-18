using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LoginSystemApp.Models
{
    public class SignUpModel
    {

        public string Name { get; set; }
        public string Email { get; set; } 
        public string Mobile { get; set; }
        public string Gender { get; set; }
        public string Password { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Pincode { get; set; }
        public string IsActive { get; set; }

    }
}
