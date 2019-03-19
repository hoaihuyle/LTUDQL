using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;

namespace GUI
{

    public partial class Form1 : Form
    {
        LoaiMon_BLL loaimon = new LoaiMon_BLL();
        private void Form1_Load(object sender, EventArgs e)
        {
            //dataGridView1.DataSource = loaimon.SinhVien_Select();

            ////Gán dữ liệu nguồn
            comboBox1.DataSource = loaimon.SinhVien_Select();
            ////Gán trường sẽ hiển thị trên comboBox
            comboBox1.DisplayMember = "TenLoaiMon";
            ////Gã trường mã ẩn sau mỗi trường trên comboBox
            ////Nhằm mục đích khi chọn 1 item sẽ sử dụng mã ẩn để lọc dữ liệu 
            comboBox1.ValueMember = "MaLoaiMon";

            //con.Open();
            //sql = "Select * from Ban";
            //da = new SqlDataAdapter(sql, con);
            ////Khai báo đối tượng datatable để chứa dữ liệu
            //DataTable dt2 = new DataTable();
            ////Điền dữ liệu vào đối tượng Datatable
            //da.Fill(dt2);
            //da.Dispose();
            ////Giải phóng đối tượng SqlDataAdapter


            ////Gán dữ liệu nguồn
            //cbBan.DataSource = dt2;
            ////Gán trường sẽ hiển thị trên comboBox
            //cbBan.DisplayMember = "MaBan";
            ////Gã trường mã ẩn sau mỗi trường trên comboBox
            ////Nhằm mục đích khi chọn 1 item sẽ sử dụng mã ẩn để lọc dữ liệu 
            //cbBan.ValueMember = "MaBan";

            //con.Close();

        }
        private void ClearData()
        {
            txtTenMon.Clear();
            txtMoTa.Clear();
            txtGiaMon.Clear();
            rdMon1.Checked = false;
            rdMon0.Checked = false;
        }
        private void DisplayData( string query)
        {
            //con.Open();
            //DataTable dt = new DataTable();
            //sql = "SELECT dbo.Mon.MaMon,dbo.Mon.MaLoaiMon,dbo.Mon.TenMon, dbo.Mon.Gia, dbo.Mon.Mota, dbo.Mon.TinhTrang " +
            //    "FROM dbo.LoaiMon INNER JOIN dbo.Mon " +
            //    "ON dbo.LoaiMon.MaLoaiMon = dbo.Mon.MaLoaiMon " +
            //    query;
            ////MessageBox.Show(sql);
            //da = new SqlDataAdapter(sql, con);
            //da.Fill(dt);
            //dataGridView1.DataSource = dt;
            //con.Close();
        }
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string query= "WHERE dbo.Mon.MaLoaiMon= N'" + comboBox1.SelectedValue + "'";
            DisplayData(query);
            SoBan.Text = cbBan.SelectedValue.ToString();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            int i = dataGridView1.CurrentRow.Index;
            txtMaMon.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            cbMaLoaiMon.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
            txtTenMon.Text = dataGridView1.Rows[i].Cells[2].Value.ToString();
            txtGiaMon.Text = dataGridView1.Rows[i].Cells[3].Value.ToString();
            txtMoTa.Text = dataGridView1.Rows[i].Cells[4].Value.ToString();
            //MessageBox.Show(dataGridView1.Rows[i].Cells[3].Value.ToString());
            if (dataGridView1.Rows[i].Cells[5].Value.ToString()=="True")
            {
                rdMon1.Checked = true;
            }
            else
            {
                rdMon0.Checked = true;
            }

        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (txtMaMon.Text != "" && txtTenMon.Text != "")
            {
                //con.Open();
                //cmd = con.CreateCommand();
                //cmd.CommandText = "Mon_Xoa";
                //cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@MaMon", txtMaMon.Text);
                //cmd.ExecuteNonQuery();
                //con.Close();
                MessageBox.Show("Record Deleted Successfully!");
                string query = "WHERE dbo.Mon.MaLoaiMon= N'" + comboBox1.SelectedValue + "'";
                DisplayData(query);
                ClearData();
            }
            else
            {
                MessageBox.Show("Please Select Record to Delete");
            }
        }

        private void txtTenMon_TextChanged(object sender, EventArgs e)
        {

        }

        private void MonThem_Click(object sender, EventArgs e)
        {
            if (txtTenMon.Text != "" && txtMaMon.Text != "")
            {
                //sql = @"INSERT INTO [dbo].[MAT_HANG] ( Ma_MH, Ten_MH, Loai_MH, Tluong_MH, Mau_MH, Ton_Kho_MH, Gia_Mua_MH, Gia_Ban_MH, Ma_NCC ) " +
                //      " VALUES (@Ma_MH, @Ten_MH, @Loai_MH, @Tluong_MH, @Mau_MH, @Ton_Kho_MH, @Gia_Mua_MH, @Gia_Ban_MH, @Ma_NCC );" +
                //      "INSERT INTO [dbo].[CHI_TIET_DH] ([Ma_DH],[Ma_MH],[Sluong_dat],[Gia],[Ngay_giao_DK]) " +
                //      "VALUES (@Ma_DH, @Ma_MH , @Sluong_dat, @Gia, @Ngay_giao_DK)";
                //con.Open();
                //cmd = con.CreateCommand();
                //cmd.CommandText = "Mon_Them";
                //cmd.CommandType = System.Data.CommandType.StoredProcedure;

                //cmd.Parameters.AddWithValue("@MaLoaiMon", cbMaLoaiMon.Text);
                //cmd.Parameters.AddWithValue("@TenMon", txtTenMon.Text);
                //cmd.Parameters.AddWithValue("@Gia", txtGiaMon.Text);
                //cmd.Parameters.AddWithValue("@Mota", txtMoTa.Text);
                //cmd.ExecuteNonQuery();
                //con.Close();
                MessageBox.Show("Record Inserted Successfully");
                string query = " WHERE dbo.Mon.MaLoaiMon= N'" + cbMaLoaiMon.Text +"'";
                //MessageBox.Show(query);
                DisplayData(query);
                ClearData();
            }
            else
            {
                MessageBox.Show("Please Provide Details!");
            }
        }

        private void MonSua_Click(object sender, EventArgs e)
        {
            if (txtTenMon.Text != "" && txtMaMon.Text != "")
            {

                //con.Open();
                //cmd = con.CreateCommand();
                //cmd.CommandText = "Mon_Capnhap";
                //cmd.CommandType = System.Data.CommandType.StoredProcedure;

                //cmd.Parameters.AddWithValue("@MaLoaiMon", cbMaLoaiMon.Text);
                //cmd.Parameters.AddWithValue("@MaMon", txtMaMon.Text);
                //cmd.Parameters.AddWithValue("@TenMon", txtTenMon.Text);
                //cmd.Parameters.AddWithValue("@Gia", txtGiaMon.Text);
                //cmd.Parameters.AddWithValue("@Mota", txtMoTa.Text);
                //if (rdMon1.Checked == true || rdMon0.Checked == true)
                //{
                //    cmd.Parameters.AddWithValue("@TinhTrang", true);
                //}
                //else
                //    cmd.Parameters.AddWithValue("@TinhTrang", false);

                //cmd.ExecuteNonQuery();
                //con.Close();
                //MessageBox.Show("Record Updated Successfully");
                //string query = " WHERE dbo.Mon.MaLoaiMon= N'" + cbMaLoaiMon.Text + "'";
                ////MessageBox.Show(query);
                //DisplayData(query);
                //ClearData();

            }
            else
            {
                MessageBox.Show("Please Provide Details!");
            }
        }

        private void PDMThem_Click(object sender, EventArgs e)
        {
            //con.Open();
            ////Đầu tiên xét trạng thái bàn

            ////MaPDM theo cú pháp 'PDM'+'XX'+'YYMMDD'+'STT'
            ////Kiểm tra tồn tại của MaPDM trong PĐM
            ////-- Tồn tại: Xét trạng thái bàn
            ////-- Không tồn tại: Insert CSDL trong bản PĐM và CTPĐM
            ////Nếu không tồn tại thì tạo PĐM

            //sql = "SELECT MaBan, TinhTrang, BanGop FROM dbo.Ban WHERE MaBan ="+ cbBan.SelectedValue;
            //da = new SqlDataAdapter(sql, con);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            ////Bàn đang được sử dụng
            //if (dt.Rows[0][1].Equals(true))
            //{
            //    //
            //}
            ////Trống
            //else
            //{

            //}
            ////if (dt.Rows.Count > 0)
            ////{
            ////    DataRow row = dt.Rows[0];
            ////    TinhTrang = row["TinhTrang"].ToString();
            ////}
            ////else
            ////{
            ////    MessageBox.Show("WRONG!!!");
            ////}
            ////dataGridView2.DataSource = dt;
            //con.Close();
        }
    }
}

