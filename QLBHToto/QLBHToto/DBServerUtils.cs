using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace QLBHToto
{
    class DBServerUtils
    {
        //Biến ID dùng để  cập nhật và xóa dữ liệu
        public static SqlConnection GetDBConnection(string datasource, string database)
        {
            string con = @"Data Source=" + datasource + ";Initial Catalog=" + database + ";Integrated Security=True";
            SqlConnection conn = new SqlConnection(con);
            return conn;
        }
    }
}
