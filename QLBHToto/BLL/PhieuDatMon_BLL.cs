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
        public int PhieuDatMon_Them(int maban, bool tinhtrang)
        {
            return pdm.PhieuDatMon_Them(maban,tinhtrang);
        }

        public DataTable PhieuDatMon_ChonTai(int mapdm)
        {
            return pdm.PhieuDatMon_ChonTai(mapdm);
        }

        public int Check_PhieuDatMon_ChonTai_Ban(int maban)
        {
            return pdm.Check_PhieuDatMon_ChonTai_Ban(maban);
        }

        public DataTable PhieuDatMon_ChonTai_Ban(int maban)
        {
            return pdm.PhieuDatMon_ChonTai_Ban(maban);
        }
    }
}
