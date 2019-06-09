using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data;

namespace BLL
{

    public class Mon_BLL
    {
        Mon_DAL mon = new Mon_DAL();
        public DataTable Mon_ChonAll_where_LoaiMon(int maloaimon)
        {
            return mon.Mon_CoDK_LoaiMon(maloaimon);
        }

        public DataTable Mon_Search(string Str)
        { 
            return mon.Mon_Search(Str);
        }
        public DataTable Mon_ChonAll_where_LoaiMon_ADMIN(int maloaimon)
        {
           
            return mon.Mon_ChonAll_where_LoaiMon_ADMIN(maloaimon);
        }
        public DataTable Mon_ChonAll()
        {
            return mon.Mon_ChonAll();
        }

        public DataTable Mon_ChonAll_ADMIN()
        {
            return mon.Mon_ChonAll_ADMIN();
        }

        public int Mon_Them(int maloaimon, string ten, float gia, string mota)
        {

            return mon.Mon_Them(maloaimon, ten, gia, mota);
        }

        public int Mon_Xoa(int mamon)
        {
            return mon.Mon_Xoa(mamon);
        }

        public int Mon_CapNhap(int maloaimon, int mamon, string ten, float gia, string mota, bool tinhtrang)
        {
            return mon.Mon_CapNhap( maloaimon,  mamon,  ten,  gia,  mota,  tinhtrang);
        }
    }
}
