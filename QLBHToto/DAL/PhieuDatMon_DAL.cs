using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DAL
{
    public class PhieuDatMon_DAL
    {
        ThaotacCSDL_DAL thaotac = new ThaotacCSDL_DAL();
        //khai báo 2 mảng để truyền tên tham số và giá trị tham số vào Stored Procedures
        string[] name = { };
        object[] value = { };

        public int PhieuDatMon_Them(int maban, bool tinhtrang)
        {
            name = new string[2];
            value = new object[2];
            name[0] = "@MaBan";
            name[1] = "@TinhTrang";

            value[0] = maban;
            value[1] = tinhtrang;
            return thaotac.SQL_Thuchien("PhieuDatMon_Them", name, value, 2);
        }

        public DataTable PhieuDatMon_ChonTai(int mapdm)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "MaPDM";
            value[0] = mapdm;
            return thaotac.Sql_LayDuLieu_CoDK("PhieuDatMon_ChonTai", name, value, 1);
        }

        public int Check_PhieuDatMon_ChonTai_Ban(int maban)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "@MaBan";
            value[0] = maban;
            return thaotac.SQL_Thuchien("PhieuDatMon_ChonTai_Ban", name, value, 1);
        }

        public DataTable PhieuDatMon_ChonTai_Ban(int maban)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "MaBan";
            value[0] = maban;
            return thaotac.Sql_LayDuLieu_CoDK("PhieuDatMon_ChonTai_Ban", name, value, 1);
        }

        
    }
}
