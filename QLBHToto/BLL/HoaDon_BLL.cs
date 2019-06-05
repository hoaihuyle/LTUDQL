using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
namespace BLL
{
    public class HoaDon_BLL
    {
        HoaDon_DAL hd = new HoaDon_DAL();
        public int HoaDon_Them(string mapdm, string manv)
        {
            return hd.HoaDon_Them( mapdm, manv);
        }

        public DataTable HoaDon_ChonAll()
        {
            return hd.HoaDon_ChonAll();
        }

        public DataTable InHoaDonTai(string mahd)
        {
            
            return hd.InHoaDonTai(mahd);
        }
    }
}
