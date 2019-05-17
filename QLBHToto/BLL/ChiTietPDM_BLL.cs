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
        public int ChiTietPDM_Them(int mapdm, int mamon, int soluong)
        {
            return ctpdm.ChiTietPDM_Them(mapdm, mamon, soluong);
        }

        public int ChiTietPDM_Sua(int mapdm, int mamon, int soluong)
        {
            return ctpdm.ChiTietPDM_Sua(mapdm, mamon, soluong);
        }

        public int ChiTietPDM_Xoa(int mapdm)
        {

            return ctpdm.ChiTietPDM_Xoa(mapdm);
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
