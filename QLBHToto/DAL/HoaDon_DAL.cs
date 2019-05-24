using System;
using System.Collections.Generic;
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

       
    }
}
