using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;

namespace BLL
{
    
    public class NhanVien_BLL
    {
        NhanVien_DAL nv = new NhanVien_DAL();
        public DataTable NhanVien_ChonAll()
        {
            //thaotac.KetnoiCSDL();
            return nv.NhanVien_ChonAll();
        }

        public DataTable NhanVien_ChonTai(string manv)
        {

            return nv.NhanVien_ChonTai(manv);
        }

        public DataTable NhanVien_DemPDM(string manv)
        {

            return nv.NhanVien_DemPDM(manv);
        }

        public int NhanVien_Sua_TaiKhoan(string manv, string tennv, DateTime ngaysinh, bool gioitinh, string sdt, string matk, int capdo)
        {
            return nv.NhanVien_Sua_TaiKhoan(manv, tennv, ngaysinh, gioitinh, sdt, matk, capdo);
        }

        public int NhanVien_Them_TaiKhoan(string tennv, DateTime ngaysinh, bool gioitinh, string sdt, string matk, string mk, int capdo)
        {
            return nv.NhanVien_Them_TaiKhoan(tennv, ngaysinh, gioitinh, sdt, matk, mk, capdo);
        }

        public int NhanVien_Xoa(string manv)
        {
            return nv.NhanVien_Xoa(manv);
        }
    }
}
