using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    class DBUtils
    {
        public static SqlConnection GetDBConnection()
        {
            string datasource = @"DESKTOP-S70KL4G\HOAIHUYLE";

            string database = "totodb";
            return DBServerUtils.GetDBConnection(datasource, database);
        }
    }
}
