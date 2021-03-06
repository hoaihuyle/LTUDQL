﻿using System;
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

        public int PhieuDatMon_Them(string manv, int maban, int thanhtien, float giamgia, float phuthu)
        {
            name = new string[5];
            value = new object[5];
            name[0] = "@MaNV";
            name[1] = "@MaBan";
            name[2] = "@ThanhTien";
            name[3] = "@GiamGia";
            name[4] = "@PhuThu";
            //(@MaNV char(10),@MaBan int, @ThanhTien int, @GiamGia float, @PhuThu float)
            value[0] = manv;
            value[1] = maban;
            value[2] = thanhtien;
            value[3] = giamgia;
            value[4] = phuthu;
            return thaotac.SQL_Thuchien("PhieuDatMon_Them", name, value, 5);
        }

        public int PhieuDatMon_Them_THMV(string manv, int maban, int thanhtien, float giamgia, float phuthu)
        {
            name = new string[5];
            value = new object[5];
            name[0] = "@MaNV";
            name[1] = "@MaBan";
            name[2] = "@ThanhTien";
            name[3] = "@GiamGia";
            name[4] = "@PhuThu";
            //(@MaNV char(10),@MaBan int, @ThanhTien int, @GiamGia float, @PhuThu float)
            value[0] = manv;
            value[1] = maban;
            value[2] = thanhtien;
            value[3] = giamgia;
            value[4] = phuthu;
            return thaotac.SQL_Thuchien("PhieuDatMon_Them_THMV", name, value, 5);
        }

        public int PhieuDatMon_Sua(string mapdm ,string manv, int maban,bool tinhtrang ,int thanhtien, float giamgia, float phuthu)
        {
            name = new string[7];
            value = new object[7];
            name[0] = "@MaPDM";
            name[1] = "@MaNV";
            name[2] = "@MaBan";
            name[3] = "@TinhTrang";
            name[4] = "@ThanhTien";
            name[5] = "@GiamGia";
            name[6] = "@PhuThu";
            //(@MaNV char(10),@MaBan int, @ThanhTien int, @GiamGia float, @PhuThu float)
            value[0] = mapdm;
            value[1] = manv;
            value[2] = maban;
            value[3] = tinhtrang;
            value[4] = thanhtien;
            value[5] = giamgia;
            value[6] = phuthu;
            return thaotac.SQL_Thuchien("PhieuDatMon_Sua", name, value, 7);
        }

        public int PhieuDatMon_Sua_MaBan(string mapdm, int maban)
        {
            name = new string[2];
            value = new object[2];
            name[0] = "@MaPDM";
            name[1] = "@MaBan";
            //(@MaNV char(10),@MaBan int, @ThanhTien int, @GiamGia float, @PhuThu float)
            value[0] = mapdm;
            value[1] = maban;
            return thaotac.SQL_Thuchien("PhieuDatMon_Sua_MaBan", name, value, 2);
        }

        public DataTable PhieuDatMon_ChonTai(string mapdm)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "MaPDM";
            value[0] = mapdm;
            return thaotac.Sql_LayDuLieu_CoDK("PhieuDatMon_ChonTai", name, value, 1);
        }

        //Return int --> check 
        public int Check_PhieuDatMon_ChonTai_Ban(int maban)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "@MaBan";
            value[0] = maban;
            return thaotac.SQL_Thuchien("PhieuDatMon_ChonTai_Ban", name, value, 1);
        }


        public int PhieuDatMon_Xoa(string mapdm)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "@MaPDM";
            value[0] = mapdm;
            return thaotac.SQL_Thuchien("PhieuDatMon_Xoa", name, value, 1);
        }

        //Return table data
        public DataTable PhieuDatMon_ChonTai_Ban(int maban)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "MaBan";
            value[0] = maban;
            return thaotac.Sql_LayDuLieu_CoDK("PhieuDatMon_ChonTai_Ban", name, value, 1);
        }

        public DataTable PhieuDatMon_ChonTai_MangVe(int mamv)
        {
            name = new string[1];
            value = new object[1];
            name[0] = "@MaMV";
            value[0] = mamv;
            return thaotac.Sql_LayDuLieu_CoDK("PhieuDatMon_ChonTai_MangVe", name, value, 1);
        }

        public DataTable PhieuDatMon_ChonAll()
        {
            name = new string[0];
            value = new object[0];
            return thaotac.SQL_Laydulieu("PhieuDatMon_ChonAll");
        }

        public DataTable PhieuDatMon_MangVe_TonTai()
        {
            name = new string[0];
            value = new object[0];
            return thaotac.SQL_Laydulieu("PhieuDatMon_MangVe_TonTai");
        }


    }
}
