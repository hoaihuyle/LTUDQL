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
        string[] name = {};
        object[] value = {  };

        //phương thức này gọi phương thức SQL_Laydulieu ở lớp ThaoTac_CoSoDuLieu để thực hiện lấy dữ liệu
        //phương thức này gọi phương thức SQL_Laydulieu ở lớp ThaoTac_CoSoDuLieu để thực hiện lấy dữ liệu
        public DataTable LoaiMon_ChonAll()
        {
            //thaotac.KetnoiCSDL();
            return thaotac.SQL_Laydulieu("LoaiMon_ChonAll");
        }

        public DataTable LoaiMon_ChonAll_ADMIN()
        {
            //thaotac.KetnoiCSDL();
            return thaotac.SQL_Laydulieu("LoaiMon_ChonAll_ADMIN");
        }

        public DataTable LoaiMon_CoDK(int maloaimon)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "MaLoaiMon";
            value[0] = maloaimon;
            return thaotac.Sql_LayDuLieu_CoDK("LoaiMon_ChonTai",name,value,1);
        }
        ////phương thức này gọi phương thức SQL_Thuchien ở lớp ThaoTac_CoSoDuLieu để thực hiện insert
        public int LoaiMon_Them(string tenloaimon, string mota)
        {
            //thaotac.KetnoiCSDL();
            name = new string[2];
            value = new object[2];
            name[0] = "@TenLoaiMon"; value[0] = tenloaimon;//@HoTen,... là các tham số phải giống với tham số khai báo ở Stores Procedures trong CSDL
            name[1] = "@Mota"; value[1] = mota;
            
            return thaotac.SQL_Thuchien("LoaiMon_Them", name, value, 2);
        }

        public int LoaiMon_CapNhap(int maloaimon,string tenloaimon, string mota, bool tinhtrang)
        {
            //thaotac.KetnoiCSDL();
            name = new string[4];
            value = new object[4];
            name[0] = "@MaLoaiMon"; value[0] = maloaimon;//@HoTen,... là các tham số phải giống với tham số khai báo ở Stores Procedures trong CSDL
            name[1] = "@TenLoaiMon"; value[1] = tenloaimon;//@HoTen,... là các tham số phải giống với tham số khai báo ở Stores Procedures trong CSDL
            name[2] = "@Mota"; value[2] = mota;
            name[3] = "@TinhTrang"; value[3] = tinhtrang;

            return thaotac.SQL_Thuchien("LoaiMon_CapNhap", name, value, 4);
        }
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
        //phương thức này gọi phương thức SQL_Thuchien ở lớp ThaoTac_CoSoDuLieu để thực hiện delete
        public int LoaiMon_Xoa(int maloaimon)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "@MaLoaiMon"; value[0] = maloaimon;
            return thaotac.SQL_Thuchien("LoaiMon_Xoa", name, value, 1);
        }
    }
}
