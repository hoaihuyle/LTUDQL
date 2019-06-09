using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class HoaDon_DAL
    {
        ThaotacCSDL_DAL thaotac = new ThaotacCSDL_DAL();
        //khai báo 2 mảng để truyền tên tham số và giá trị tham số vào Stored Procedures
        string[] name = { };
        object[] value = { };

        public int HoaDon_Them(string mapdm ,string manv)
        {
            name = new string[2];
            value = new object[2];
            name[0] = "@MaPDM";
            name[1] = "@MaNV";
            //(@MaNV char(10),@MaBan int, @ThanhTien int, @GiamGia float, @PhuThu float)
            value[0] = mapdm;
            value[1] = manv;
            return thaotac.SQL_Thuchien("HoaDon_Them", name, value, 2);
        }

        public DataTable HoaDon_ChonAll()
        {
            return thaotac.SQL_Laydulieu("HoaDon_ChonAll");
        }

        public DataTable HoaDon_ChonAll_TaiKTG(DateTime d, DateTime c)
        {
            name = new string[2];
            value = new object[2];
            name[0] = "@Ngaydau";
            name[1] = "@Ngaycuoi";
            //(@MaNV char(10),@MaBan int, @ThanhTien int, @GiamGia float, @PhuThu float)
            value[0] = d;
            value[1] = c;
            return thaotac.Sql_LayDuLieu_CoDK("HoaDon_ChonAll_TaiKTG", name, value, 2);
        }
    
        public DataTable InHoaDonTai(string mahd)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "@MaHD"; value[0] = mahd;
            return thaotac.Sql_LayDuLieu_CoDK("InHoaDonTai", name, value, 1);
        }
    }


    
}
