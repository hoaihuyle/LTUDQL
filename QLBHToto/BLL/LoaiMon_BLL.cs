using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;

namespace BLL
{
    public class LoaiMon_BLL
    {
        LoaiMon_DAL loaimon = new LoaiMon_DAL();


        //phương thức này gọi phương thức sv_select() ở lớp SinhVien_DAL (tầng DAL)
        public DataTable LoaiMon_ChonAll()
        {
            return loaimon.LoaiMon_ChonAll();

        }

        public DataTable LoaiMon_ChonAll_ADMIN()
        {
            return loaimon.LoaiMon_ChonAll_ADMIN();

        }

        public int LoaiMon_Them(string tenloaimon, string mota)
        {

            return loaimon.LoaiMon_Them(tenloaimon, mota);
        }
        public int LoaiMon_CapNhap(int maloaimon, string tenloaimon, string mota, bool tinhtrang)
        {
            return loaimon.LoaiMon_CapNhap(maloaimon, tenloaimon, mota, tinhtrang);
        }
        public DataTable LoaiMon_Select_Where(int maloaimon)
        {
            return loaimon.LoaiMon_CoDK(maloaimon);
        }

        ////phương thức này gọi phương thức sv_insert() ở lớp SinhVien_DAL (tầng DAL)
        //public int SinhVien_Insert(string hoten, string gioitinh, string idlop)
        //{
        //    return svdal.sv_insert(hoten, gioitinh, idlop);
        //}

        ////phương thức này gọi phương thức sv_update() ở lớp SinhVien_DAL (tầng DAL)
        //public int SinhVien_Update(int idsv, string hoten, string gioitinh, string idlop)
        //{
        //    return svdal.sv_update(idsv, hoten, gioitinh, idlop);
        //}

        //phương thức này gọi phương thức sv_delete() ở lớp SinhVien_DAL (tầng DAL)
        public int LoaiMon_Xoa(int maloaimon)
        {
            return loaimon.LoaiMon_Xoa(maloaimon);
        }
    }
}
