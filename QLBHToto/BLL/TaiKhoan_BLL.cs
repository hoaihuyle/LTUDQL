using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;

namespace BLL
{
    public class TaiKhoan_BLL
    {
        TaiKhoan_DAL tk = new TaiKhoan_DAL();

        public DataTable TaiKhoan_ChonAll()
        {
            //thaotac.KetnoiCSDL();
            return tk.TaiKhoan_ChonAll();
        }

        public DataTable TaiKhoan_ChonTai(string matk)
        {
           
            return tk.TaiKhoan_ChonTai(matk);
        }
    }
}
