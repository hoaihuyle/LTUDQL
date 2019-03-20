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
            return ban.LoaiMon_ChonAll();
        }
    }
}
