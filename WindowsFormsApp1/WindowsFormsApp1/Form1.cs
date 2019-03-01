using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {

        //Khai báo đối tượng dùng để đọc dữ liệu bảng 
        SqlDataAdapter da;
        //Khai báo đối tượng kết nối
        SqlConnection con = new SqlConnection(@"Data Source=MY-1MMG59AB2LR7\SQLEXPRESS;Initial Catalog=QLBH;Integrated Security=True");
        //Biến ID dùng để  cập nhật và xóa dữ liệu
        SqlCommand cmd;
        //int ID = 0;

        string sql;
        //Display Data in DataGridView 
        private void DisplayData()
        {
            con.Open();
            DataTable dt = new DataTable();
            sql = "SELECT dbo.MAT_HANG.Ma_MH, dbo.MAT_HANG.Ten_MH, dbo.MAT_HANG.Loai_MH, dbo.MAT_HANG.Tluong_MH, dbo.MAT_HANG.Mau_MH, dbo.MAT_HANG.Ton_Kho_MH, dbo.MAT_HANG.Gia_Mua_MH, " +
              "dbo.MAT_HANG.Gia_Ban_MH, dbo.MAT_HANG.Ma_NCC, dbo.CHI_TIET_DH.Ma_DH, dbo.CHI_TIET_DH.Sluong_dat, dbo.CHI_TIET_DH.Gia, " +
              "dbo.CHI_TIET_DH.Ngay_giao_DK " +
              "FROM dbo.MAT_HANG LEFT JOIN dbo.CHI_TIET_DH ON dbo.MAT_HANG.Ma_MH = dbo.CHI_TIET_DH.Ma_MH WHERE dbo.MAT_HANG.Ma_NCC = N'" + Ma_NCC.Text + "'";
            da = new SqlDataAdapter(sql, con);
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            con.Close();
        }
        //Clear Data  
        private void ClearData()
        {
            Ma_MH.Clear();
            Ten_MH.Clear();
            Loai_MH.Clear();
            Ton_Kho_MH.Clear();
            Mau_MH.Clear();
            Tluong_MH.Clear();
            Gia_Mua_MH.Clear();
            Gia_Ban_MH.Clear();
            Ma_NCC.Clear();
        }
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            //Hiển thị dữ liệu ComboBox

            //Khởi tạo đối tượng dữ liệu
            sql = "Select * from NHA_CUNG_CAP";
            da = new SqlDataAdapter(sql, con);
            //Khai báo đối tượng datatable để chứa dữ liệu
            DataTable dt = new DataTable();
            //Điền dữ liệu vào đối tượng Datatable
            da.Fill(dt);
            //Giải phóng đối tượng SqlDataAdapter
            da.Dispose();

            //Gán dữ liệu nguồn
            comboBox1.DataSource = dt;
            //Gán trường sẽ hiển thị trên comboBox
            comboBox1.DisplayMember = "Ten_NCC";
            //Gã trường mã ẩn sau mỗi trường trên comboBox
            //Nhằm mục đích khi chọn 1 item sẽ sử dụng mã ẩn để lọc dữ liệu 
            comboBox1.ValueMember = "Ma_NCC";

        }

        private void button1_Click(object sender, EventArgs e)
        {
            sql = "SELECT dbo.MAT_HANG.Ma_MH, dbo.MAT_HANG.Ten_MH, dbo.MAT_HANG.Loai_MH, dbo.MAT_HANG.Tluong_MH, dbo.MAT_HANG.Mau_MH, dbo.MAT_HANG.Ton_Kho_MH, dbo.MAT_HANG.Gia_Mua_MH, "+
                  "dbo.MAT_HANG.Gia_Ban_MH, dbo.MAT_HANG.Ma_NCC, dbo.CHI_TIET_DH.Ma_DH, dbo.CHI_TIET_DH.Sluong_dat, dbo.CHI_TIET_DH.Gia, "+
                  "dbo.CHI_TIET_DH.Ngay_giao_DK "+
                  "FROM dbo.MAT_HANG LEFT JOIN dbo.CHI_TIET_DH ON dbo.MAT_HANG.Ma_MH = dbo.CHI_TIET_DH.Ma_MH WHERE dbo.MAT_HANG.Ma_NCC = N'" + comboBox1.SelectedValue + "'";
            da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Dispose();

            dataGridView1.DataSource = dt;
            
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //sql= "SELECT * FROM MAT_HANG WHERE Ma_NCC = N'" + comboBox1.SelectedValue + "'"
            //// Khởi tạo đối tượng đọc dữ liệu
            //da = new SqlDataAdapter(sql, con);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            //da.Dispose();

            //dataGridView1.DataSource = dt;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

            int i = dataGridView1.CurrentRow.Index;
            Ma_MH.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            Ten_MH.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
            Loai_MH.Text = dataGridView1.Rows[i].Cells[2].Value.ToString();
            Ton_Kho_MH.Text = dataGridView1.Rows[i].Cells[3].Value.ToString();
            Mau_MH.Text = dataGridView1.Rows[i].Cells[4].Value.ToString();
            Tluong_MH.Text = dataGridView1.Rows[i].Cells[5].Value.ToString();
            Gia_Mua_MH.Text = dataGridView1.Rows[i].Cells[6].Value.ToString();
            Gia_Ban_MH.Text = dataGridView1.Rows[i].Cells[7].Value.ToString();      
            Ma_NCC.Text = dataGridView1.Rows[i].Cells[8].Value.ToString();
            //textBox1.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            //textBox2.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();


        }

        //Cập nhập- refesh
        private void button2_Click(object sender, EventArgs e)
        {
            
        }
        //Thêm mới
        private void button3_Click(object sender, EventArgs e)
        {
            if (Ten_MH.Text != "" && Ma_MH.Text != "")
            {
                sql = "INSERT INTO [dbo].[MAT_HANG] ( Ma_MH, Ten_MH, Loai_MH, Tluong_MH, Mau_MH, Ton_Kho_MH, Gia_Mua_MH, Gia_Ban_MH, Ma_NCC ) "+
                      " VALUES (@Ma_MH, @Ten_MH, @Loai_MH, @Tluong_MH, @Mau_MH, @Ton_Kho_MH, @Gia_Mua_MH, @Gia_Ban_MH, @Ma_NCC ) ";
                cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.Parameters.AddWithValue("@Ma_MH", Ma_MH.Text);
                cmd.Parameters.AddWithValue("@Ten_MH", Ten_MH.Text);
                cmd.Parameters.AddWithValue("@Loai_MH", Loai_MH.Text);
                cmd.Parameters.AddWithValue("@Tluong_MH", Tluong_MH.Text);
                cmd.Parameters.AddWithValue("@Mau_MH", Mau_MH.Text);
                cmd.Parameters.AddWithValue("@Ton_Kho_MH", Ton_Kho_MH.Text);
                cmd.Parameters.AddWithValue("@Gia_Mua_MH", Gia_Mua_MH.Text);
                cmd.Parameters.AddWithValue("@Gia_Ban_MH", Gia_Ban_MH.Text);
                cmd.Parameters.AddWithValue("@Ma_NCC", Ma_NCC.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("Record Inserted Successfully");
                DisplayData();
                ClearData();
            }
            else
            {
                MessageBox.Show("Please Provide Details!");
            }
        }
        //Sửa 
        private void button4_Click(object sender, EventArgs e)
        {
            if (Ten_MH.Text != "" && Ma_MH.Text != "")
            {
                sql = "UPDATE[dbo].[MAT_HANG] SET" +
                       "[Ten_MH] = @Ten_MH, "+
                       "[Loai_MH] = @Loai_MH, " +
                       "[Tluong_MH] = @Tluong_MH, " +
                       "[Mau_MH] = @Mau_MH, " +
                       "[Ton_Kho_MH] = @Ton_Kho_MH, " +
                       "[Gia_Mua_MH] = @Gia_Mua_MH, " +
                       "[Gia_Ban_MH] = @Gia_Ban_MH, " +
                       "[Ma_NCC] = @Ma_NCC " +
                       "WHERE [Ma_MH]=@Ma_MH";
                cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.Parameters.AddWithValue("@Ma_MH", Ma_MH.Text);
                cmd.Parameters.AddWithValue("@Ten_MH", Ten_MH.Text);
                cmd.Parameters.AddWithValue("@Loai_MH", Loai_MH.Text);
                cmd.Parameters.AddWithValue("@Tluong_MH", Tluong_MH.Text);
                cmd.Parameters.AddWithValue("@Mau_MH", Mau_MH.Text);
                cmd.Parameters.AddWithValue("@Ton_Kho_MH", Ton_Kho_MH.Text);
                cmd.Parameters.AddWithValue("@Gia_Mua_MH", Gia_Mua_MH.Text);
                cmd.Parameters.AddWithValue("@Gia_Ban_MH", Gia_Ban_MH.Text);
                cmd.Parameters.AddWithValue("@Ma_NCC", Ma_NCC.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("Record Updated Successfully");
                DisplayData();
                ClearData();

            }
            else
            {
                MessageBox.Show("Please Provide Details!");
            }
        }
        //Xóa
        private void button5_Click(object sender, EventArgs e)
        {
            if (Ten_MH.Text != "" && Ma_MH.Text != "")
            {
                sql= "DELETE FROM [dbo].[MAT_HANG] WHERE[Ma_MH] = @Ma_MH";
                cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.Parameters.AddWithValue("@Ma_MH", Ma_MH.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                MessageBox.Show("Record Deleted Successfully!");
                DisplayData();
                ClearData();
            }
            else
            {
                MessageBox.Show("Please Select Record to Delete");
            }
        }
       
        //Clear
        private void button6_Click(object sender, EventArgs e)
        {
            ClearData();
           
        }

        private void Ma_MH_TextChanged(object sender, EventArgs e)
        {

        }
    }

}
