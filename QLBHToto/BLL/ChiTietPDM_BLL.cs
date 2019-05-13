using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DAL;

namespace BLL
{
    public class ChiTietPDM_BLL
    {
        ChiTietPDM_DAL ctpdm = new ChiTietPDM_DAL();
        public int ChiTietPDM_Them(int mapdm, int mamon)
        {
            return ctpdm.ChiTietPDM_Them(mapdm, mamon);
        }

        public DataTable ChiTietPDM_ChonTai(int mapdm)
        {
            return ctpdm.ChiTietPDM_ChonTai(mapdm);
        }

        public DataTable ThonTinPDM_ChonTai(int mapdm)
        {
            return ctpdm.ThonTinPDM_ChonTai(mapdm);
        }
    }
}
