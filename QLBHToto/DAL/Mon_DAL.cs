using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Mon_DAL
    {
        ThaotacCSDL_DAL thaotac = new ThaotacCSDL_DAL();
        //khai báo 2 mảng để truyền tên tham số và giá trị tham số vào Stored Procedures
        string[] name = { };
        object[] value = { };
        public DataTable Mon_CoDK_LoaiMon(int maloaimon)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "MaLoaiMon";
            value[0] = maloaimon;
            return thaotac.Sql_LayDuLieu_CoDK("Mon_ChonAll_where_LoaiMon",name, value ,1);
        }

        public DataTable Mon_ChonAll_where_LoaiMon_ADMIN(int maloaimon)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "MaLoaiMon";
            value[0] = maloaimon;
            return thaotac.Sql_LayDuLieu_CoDK("Mon_ChonAll_where_LoaiMon_ADMIN", name, value, 1);
        }

        public DataTable Mon_Search(string Str)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "@Str";
            value[0] = Str;
            return thaotac.Sql_LayDuLieu_CoDK("Mon_Search", name, value, 1);
        }

        public DataTable Mon_ChonAll()
        {
            //thaotac.KetnoiCSDL();
            return thaotac.SQL_Laydulieu("Mon_ChonAll");
        }

        public DataTable Mon_ChonAll_ADMIN()
        {
            //thaotac.KetnoiCSDL();
            return thaotac.SQL_Laydulieu("Mon_ChonAll_ADMIN");
        }

        public int Mon_Them(int maloaimon, string ten, float gia, string mota)
        {
            name = new string[4];
            value = new object[4];
            name[0] = "@MaLoaiMon";
            name[1] = "@TenMon";
            name[2] = "@Gia";
            name[3] = "@Mota";

            value[0] = maloaimon;
            value[1] = ten;
            value[2] = gia;
            value[3] = mota;
            return thaotac.SQL_Thuchien("Mon_Them", name, value, 4);
        }

        public int Mon_Xoa(int mamon)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "MaMon";
            value[0] = mamon;

            return thaotac.SQL_Thuchien("Mon_Xoa", name, value, 1);
        }

        public int Mon_CapNhap(int maloaimon, int mamon ,string ten, float gia, string mota, bool tinhtrang)
        {
            name = new string[6];
            value = new object[6];
            name[0] = "@MaLoaiMon";
            name[1] = "@MaMon";
            name[2] = "@TenMon";
            name[3] = "@Gia";
            name[4] = "@Mota";
            name[5] = "@TinhTrang";


            value[0] = maloaimon;
            value[1] = mamon;
            value[2] = ten;
            value[3] = gia;
            value[4] = mota;
            value[5] = tinhtrang;
            return thaotac.SQL_Thuchien("Mon_CapNhap", name, value, 6);
        }
    }
}
