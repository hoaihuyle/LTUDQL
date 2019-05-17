using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DAL
{
    public class ChiTietPDM_DAL
    {
        ThaotacCSDL_DAL thaotac = new ThaotacCSDL_DAL();
        //khai báo 2 mảng để truyền tên tham số và giá trị tham số vào Stored Procedures
        string[] name = { };
        object[] value = { };

        public int ChiTietPDM_Them(int mapdm, int mamon, int soluong)
        {
            name = new string[3];
            value = new object[3];
            name[0] = "@MaPDM";
            name[1] = "@MaMon";
            name[2] = "@SL";

            value[0] = mapdm;
            value[1] = mamon;
            value[2] = soluong;
            return thaotac.SQL_Thuchien("ChiTietPDM_Them", name, value, 3);
        }
        public int ChiTietPDM_Sua(int mapdm, int mamon, int soluong)
        {
            name = new string[3];
            value = new object[3];
            name[0] = "@MaPDM";
            name[1] = "@MaMon";
            name[2] = "@SL";

            value[0] = mapdm;
            value[1] = mamon;
            value[2] = soluong;
            return thaotac.SQL_Thuchien("ChiTietPDM_Sua", name, value, 3);
        }

        public int ChiTietPDM_Xoa(int mapdm)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "@MaPDM";
            value[0] = mapdm;

            return thaotac.SQL_Thuchien("[ChiTietPDM_Xoa]", name, value, 1);
        }
        public DataTable ChiTietPDM_ChonTai(int mapdm)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "@MaPDM";
            value[0] = mapdm;

            return thaotac.Sql_LayDuLieu_CoDK("ChiTietPDM_ChonTai", name, value, 1);
        }


        public DataTable ThonTinPDM_ChonTai(int mapdm)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "@MaPDM";
            value[0] = mapdm;

            return thaotac.Sql_LayDuLieu_CoDK("ThonTinPDM_ChonTai", name, value, 1);
        }
    }
}
