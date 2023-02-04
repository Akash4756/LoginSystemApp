using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace LoginSystemApp.Models
{
    public class DBConnection
    {
        public SqlConnection connection;
        public DBConnection()
        {
            connection = new SqlConnection("Data Source=LAPTOP-L4JP27VH;Initial Catalog=signUp;Integrated Security=True");
        }
    }
}
