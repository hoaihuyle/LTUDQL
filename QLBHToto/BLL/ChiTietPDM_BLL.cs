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
        public int ChiTietPDM_Them(string mapdm, int mamon, int soluong)
        {
            return ctpdm.ChiTietPDM_Them(mapdm, mamon, soluong);
        }

        public int ChiTietPDM_Sua(string mapdm, int mamon, int soluong)
        {
            return ctpdm.ChiTietPDM_Sua(mapdm, mamon, soluong);
        }

        public int ChiTietPDM_Xoa(string mapdm)
        {

            return ctpdm.ChiTietPDM_Xoa(mapdm);
        }
        public int ChiTietPDM_XoaTai(string mapdm, int mamon)
        {

            return ctpdm.ChiTietPDM_XoaTai(mapdm, mamon);
        }
        public DataTable ChiTietPDM_ChonTai(string mapdm)
        {
            return ctpdm.ChiTietPDM_ChonTai(mapdm);
        }

        public DataTable ThonTinPDM_ChonTai(string mapdm)
        {
            return ctpdm.ThonTinPDM_ChonTai(mapdm);
        }

        public DataTable ChiTietPDM_ChonTai_Mon(int mamon)
        {
            return ctpdm.ChiTietPDM_ChonTai_Mon(mamon);
        }
    }
}
