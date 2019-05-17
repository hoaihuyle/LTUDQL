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

        public DataTable PhieuDatMon_ChonTai(int mapdm)
        {
            return pdm.PhieuDatMon_ChonTai(mapdm);
        }

        public int Check_PhieuDatMon_ChonTai_Ban(int maban)
        {
            return pdm.Check_PhieuDatMon_ChonTai_Ban(maban);
        }

        public int PhieuDatMon_Xoa(int mapdm)
        {
            return pdm.PhieuDatMon_Xoa(mapdm);
        }

        public DataTable PhieuDatMon_ChonTai_Ban(int maban)
        {
            return pdm.PhieuDatMon_ChonTai_Ban(maban);
        }
    }
}
