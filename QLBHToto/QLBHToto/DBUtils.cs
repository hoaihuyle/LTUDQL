using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLBHToto
{
    class DBUtils
    {
        public static SqlConnection GetDBConnection()
        {
            string datasource = @"MY-1MMG59AB2LR7\SQLEXPRESS";

            string database = "toto_db";
            return DBServerUtils.GetDBConnection(datasource, database);
        }
    }
}
