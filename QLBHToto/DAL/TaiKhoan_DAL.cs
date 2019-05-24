using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DAL
{
    public class TaiKhoan_DAL
    {
        ThaotacCSDL_DAL thaotac = new ThaotacCSDL_DAL();
        //khai báo 2 mảng để truyền tên tham số và giá trị tham số vào Stored Procedures
        string[] name = { };
        object[] value = { };

        public DataTable TaiKhoan_ChonAll()
        {
            //thaotac.KetnoiCSDL();
            return thaotac.SQL_Laydulieu("TaiKhoan_ChonAll");
        }

        public DataTable TaiKhoan_ChonTai(string matk)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "MaTaiKhoan";
            value[0] = matk;
            return thaotac.Sql_LayDuLieu_CoDK("TaiKhoan_ChonTai", name, value, 1);
        }

    }
}
