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
        int soluong=1;
        int num=1;
        object[] row = { };
        //int soluong = 1;
        LoaiMon_BLL loaimon = new LoaiMon_BLL();
        Ban_BLL ban = new Ban_BLL();
        Mon_BLL mon = new Mon_BLL();
        PhieuDatMon_BLL pdm = new PhieuDatMon_BLL();
        ChiTietPDM_BLL ctpdm = new ChiTietPDM_BLL();
        public QuanLyNghiepVuBan()
        {
            // Define the border style of the form to a dialog box.
            this.FormBorderStyle = FormBorderStyle.FixedDialog;

            // Set the MaximizeBox to false to remove the maximize box.
            this.MaximizeBox = false;

            // Set the MinimizeBox to false to remove the minimize box.
            this.MinimizeBox = false;
            
            // Set the start position of the form to the center of the screen.
            this.StartPosition = FormStartPosition.CenterScreen;

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
  
            ///Recieve table-number from Trangchu
            lb_soBan.Text = TrangChu.SetMaBan;
            int MaPDM=0;
            if (pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString())).Rows.Count > 0)
            {
                MaPDM = int.Parse(pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString())).Rows[0]["MaPDM"].ToString());
            }
            //Check if exist ChiTietPDM show on DataGridView
            DataTable dt = ctpdm.ThonTinPDM_ChonTai(int.Parse(MaPDM.ToString()));
            if (dt != null)
            {

                foreach (DataRow dr in dt.Rows)
                {
                    object[] field = new object[4];
                    int dem = 0;
                    //MessageBox.Show("Thành công");
                    foreach (DataColumn dc in dt.Columns)
                    {
                        field[dem] = dr[dc.ColumnName];
                        if (dem == 3)
                        {
                            field[dem] = double.Parse(dr[dc.ColumnName].ToString()) * soluong;
                        }
                        if (dem == 2)
                        {
                            soluong = int.Parse(field[dem].ToString());
                        }
                        dem++;
                    }

                    dataGridView2.Rows.Add(field);

                }
                DataGridViewButtonColumn btn = new DataGridViewButtonColumn();
                dataGridView2.Columns.Add(btn);
                btn.HeaderText = "Xóa món";
                btn.Text = "Xóa";
                btn.Name = "btn";
                btn.UseColumnTextForButtonValue = true;
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

        //Đưa giá trị vào textbox
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

        //Thay đổi số lượng và thêm món 
        private void btn_addMon_Click(object sender, EventArgs e)
        {

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
                        soluong = int.Parse(row1.Cells[2].Value.ToString());
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

        private void DataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
           
            if (e.ColumnIndex == 4)
            {
                //MessageBox.Show((e.RowIndex + 1) + "  Row  " + (e.ColumnIndex + 1) + "  Column button clicked ");
                int i = dataGridView2.CurrentRow.Index;
                dataGridView2.Rows[i].Cells[2].Value = int.Parse(dataGridView2.Rows[i].Cells[2].Value.ToString()) - 1;
                dataGridView2.Rows[i].Cells[3].Value = double.Parse(txtGiaMon.Text) * int.Parse(dataGridView2.Rows[i].Cells[2].Value.ToString());
            }
           

        }
        // Đưa giá trị vào text box grid2
        private void DataGridView2_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            int i = dataGridView2.CurrentRow.Index;
            txtMaMon.Text = dataGridView2.Rows[i].Cells[0].Value.ToString();
            txtTenMon.Text = dataGridView2.Rows[i].Cells[1].Value.ToString();
            txtGiaMon.Text = (int.Parse(dataGridView2.Rows[i].Cells[3].Value.ToString()) / int.Parse(dataGridView2.Rows[i].Cells[2].Value.ToString())).ToString();
        }
        private void Btn_LuuPDM_Click(object sender, EventArgs e)
        {
            if(dataGridView2.Rows.Count == 0)
            {
                MessageBox.Show(" thành công!!!!");
            }
            else
            {

            }
            if (ban.Ban_ChonTai(int.Parse(lb_soBan.Text.ToString())).Rows[0]["TinhTrang"].ToString() == "True")
            {
               

                //Tạo phiếu đặt món
                pdm.PhieuDatMon_Them("NV05061901", int.Parse(lb_soBan.Text.ToString()), 0, 0, 0);
                int MaPDM = int.Parse(pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString())).Rows[0]["MaPDM"].ToString());
                //Tao chi tiết PDM
                //Lấy MaPDM
                int dem = 0;
                //Lặp lại việc thêm ChiTietPDM
                foreach (DataGridViewRow row in dataGridView2.Rows)
                {
                    if (row.Cells[0].Value != null)
                        //MessageBox.Show(row.Cells[1].Value.ToString());
                        ctpdm.ChiTietPDM_Them(MaPDM, int.Parse(row.Cells[0].Value.ToString()), soluong);
                    dem++;
                }
                if (dem > 1)
                { ban.Ban_CapNhap(int.Parse(lb_soBan.Text.ToString()), false, 0); }
                else
                {
                    ctpdm.ChiTietPDM_Xoa(MaPDM);
                }
                MessageBox.Show("Thêm thành công!!!!");
                
                //Chưa xử lý trường hợp tạo PĐM nhưng chưa không nhập dữ liệu cho ChiTietPDMD

            }
            else
            {

                // Bàn đang có khách
                //Cập nhập-- Trường hợp có thêm món và trường hợp thay đổi số lượng (chưa làm)
                //Lấy MaPDM
                int MaPDM = int.Parse(pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString())).Rows[0]["MaPDM"].ToString());
                //Lặp lại việc cập nhập ChiTietPDM
                foreach (DataGridViewRow row in dataGridView2.Rows)
                {
                    if (row.Cells[0].Value != null)
                    {
                        //MessageBox.Show(row.Cells[1].Value.ToString());
                        ctpdm.ChiTietPDM_Sua(MaPDM, int.Parse(row.Cells[0].Value.ToString()), soluong);
                    }


                }

                //Thanh toán

                //Nghiệp vụ chuyển bàn
            }

            MovetoHome();
        }

        private void PDMXoa_Click(object sender, EventArgs e)
        {
            int mapdm = int.Parse(pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString())).Rows[0]["MaPDM"].ToString());
            //Xóa chi tiết phiếu đặt món
            ctpdm.ChiTietPDM_Xoa(mapdm);
            //Xóa phiếu đặt món
            pdm.PhieuDatMon_Xoa(mapdm);

            //thay đổi tình trạng bàn
            ban.Ban_CapNhap(int.Parse(lb_soBan.Text.ToString()), true, 0);
            //Chuyển ra trangchu
            MovetoHome();
        }

        private void MovetoHome()
        {
            this.Hide();
            TrangChu home = new TrangChu();
            home.ShowDialog(); // Shows Form2
        }

        private void Btn_back_Click(object sender, EventArgs e)
        {
            MovetoHome();
        }

        
    }
}
