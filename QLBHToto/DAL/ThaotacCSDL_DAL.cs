using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class ThaotacCSDL_DAL
    {

        SqlConnection conn;
        SqlDataAdapter da;
        SqlCommand cmd;

        private void KetnoiCSDL()
        {
            conn = DBUtils.GetDBConnection();
            conn.Open();
        }
        private void NgatKetNoi()
        {
            conn.Close();
            conn.Dispose();
        }
        //phương thức thực thi Select dữ liệu
        public DataTable SQL_Laydulieu(string TenSP)
        {
            KetnoiCSDL();
            //thực thi lấy dữ liệu từ CSDL
            cmd = new SqlCommand(TenSP, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            //ngắt kết nối
            NgatKetNoi();
            //trả về bảng chứa dữ liệu lấy được.
            return dt;
        }
        //phương thức thực thi Insert, Update, Delete
        public int SQL_Thuchien(string TenSP, string[] name, object[] value, int Npara)
        {
            KetnoiCSDL();
            cmd = new SqlCommand(TenSP, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            for (int i = 0; i < Npara; i++)
            {
                cmd.Parameters.AddWithValue(name[i], value[i]);
            }
            return cmd.ExecuteNonQuery();
        }

        //Phương thức thực thi select có điều kiện
        public DataTable Sql_LayDuLieu_CoDK(String TenSP, string[] name, object[] value, int Npara)
        {
            KetnoiCSDL();
            //thực thi lấy dữ liệu từ CSDL
            cmd = new SqlCommand(TenSP, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            for (int i = 0; i < Npara; i++)
            {
                cmd.Parameters.AddWithValue(name[i], value[i]);
            }
            cmd.ExecuteNonQuery();
            da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            //ngắt kết nối
            NgatKetNoi();
            //trả về bảng chứa dữ liệu lấy được.
            return dt;
        }

    }
}
