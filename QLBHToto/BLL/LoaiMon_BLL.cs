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
        public DataTable LoaiMon_Select()
        {
            return loaimon.LoaiMon_ChonAll();
        }
        
        public DataTable LoaiMon_Select_Where(object[] value2)
        {
            return loaimon.LoaiMon_CoDK(value2);
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

        ////phương thức này gọi phương thức sv_delete() ở lớp SinhVien_DAL (tầng DAL)
        //public int SinhVien_Delete(int idsv)
        //{
        //    return svdal.sv_delete(idsv);
    }
}
