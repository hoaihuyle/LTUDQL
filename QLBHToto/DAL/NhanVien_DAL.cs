using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DAL
{
    public class NhanVien_DAL
    {
        ThaotacCSDL_DAL thaotac = new ThaotacCSDL_DAL();
        //khai báo 2 mảng để truyền tên tham số và giá trị tham số vào Stored Procedures
        string[] name = { };
        object[] value = { };

        public DataTable NhanVien_ChonAll()
        {
            //thaotac.KetnoiCSDL();
            return thaotac.SQL_Laydulieu("NhanVien_ChonAll");
        }

        public DataTable NhanVien_ChonTai(string manv)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "MaNV";
            value[0] = manv;
            return thaotac.Sql_LayDuLieu_CoDK("NhanVien_ChonTai", name, value, 1);
        }

        public DataTable NhanVien_DemPDM(string manv)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "MaNV";
            value[0] = manv;
            return thaotac.Sql_LayDuLieu_CoDK("NhanVien_DemPDM", name, value, 1);
        }

        public int NhanVien_Sua_TaiKhoan(string manv, string tennv, DateTime ngaysinh, bool gioitinh, string sdt, string matk, int capdo)
        {
            name = new string[7];
            value = new object[7];
            name[0] = "MaNV"; value[0] = manv;
            name[1] = "TenNV"; value[1] = tennv;
            name[2] = "NamSinh"; value[2] = ngaysinh;
            name[3] = "GioiTinh"; value[3] = gioitinh;
            name[4] = "SoDienThoai"; value[4] = sdt;
            name[5] = "MaTaiKhoan"; value[5] = matk;
            name[6] = "Capdo"; value[6] = capdo;
            return thaotac.SQL_Thuchien("NhanVien_Sua_TaiKhoan", name, value, 7);
        }

        public int NhanVien_Them_TaiKhoan(string tennv, DateTime ngaysinh, bool gioitinh, string sdt, string matk, string mk , int capdo)
        {
            name = new string[7];
            value = new object[7];
            name[0] = "TenNV"; value[0] = tennv;
            name[1] = "NamSinh"; value[1] = ngaysinh;
            name[2] = "GioiTinh"; value[2] = gioitinh;
            name[3] = "SoDienThoai"; value[3] = sdt;
            name[4] = "MaTaiKhoan"; value[4] = matk;
            name[5] = "MatKhau"; value[5] = matk;
            name[6] = "Capdo"; value[6] = capdo;
            return thaotac.SQL_Thuchien("NhanVien_Them_TaiKhoan", name, value, 7);
        }

        public int NhanVien_Xoa(string manv)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "MaNV"; value[0] = manv;
            return thaotac.SQL_Thuchien("NhanVien_Xoa", name, value, 1);
        }
    }
}
