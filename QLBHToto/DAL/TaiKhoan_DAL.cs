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

        public int TaiKhoan_Them(string matk, string mk, int capdo, string manv)
        {
            name = new string[4];
            value = new object[4];
            name[0] = "MaTaiKhoan";
            value[0] = matk;
            name[1] = "MatKhau";
            value[1] = mk;
            name[2] = "CapDo";
            value[2] = capdo;
            name[3] = "MaNV";
            value[3] = manv;
            return thaotac.SQL_Thuchien("TaiKhoan_Them", name, value, 4);
        }

        public int TaiKhoan_Sua(string matk, string mk, string manv)
        {
            name = new string[3];
            value = new object[3];
            name[0] = "MaTaiKhoan";
            value[0] = matk;
            name[1] = "MatKhau";
            value[1] = mk;
            name[2] = "MaNV";
            value[2] = manv;
            return thaotac.SQL_Thuchien("TaiKhoan_Sua", name, value, 3);
        }

        public int TaiKhoan_SuaThongTin(string matk, int capdo, string manv)
        {
            name = new string[3];
            value = new object[3];
            name[0] = "MaTaiKhoan";
            value[0] = matk;
            name[1] = "CapDo";
            value[1] = capdo;
            name[2] = "MaNV";
            value[2] = manv;
            return thaotac.SQL_Thuchien("TaiKhoan_SuaThongTin", name, value, 3);
        }

    }
}
