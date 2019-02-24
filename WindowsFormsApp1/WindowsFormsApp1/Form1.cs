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


        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            //Hiển thị dữ liệu ComboBox

            //Khởi tạo đối tượng dữ liệu
            da = new SqlDataAdapter("Select * from NHA_CUNG_CAP", con);
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

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            da = new SqlDataAdapter("Select m.Ten_MH,c.Ma_GH,c.Ma_MH,c.Sluong_giao,c.Ma_DH from MAT_HANG as m JOIN CHI_TIET_GH as c ON m.Ma_MH=c.Ma_MH WHERE m.Ma_NCC = N'" + comboBox1.SelectedValue + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Dispose();

            dataGridView1.DataSource = dt;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //SqlConnection cn = new SqlConnection(con);
            // Khởi tạo đối tượng đọc dữ liệu
            da = new SqlDataAdapter("SELECT * FROM MAT_HANG WHERE Ma_NCC = N'" + comboBox1.SelectedValue+"'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            da.Dispose();

            dataGridView1.DataSource = dt;
        }

    }
}
