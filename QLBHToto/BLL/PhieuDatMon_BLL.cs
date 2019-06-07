using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DAL;

namespace BLL
{
    public class PhieuDatMon_BLL
    {
        PhieuDatMon_DAL pdm = new PhieuDatMon_DAL();
        public int PhieuDatMon_Them(string manv, int maban, int thanhtien, float giamgia, float phuthu)
        {
            return pdm.PhieuDatMon_Them( manv, maban, thanhtien, giamgia, phuthu);
        }

        public int PhieuDatMon_Them_THMV(string manv, int maban, int thanhtien, float giamgia, float phuthu)
        {
            return pdm.PhieuDatMon_Them_THMV(manv, maban, thanhtien, giamgia, phuthu);
        }

        public int PhieuDatMon_Sua(string mapdm, string manv, int maban, bool tinhtrang, int thanhtien, float giamgia, float phuthu)
        {
           
            return  pdm.PhieuDatMon_Sua(mapdm, manv, maban, tinhtrang, thanhtien, giamgia, phuthu);
        }

        public int PhieuDatMon_Sua_MaBan(string mapdm, int maban)
        {

            return pdm.PhieuDatMon_Sua_MaBan(mapdm, maban);
        }

        public DataTable PhieuDatMon_ChonTai(string mapdm)
        {
            return pdm.PhieuDatMon_ChonTai(mapdm);
        }

        public int Check_PhieuDatMon_ChonTai_Ban(int maban)
        {
            return pdm.Check_PhieuDatMon_ChonTai_Ban(maban);
        }



        public int PhieuDatMon_Xoa(string mapdm)
        {
            return pdm.PhieuDatMon_Xoa(mapdm);
        }

        public DataTable PhieuDatMon_ChonTai_Ban(int maban)
        {
            return pdm.PhieuDatMon_ChonTai_Ban(maban);
        }

        public DataTable PhieuDatMon_ChonTai_MangVe(int mamv)
        {
            return pdm.PhieuDatMon_ChonTai_MangVe(mamv);
        }

        public DataTable PhieuDatMon_ChonAll()
        {
            return pdm.PhieuDatMon_ChonAll();
        }

        public DataTable PhieuDatMon_MangVe_TonTai()
        {
            return pdm.PhieuDatMon_MangVe_TonTai();
        }
    }
}
