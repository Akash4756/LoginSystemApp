using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace LoginSystemApp.Models
{
    public class AccountDataAccess
    {
        DBConnection dB = new DBConnection();

        public string SignUpCustomer(SignUpModel sign)
        {
            string message = string.Empty;
            SqlCommand command = new SqlCommand("sp_insert_customers" +
                "", dB.connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@Name",sign.Name);
            command.Parameters.AddWithValue("@Email", sign.Email);
            command.Parameters.AddWithValue("@Password", sign.Password);
            command.Parameters.AddWithValue("@Mobile", sign.Mobile);
            command.Parameters.AddWithValue("@Gender", sign.Gender);
            command.Parameters.AddWithValue("@Address1", sign.Address1);
            command.Parameters.AddWithValue("@Address2", sign.Address2);
            command.Parameters.AddWithValue("@Is_Active", sign.IsActive);
            command.Parameters.AddWithValue("@Pincode", sign.Pin);

            if (dB.connection.State == System.Data.ConnectionState.Closed)
            {
                dB.connection.Open();
            }
            command.ExecuteNonQuery();

            dB.connection.Close();
            message = "Record Save Succesfully";
            return message;
            
        }
        public int SignInCustomer(LoginModel sign)
        {
            string message = string.Empty;
            SqlCommand command = new SqlCommand("sp_login_customer", dB.connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@email", sign.Email);
            command.Parameters.AddWithValue("@password", sign.Password);
            

            if (dB.connection.State == System.Data.ConnectionState.Closed)
            {
                dB.connection.Open();
            }
            int result=(int)command.ExecuteScalar();
            
            dB.connection.Close();

            return result;

        }
    }
}
