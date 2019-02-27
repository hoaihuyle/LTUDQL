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
        SqlConnection con = new SqlConnection(@"Data Source=A5233\MISASME2017;Initial Catalog=QLBH;Integrated Security=True");

        string sql;

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
            sql = "SELECT * FROM dbo.MAT_HANG LEFT JOIN dbo.CHI_TIET_DH ON dbo.MAT_HANG.Ma_MH = dbo.CHI_TIET_DH.Ma_MH  WHERE dbo.MAT_HANG.Ma_NCC = N'" + comboBox1.SelectedValue + "'";
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
            //DataTable dt = new DataTable();
            //dt.Columns.Add("id");
            //dt.Columns.Add("name");

            //dt.Rows.Add(textBox1.Text, textBox2.Text);
            //if (dt.Rows.Count > 0)
            //{
            //    dataGridView1.DataSource = null;  //null the ItemSource just before you set the new value: 
            //    dataGridView1.DataSource = dt.DefaultView;
            //}
            //da.Dispose();
            //sql = "SELECT * FROM dbo.MAT_HANG LEFT JOIN dbo.CHI_TIET_DH ON dbo.MAT_HANG.Ma_MH = dbo.CHI_TIET_DH.Ma_MH  WHERE dbo.MAT_HANG.Ma_NCC = N'" + comboBox1.SelectedValue + "'";
            //da = new SqlDataAdapter(sql, con);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            //da.Dispose();
            int i = dataGridView1.CurrentRow.Index;
            textBox1.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            textBox2.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
         
            //textBox1.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            //textBox2.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();


        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.Clear();
            textBox2.Clear();
        }
    }
}
