using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class Ban_DAL
    {
        ThaotacCSDL_DAL thaotac = new ThaotacCSDL_DAL();
        //khai báo 2 mảng để truyền tên tham số và giá trị tham số vào Stored Procedures
        string[] name = { };
        object[] value = { };

        public DataTable Ban_ChonAll()
        {
            //thaotac.KetnoiCSDL();
            return thaotac.SQL_Laydulieu("Ban_ChonAll");
        }

        public DataTable Ban_ChonAll_ADMIN()
        {
            //thaotac.KetnoiCSDL();
            return thaotac.SQL_Laydulieu("Ban_ChonAll_ADMIN");
        }

        public DataTable Ban_CoDK(int maban)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "MaBan";
            value[0] = maban;
            return thaotac.Sql_LayDuLieu_CoDK("Ban_ChonTai", name, value, 1);
        }

        public DataTable Ban_Count()
        {
            return thaotac.Sql_LayDuLieu_CoDK("Ban_Count", name, value, 1);
        }

        public int Ban_Sua(int maban, int tinhtrang, int bangop)
        {
            name = new string[3];
            value = new object[3];
            name[0] = "@MaBan";
            name[1] = "@TinhTrang";
            name[2] = "@BanGop";

            value[0] = maban;
            value[1] = tinhtrang;
            value[2] = bangop;

            return thaotac.SQL_Thuchien("Ban_Sua", name, value, 3);
        }

        public int Ban_Xoa(int maban)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "@MaBan";
            value[0] = maban;

            return thaotac.SQL_Thuchien("Ban_Xoa", name, value, 1);
        }

        public int Ban_Them(int tinhtrang, int bangop)
        {
            name = new string[3];
            value = new object[3];

            name[0] = "@TinhTrang";
            name[1] = "@BanGop";

            value[0] = tinhtrang;
            value[1] = bangop;

            return thaotac.SQL_Thuchien("Ban_Them", name, value, 2);
        }
    }
}
