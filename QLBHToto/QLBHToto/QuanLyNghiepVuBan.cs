using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;


namespace QLBHToto
{
    public partial class QuanLyNghiepVuBan : Form
    {
        int num=1;
        object[] row = { };
        LoaiMon_BLL loaimon = new LoaiMon_BLL();
        Ban_BLL ban = new Ban_BLL();
        Mon_BLL mon = new Mon_BLL();
        PhieuDatMon_BLL pdm = new PhieuDatMon_BLL();
        ChiTietPDM_BLL ctpdm = new ChiTietPDM_BLL();
        public QuanLyNghiepVuBan()
        {
            InitializeComponent();
            ////Gán dữ liệu nguồn
            comboBox1.DataSource = loaimon.LoaiMon_Select();
            ////Gán trường sẽ hiển thị trên comboBox
            comboBox1.DisplayMember = "TenLoaiMon";
            ////Gã trường mã ẩn sau mỗi trường trên comboBox
            ////Nhằm mục đích khi chọn 1 item sẽ sử dụng mã ẩn để lọc dữ liệu 
            comboBox1.ValueMember = "MaLoaiMon";


            dataGridView2.ColumnCount = 4;
            dataGridView2.Columns[0].Name = "Mã Món";
            dataGridView2.Columns[1].Name = "Tên Món";
            dataGridView2.Columns[2].Name = "Số lượng";
            dataGridView2.Columns[3].Name = "Thành tiền";

            //REcieve number table from Trangchu
            lb_soBan.Text = TrangChu.SetMaBan;
            //Check if exist ChiTietPDM show on DataGridView
            if (ctpdm.ThonTinPDM_ChonTai(int.Parse(lb_soBan.Text)) != null)
            {
                
                foreach (DataRow dr in ctpdm.ThonTinPDM_ChonTai(int.Parse(lb_soBan.Text)).Rows)
                {
                    object[] field = new object[4];
                    int dem = 0;
                    double sl = 1;
                    //MessageBox.Show("Thành công");
                    foreach (DataColumn dc in ctpdm.ThonTinPDM_ChonTai(int.Parse(lb_soBan.Text)).Columns)
                    {
                        field[dem] = dr[dc.ColumnName];
                        if (dem==3)
                        {
                            field[dem] = double.Parse(dr[dc.ColumnName].ToString())* sl;
                        }
                        if(dem==2)
                        {
                           sl = double.Parse(field[dem].ToString());
                        }
                        //MessageBox.Show("Thành công");
                        dem++;
                    }
                    dataGridView2.Rows.Add(field);
                }
            }
        }

        private void ClearData()
        {
            txtTenMon.Clear();
            txtGiaMon.Clear();

        }

        private void DisplayData(string query)
        {
          

        }

        

        private void dataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            int i = dataGridView1.CurrentRow.Index;
            txtMaMon.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            
            txtTenMon.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
            txtGiaMon.Text = dataGridView1.Rows[i].Cells[2].Value.ToString();

          

        }

        private void btn_HienThi_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = mon.Mon_Select_Where_LoaiMon(int.Parse(comboBox1.SelectedValue.ToString()));
        }



        private void splitContainer1_Panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btn_addMon_Click(object sender, EventArgs e)
        {

            //Finish 04/05/1998 
            foreach (DataGridViewRow row1 in dataGridView2.Rows)
            {
                if (row1.Cells[0].Value == null)
                {
                    row = new object[] { txtMaMon.Text, txtTenMon.Text, num.ToString(), double.Parse(txtGiaMon.Text) };
                    dataGridView2.Rows.Add(row);
                   
                    return;

                }
                else
                {
                    if (row1.Cells[0].Value.ToString() == txtMaMon.Text.ToString())
                    {
                        //update cell[2]- soluong
                        row1.Cells[2].Value = int.Parse(row1.Cells[2].Value.ToString()) + 1;
                        row1.Cells[3].Value = double.Parse(txtGiaMon.Text)*int.Parse(row1.Cells[2].Value.ToString());
                        return;
                    }

                }
            }
           

        }

        private void button1_Click(object sender, EventArgs e)
        {
            int i = dataGridView2.CurrentRow.Index;
            dataGridView2.Rows[i].Cells[2].Value= int.Parse(dataGridView2.Rows[i].Cells[2].Value.ToString()) - 1;
            dataGridView2.Rows[i].Cells[3].Value = double.Parse(txtGiaMon.Text) * int.Parse(dataGridView2.Rows[i].Cells[2].Value.ToString());
        }




    }
}
