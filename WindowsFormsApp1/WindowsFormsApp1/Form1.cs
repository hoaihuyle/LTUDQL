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
        SqlConnection cn;
        SqlDataAdapter da;
        string con = @"Data Source=MY-1MMG59AB2LR7\SQLEXPRESS;Initial Catalog=QLBH;Integrated Security=True";
        string sql;
        DataSet ds;
        DataTable dt;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'qLBHDataSet.NHA_CUNG_CAP' table. You can move, or remove it, as needed.
            //this.nHA_CUNG_CAPTableAdapter.Fill(this.qLBHDataSet.NHA_CUNG_CAP);
            SqlConnection cn = new SqlConnection(con);
            sql = "SELECT * FROM MAT_HANG";
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "MAT_HANG");
            dataGridView1.DataSource = ds;
            dataGridView1.DataMember = "MAT_HANG";
            cn.Close();
            cn.Dispose();
            // TODO: This line of code loads data into the 'qLBHDataSet.MAT_HANG' table. You can move, or remove it, as needed.
            //this.mAT_HANGTableAdapter.Fill(this.qLBHDataSet.MAT_HANG);

        }

        //private void comboBox1_Selection(object sender, EventArgs e)
        //{
        //    //Hiển thị danh sách thành viên tương ứng
        //    SqlConnection cn = new SqlConnection(con);
        //    // Khởi tạo đối tượng đọc dữ liệu
        //    da = new SqlDataAdapter("SELECT * FROM WHERE Ma_NCC = " + comboBox1.SelectedValue, cn);
        //    //Khai báo đối tượng Datable để chứa dữ liệu
        //    DataTable dt = new DataTable();
        //    //Điền dữ liệu vào đối tượng DataTable
        //    da.Fill(dt);
        //    //Giải phóng đối tượng SqlDataAdapterdfsdfsd
        //    da.Dispose();

        //    //Gán dữ liệu nguồn
        //    dataGridView1.DataSource = dt;
        //}
    }
}
