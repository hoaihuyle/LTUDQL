using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DAL;

namespace BLL
{
    public class Ban_BLL
    {
        Ban_DAL ban = new Ban_DAL();
        //phương thức này gọi phương thức sv_select() ở lớp SinhVien_DAL (tầng DAL)
        public DataTable Ban_Select()
        {
            return ban.Ban_ChonAll();
        }

        public DataTable Ban_ChonAll_ADMIN()
        {
            return ban.Ban_ChonAll_ADMIN();
        }

        public DataTable Ban_ChonTai(int maban)
        {
            return ban.Ban_CoDK(maban);
        }

        public int Ban_Sua(int maban, int tinhtrang, int bangop)
        {
            return ban.Ban_Sua(maban, tinhtrang, bangop);
        }

        public DataTable Ban_Count()
        {
            return ban.Ban_Count();
        }

        public int Ban_Xoa(int maban)
        {
            return ban.Ban_Xoa(maban);
        }

        public int Ban_Them(int tinhtrang, int bangop)
        {

            return ban.Ban_Them(tinhtrang, bangop);
        }
    }
}
