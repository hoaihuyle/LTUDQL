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
        //Tiền
        int soluong=1;
        float red;
        float sur;

        //Số lượng
        int num = 1;
        //Tổng page
        int tong = 0;
        object[] row = { };
        DataTable dt;
        //int soluong = 1;
        LoaiMon_BLL loaimon = new LoaiMon_BLL();
        Ban_BLL ban = new Ban_BLL();
        Mon_BLL mon = new Mon_BLL();
        PhieuDatMon_BLL pdm = new PhieuDatMon_BLL();
        ChiTietPDM_BLL ctpdm = new ChiTietPDM_BLL();
        HoaDon_BLL hd = new HoaDon_BLL();

        //Nghiệp vụ chuyển bàn
        public static string Moveban ="";
        public static string Movepdm = "";
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
            lb_MaNV.Text = "NV23051901";
            lb_pdm.Text = "";
            dt = pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString()));
            if (dt.Rows.Count > 0)
            {
                //if (dt.Rows[0]["TinhTrang"].ToString() == "True")
                //{
                    lb_pdm.Text = dt.Rows[0]["MaPDM"].ToString();
                    txt_tong.Text = dt.Rows[0]["ThanhTien"].ToString();
                    txt_surcharge.Text = dt.Rows[0]["PhuThu"].ToString();
                    txt_reduce.Text = dt.Rows[0]["GiamGia"].ToString();
                    tong = int.Parse(txt_tong.Text);
                    txt_tong.ReadOnly = true;
                    txt_tong.BackColor = System.Drawing.SystemColors.Window;
                //}

            }
            //Check if exist ChiTietPDM show on DataGridView
            dt = ctpdm.ThonTinPDM_ChonTai(lb_pdm.Text);
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                   
                    object[] field = new object[5];
                    int dem = 0;
                   
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
            dataGridView1.DataSource = mon.Mon_ChonAll_where_LoaiMon(int.Parse(comboBox1.SelectedValue.ToString()));
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
                   
                    if (txtMaMon.Text!="" && txtTenMon.Text!="" && txtGiaMon.Text != "")
                    {
                        row = new object[] { txtMaMon.Text, txtTenMon.Text, num.ToString(), double.Parse(txtGiaMon.Text) };
                        dataGridView2.Rows.Add(row);
                        tong += int.Parse(txtGiaMon.Text);  
                        txt_tong.Text = tong.ToString();
                        return;
                    }
                    else
                    {
                        MessageBox.Show("Xin mời chọn món!!!");
                    }
                    

                }
                else
                {
                    
                    if (row1.Cells[0].Value.ToString() == txtMaMon.Text.ToString())
                    {
                        //update cell[2]- soluong
                        row1.Cells[2].Value = int.Parse(row1.Cells[2].Value.ToString()) + 1;
                        soluong = int.Parse(row1.Cells[2].Value.ToString());
                        row1.Cells[3].Value = Math.Abs(double.Parse(txtGiaMon.Text)*int.Parse(row1.Cells[2].Value.ToString()));
                        tong = tong + int.Parse(txtGiaMon.Text);
                        txt_tong.Text = tong.ToString();
                        return;
                    } 
                }
                
            }
            
        }


        private void DataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int i = dataGridView2.CurrentRow.Index;
            Set_Textbox(i);
            if (e.ColumnIndex == 4 )
            {
                //MessageBox.Show((e.RowIndex + 1) + "  Row  " + (e.ColumnIndex + 1) + "  Column button clicked ");
                if (i >= 0)
                {
                    //Số lượng
                    soluong = int.Parse(dataGridView2.Rows[i].Cells[2].Value.ToString());
                    if (soluong >= 2)
                    {
                        dataGridView2.Rows[i].Cells[2].Value = soluong - 1;
                        //Thành tiền
                        if (txtGiaMon.Text != "")
                        {
                            dataGridView2.Rows[i].Cells[3].Value = double.Parse(txtGiaMon.Text) * int.Parse(dataGridView2.Rows[i].Cells[2].Value.ToString());
                  
                        }
                        else MessageBox.Show("Xin chọn món!!!!");
                    }
                    else
                    {
                        dataGridView2.Rows.RemoveAt(i);
                        
                    }
                    TongTien(int.Parse(txtGiaMon.Text), 1, 0);
                }
                else
                    MessageBox.Show("Xin chọn món cần xóa");
            }
           
           

        }

        private void TongTien(int gia, int sl, int dau)
        {
            if(dau==0)
                tong -= gia * sl;
            else tong += int.Parse(txtGiaMon.Text);
            txt_tong.Text = tong.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            if (dataGridView2.CurrentRow != null && dataGridView2.CurrentRow.Index < dataGridView2.Rows.Count - 1)
            {
                int i = dataGridView2.CurrentRow.Index;
                TongTien(int.Parse(txtGiaMon.Text.ToString()), soluong, 0);
                dataGridView2.Rows.RemoveAt(i);
            }
            else MessageBox.Show("Chọn món cần xóa");
        }

        private void Set_Textbox(int i)
        {
            
            if(dataGridView2.Rows[i].Cells[0].Value!=null)
            {
                txtMaMon.Text = dataGridView2.Rows[i].Cells[0].Value.ToString();
                txtTenMon.Text = dataGridView2.Rows[i].Cells[1].Value.ToString();
                //Nếu số lượng =0
                soluong = int.Parse(dataGridView2.Rows[i].Cells[2].Value.ToString());
                if (soluong == 0)
                    soluong = 1;
                txtGiaMon.Text = (int.Parse(dataGridView2.Rows[i].Cells[3].Value.ToString()) / soluong).ToString();
                //txtMaMon.Text = dataGridView2.Rows[i].Cells[0].Value.ToString();
                //txtTenMon.Text = dataGridView2.Rows[i].Cells[1].Value.ToString();
                //txtGiaMon.Text = (int.Parse(dataGridView2.Rows[i].Cells[3].Value.ToString()) / int.Parse(dataGridView2.Rows[i].Cells[2].Value.ToString())).ToString();
            }
        }

        // Đưa giá trị vào text box grid2
        private void DataGridView2_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            int i = dataGridView2.CurrentRow.Index;
            Set_Textbox(i);
        }

        //Lưu PĐM
        private void Btn_LuuPDM_Click(object sender, EventArgs e)
        {
            LuuPDM(1);
            MovetoHome();
        }

        //In PĐM- Chuyển trạng thái PĐM
        private void PDMIn_Click(object sender, EventArgs e)
        {

            LuuPDM(2);
            MovetoHome();
        }
        private void LuuPDM( int tinhtrang)
        {
            //Phụ thu, giảm giá va tổng tiền
            if (txt_reduce.Text != "")
                red = float.Parse(txt_reduce.Text.ToString());
            if (txt_surcharge.Text != "")
                sur = float.Parse(txt_surcharge.Text.ToString());

            if (int.Parse(ban.Ban_ChonTai(int.Parse(lb_soBan.Text.ToString())).Rows[0]["TinhTrang"].ToString()) == 0)
            {
                //Tạo phiếu đặt món
                pdm.PhieuDatMon_Them(lb_MaNV.Text, int.Parse(lb_soBan.Text.ToString()), 0, 0, 0);
                //Lấy MaPDM
                lb_pdm.Text = (pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString())).Rows[0]["MaPDM"].ToString());


            }
            else
            {
                // Bàn đang có khách
                //Xóa CTPDM
                ctpdm.ChiTietPDM_Xoa(lb_pdm.Text);

            }

            //Tao chi tiết PDM
            int dem = 0;
            //Lặp lại việc thêm ChiTietPDM
            foreach (DataGridViewRow row in dataGridView2.Rows)
            {
                if (row.Cells[0].Value != null)
                {
                    ctpdm.ChiTietPDM_Them(lb_pdm.Text, int.Parse(row.Cells[0].Value.ToString()), int.Parse(row.Cells[2].Value.ToString()));
                }
                dem++;
            }
            //Nếu chi tiết phiếu đặt món rỗng thì không được-- còn lỗi
            if (dem > 1)
            {
                if (pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString())).Rows[0]["TinhTrang"].ToString() == "True")
                    ban.Ban_Sua(int.Parse(lb_soBan.Text.ToString()), tinhtrang, 0);
            }
            else
            {
                //Xóa phiếu đặt món, xóa bàn, xóa CTPDM
                DialogResult dialogResult = MessageBox.Show("Bạn có muốn xóa bàn ?", "Xóa bàn", MessageBoxButtons.YesNo);
                if (dialogResult == DialogResult.Yes)
                {
                    //do something
                    XoaBanPDM();
                }
                else if (dialogResult == DialogResult.No)
                {
                    //do something else
                }
            }
            
            if(tinhtrang==1)
            {
                if (pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString())).Rows[0]["TinhTrang"].ToString() == "True")
                    pdm.PhieuDatMon_Sua(lb_pdm.Text.ToString(), lb_MaNV.Text.ToString(), int.Parse(lb_soBan.Text), true, tong, red, sur);
                else
                    MessageBox.Show("Phiếu đã được xuất!! Gặp người quản lý để thay đổi thông tin.");
            }
            else
                pdm.PhieuDatMon_Sua(lb_pdm.Text.ToString(), lb_MaNV.Text.ToString(), int.Parse(lb_soBan.Text), false, tong, red, sur);

            //MessageBox.Show(lb_pdm.Text.ToString() + "-" + lb_MaNV.Text.ToString());
           
        }
        //Thanh toán
        private void HoaDon_Click(object sender, EventArgs e)
        {
            ////Tạo HĐ
            if (lb_pdm.Text.ToString() == "")
                LuuPDM(1);
            //MessageBox.Show(lb_pdm.Text.ToString() + "-" + lb_MaNV.Text.ToString());
            hd.HoaDon_Them(lb_pdm.Text.ToString(), lb_MaNV.Text.ToString());
            //Nếu chưa tồn tại pdm
           
            //Chuyển tình trạng bàn
            ban.Ban_Sua(int.Parse(lb_soBan.Text.ToString()), 0, 0);
            MovetoHome();
        }
        
       

        private void XoaBanPDM()
        {
            if (pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString())).Rows[0]["TinhTrang"].ToString() == "True")
            {
                //Xóa chi tiết phiếu đặt món
                ctpdm.ChiTietPDM_Xoa(lb_pdm.Text);
                //Xóa phiếu đặt món
                pdm.PhieuDatMon_Xoa(lb_pdm.Text);

                //thay đổi tình trạng bàn
                ban.Ban_Sua(int.Parse(lb_soBan.Text.ToString()), 0, 0);
                //Chuyển ra trangchus
            }
            else
            {
                MessageBox.Show("Phiếu đã được xuất!! Gặp người quản lý để thay đổi thông tin.");
            }
            MovetoHome();
        }
        private void PDMXoa_Click(object sender, EventArgs e)
        {
            XoaBanPDM();
        }

        private void MovetoHome()
        {
            this.Hide();
            TrangChu home = new TrangChu();
            home.ShowDialog(); // Shows Form2
        }
        private void ReloadPage()
        {
            this.Hide();
            QuanLyNghiepVuBan f2 = new QuanLyNghiepVuBan();
            f2.ShowDialog(); // Shows Form2
        }
        private void Btn_search_Click(object sender, EventArgs e)
        {
            foreach (DataGridViewRow row in dataGridView2.Rows)
            {
                if (row.Cells[0].Value != null)
                {
                    if (row.Cells[0].Value.ToString() == txt_search.Text.ToString())
                    {
                        dataGridView2.DataSource = row;
                    }
                }
               
            }
        }

        private void ComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void Btn_back_Click_1(object sender, EventArgs e)
        {
            MovetoHome();
        }
        //Nghiệp vụ chuyển bàn
        private void Btn_Mvtb_Click_1(object sender, EventArgs e)
        {
            if (lb_pdm.Text == "")
            {
                MessageBox.Show("Bàn đang trống không thể chuyển bàn !!!");
                return;
            }
            Moveban = lb_soBan.Text;
            Movepdm = lb_pdm.Text;
            this.Hide();
            TrangChu.ktmoveSucess = false;
            TrangChu home = new TrangChu();
            home.ShowDialog(); // Shows Form2
        }
        //Nghiệp vụ gộp bàn
        private void Btn_Comb_Click(object sender, EventArgs e)
        {

        }

        private void QuanLyNghiepVuBan_Load(object sender, EventArgs e)
        {

        }

        private void QuanLyNghiepVuBan_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Hide();
            TrangChu home = new TrangChu();
            home.ShowDialog();
        }
    }
}
