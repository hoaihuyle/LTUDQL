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

        public int TaiKhoan_Them(string matk, string mk, int capdo, string manv)
        {

            return tk.TaiKhoan_Them(matk, mk , capdo, manv);
        }

        public int TaiKhoan_Sua(string matk, string mk, string manv)
        {

            return tk.TaiKhoan_Sua(matk, mk,  manv);
        }

        public int TaiKhoan_SuaThongTin(string matk,int capdo, string manv)
        {

            return tk.TaiKhoan_SuaThongTin(matk, capdo, manv);
        }
    }
}
