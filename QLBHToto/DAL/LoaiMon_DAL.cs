using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class LoaiMon_DAL
    {
        ThaotacCSDL_DAL thaotac = new ThaotacCSDL_DAL();
        //khai báo 2 mảng để truyền tên tham số và giá trị tham số vào Stored Procedures
        string[] name = {"[MaLoaiMon]","[MaMon]","[MaBan]", "[TinhTrang]", "[BanGop]" };
        object[] value = { };
        //phương thức này gọi phương thức SQL_Laydulieu ở lớp ThaoTac_CoSoDuLieu để thực hiện lấy dữ liệu
        //phương thức này gọi phương thức SQL_Laydulieu ở lớp ThaoTac_CoSoDuLieu để thực hiện lấy dữ liệu
        public DataTable LoaiMon_ChonAll()
        {
            //thaotac.KetnoiCSDL();
            return thaotac.SQL_Laydulieu("LoaiMon_ChonAll");
        }

        public DataTable LoaiMon_CoDK(object[] value2)
        {
            
            return thaotac.Sql_LayDuLieu_CoDK("LoaiMon_ChonTai",name,value2,1);
        }
        ////phương thức này gọi phương thức SQL_Thuchien ở lớp ThaoTac_CoSoDuLieu để thực hiện insert
        //public int sv_insert(string hoten, string gioitinh, string idlop)
        //{
        //    //thaotac.KetnoiCSDL();
        //    name = new string[3];
        //    value = new object[3];
        //    name[0] = "@HoTen"; value[0] = hoten;//@HoTen,... là các tham số phải giống với tham số khai báo ở Stores Procedures trong CSDL
        //    name[1] = "@GioiTinh"; value[1] = gioitinh;
        //    name[2] = "@IDLop"; value[2] = idlop;
        //    return thaotac.SQL_Thuchien("SinhVien_Insert", name, value, 3);
        //}
        ////phương thức này gọi phương thức SQL_Thuchien ở lớp ThaoTac_CoSoDuLieu để thực hiện update
        //public int sv_update(int idsv, string hoten, string gioitinh, string idlop)
        //{
        //    name = new string[4];
        //    value = new object[4];
        //    name[0] = "@IDSinhVien"; value[0] = idsv;
        //    name[1] = "@HoTen"; value[1] = hoten;//@HoTen,... là các tham số phải giống với tham số khai báo ở Stores Procedures trong CSDL
        //    name[2] = "@GioiTinh"; value[2] = gioitinh;
        //    name[3] = "@IDLop"; value[3] = idlop;
        //    return thaotac.SQL_Thuchien("SinhVien_Update", name, value, 4);
        //}
        ////phương thức này gọi phương thức SQL_Thuchien ở lớp ThaoTac_CoSoDuLieu để thực hiện delete
        //public int sv_delete(int idsv)
        //{
        //    name = new string[1];
        //    value = new object[1];
        //    name[0] = "@IDSinhVien"; value[0] = idsv;
        //    return thaotac.SQL_Thuchien("SinhVien_Delete", name, value, 1);
        //}
    }
}
