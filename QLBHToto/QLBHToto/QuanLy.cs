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
    
    public partial class QuanLy : Form
    {
        public static bool CheckQT = true;
        TaiKhoan_BLL tk = new TaiKhoan_BLL();
        LoaiMon_BLL lm = new LoaiMon_BLL();
        Mon_BLL mon = new Mon_BLL();
        Ban_BLL ban = new Ban_BLL();
        HoaDon_BLL hd = new HoaDon_BLL();
        ChiTietPDM_BLL ctpdm = new ChiTietPDM_BLL();
        NhanVien_BLL nv = new NhanVien_BLL();
        public QuanLy()
        {
            InitializeComponent();
            //this.TopMost = true;
            //this.FormBorderStyle = FormBorderStyle.SizableToolWindow;//.None; 
            //this.FormBorderStyle = FormBorderStyle.Fixed3D;
            //this.WindowState = FormWindowState.Maximized;


            this.FormBorderStyle = FormBorderStyle.FixedDialog;

            // Set the MaximizeBox to false to remove the maximize box.
            this.MaximizeBox = false;

            // Set the MinimizeBox to false to remove the minimize box.
            this.MinimizeBox = false;

            // Set the start position of the form to the center of the screen.
            this.StartPosition = FormStartPosition.CenterScreen;

            //Set loading report default
            crystalReportViewer1.Zoom(75);
        }


        private void QuanLy_FormClosing(object sender, FormClosingEventArgs e)
        {
            //if (MessageBox.Show("Bạn có chắc chắn muốn thoát chương trình ?", "Thông báo", MessageBoxButtons.OKCancel) != System.Windows.Forms.DialogResult.OK)
            //{
            //    e.Cancel = true;
            //}
            this.Hide();
            TrangChu home = new TrangChu();
            home.ShowDialog();
        }

        private void QuanLy_Load(object sender, EventArgs e)
        {
            //Datagridview
            //Nhân viên
            Loadcb();

            dtgvAccount.DataSource = nv.NhanVien_ChonAll();
            this.dtgvAccount.Columns["MatKhau"].Visible = false;

            dtgvCategory.DataSource = lm.LoaiMon_Select();
            dtgvTable.DataSource = ban.Ban_Select();
            dtgvFD.DataSource = mon.Mon_ChonAll();
            dtgv_listhoadon.DataSource = hd.HoaDon_ChonAll();
            this.dtgv_listhoadon.Columns["MaPDM"].Visible = false;

            //Mon
            ////Gán dữ liệu nguồn
            comboBox1.DataSource = lm.LoaiMon_Select();
            ////Gán trường sẽ hiển thị trên comboBox
            comboBox1.DisplayMember = "TenLoaiMon";
            ////Gã trường mã ẩn sau mỗi trường trên comboBox
            ////Nhằm mục đích khi chọn 1 item sẽ sử dụng mã ẩn để lọc dữ liệu 
            comboBox1.ValueMember = "MaLoaiMon";

            txbSeachMon.Text = "Tìm kiếm tên món";
            txbSeachMon.ForeColor = Color.Gray;
        }

        public void Loadcb()
        {
            //cbAccountType.SelectedIndex = -1;
            cbAccountType.SelectedText = "--Select--";
            cbAccountType.Items.Insert(0, "Admin");
            cbAccountType.Items.Insert(1, "Quản lý");
            cbAccountType.Items.Insert(2, "Nhân viên");
            //cbAccountType.SelectedText = cbAccountType.Items[2].ToString();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            dtgvFD.DataSource = mon.Mon_ChonAll_where_LoaiMon_ADMIN(int.Parse(comboBox1.SelectedValue.ToString()));

        }

        //Hiện thị
        private void BtnShowDrink_Click(object sender, EventArgs e)
        {
            dtgvFD.DataSource = mon.Mon_ChonAll();
        }

        private void BtnShowCategory_Click(object sender, EventArgs e)
        {
            dtgvCategory.DataSource = lm.LoaiMon_Select();
        }

        private void BtnShowTsble_Click(object sender, EventArgs e)
        {
            dtgvTable.DataSource = ban.Ban_Select();
        }

        private void BtnShowAccount_Click(object sender, EventArgs e)
        {
            
            Loadcb();
            dtgvAccount.DataSource = nv.NhanVien_ChonAll();
        }


        //Thêm
        private void BtnAddDrink_Click(object sender, EventArgs e)
        {
            if (txtTenMon.Text != "")
            {
                mon.Mon_Them(int.Parse(cbMaLoaiMon.SelectedValue.ToString()), txtTenMon.Text, float.Parse(nucGiaMon.Value.ToString()), txtMota.Text);
                MessageBox.Show("Thêm thành công!!");
            }
            else
            {
                MessageBox.Show("Mời nhập thông tin món");
            }
            
        }

        private void BtnAddCategory_Click(object sender, EventArgs e)
        {
            if (txtTenLoaiMon.Text != "")
            {
                lm.LoaiMon_Them(txtTenLoaiMon.Text, txtMotaLoaiMon.Text);
                MessageBox.Show("Thêm thành công!!");
            }
            else
            {
                MessageBox.Show("Mời nhập thông tin loại món");
            }
        }

        private void BtnAddTable_Click(object sender, EventArgs e)
        {
            if (txtIdTable.Text != "")
            {
                ban.Ban_Them(0,0);
                MessageBox.Show("Thêm thành công!!");
            }
            else
            {
                MessageBox.Show("Mời nhập thông tin bàn");
            }
        }

        private void BtnAddAcount_Click(object sender, EventArgs e)
        {
            if (txtNameEmp.Text != "" && txtNamSinh.Text !="" && txtPhoneEmp.Text !="")
            {
                //MessageBox.Show(cbAccountType.SelectedIndex.ToString());

                nv.NhanVien_Them_TaiKhoan(txtNameEmp.Text, Convert.ToDateTime(txtYBDay.Text), rdEmp1.Checked,
                                    txtPhoneEmp.Text, txtUName.Text, txtPassEmp.Text, int.Parse(cbAccountType.SelectedIndex.ToString()));
                ClearNhanVien();
                MessageBox.Show("Thêm thành công!!");
            }
            else
            {
                MessageBox.Show("Mời nhập thông tin Nhân viên");
            }
        }
        //Sửa
        private void BtnEditDrink_Click(object sender, EventArgs e)
        {
            if (txtMaMon.Text != "" && txtTenMon.Text != "")
            {
                mon.Mon_CapNhap(int.Parse(cbMaLoaiMon.SelectedValue.ToString()), int.Parse(txtMaMon.Text.ToString()), txtTenMon.Text.ToString(), float.Parse(nucGiaMon.Value.ToString()), txtMota.Text, rdMon1.Checked);
                MessageBox.Show("Cập nhập thành công!!");
            }
            else
            {
                MessageBox.Show("Mời nhập thông tin món muốn chỉnh sửa");
            }
        }
        private void BtnEditCategory_Click(object sender, EventArgs e)
        {
            if (txtMaLoaiMon.Text != "" && txtTenLoaiMon.Text != "")
            {
                lm.LoaiMon_CapNhap(int.Parse(txtMaLoaiMon.Text.ToString()), txtTenLoaiMon.Text, txtMotaLoaiMon.Text, rdLoaiMon1.Checked);
                MessageBox.Show("Cập nhập thành công!!");
            }
            else
            {
                MessageBox.Show("Mời nhập thông tin món muốn chỉnh sửa");
            }
        }


        private void BtnEditTable_Click(object sender, EventArgs e)
        {
            if (txtIdTable.Text != "")
            {
                ban.Ban_Sua(int.Parse(txtIdTable.Text), rdBan1.Checked?0:3, 0);
                MessageBox.Show("Sửa thành công!!");
            }
            else
            {
                MessageBox.Show("Mời nhập thông tin bàn");
            }
           

        }


        private void BtnEditAcount_Click(object sender, EventArgs e)
        {
            if(txtIdEmp.Text!="")
            {
                nv.NhanVien_Sua_TaiKhoan(txtIdEmp.Text, txtNameEmp.Text, Convert.ToDateTime(txtYBDay.Text), rdEmp1.Checked,
                                    txtPhoneEmp.Text, txtUName.Text, int.Parse(cbAccountType.SelectedIndex.ToString()));
                MessageBox.Show("Sửa thành công");
                ClearNhanVien();
            }
           
            else
                MessageBox.Show("Mời nhập thông tin");
        }
        //Xóa
        private void BtnDeleteDrink_Click(object sender, EventArgs e)
        {
            if (txtMaMon.Text!="")
            {
                
                if (ctpdm.ChiTietPDM_ChonTai_Mon(int.Parse(txtMaMon.Text.ToString())).Rows.Count>0)
                {
                    MessageBox.Show("Không thể xóa món này");
                }
                else
                {
                    mon.Mon_Xoa(int.Parse(txtMaMon.Text.ToString()));
                    MessageBox.Show("Xóa thành công!!");
                }
                
            }
            else
            {
                MessageBox.Show("Chọn món cần xóa");
            }
        }
        private void BtnDeleteCategory_Click(object sender, EventArgs e)
        {
            if (txtMaLoaiMon.Text != "")
            {
                if (mon.Mon_ChonAll_where_LoaiMon(int.Parse(txtMaLoaiMon.Text)).Rows.Count > 0)
                {
                   MessageBox.Show("Không thể xóa loại món này");
                }
                else
                {
                    lm.LoaiMon_Xoa(int.Parse(txtMaLoaiMon.Text.ToString()));
                    MessageBox.Show("Xóa thành công!!");
                }
               
            }
            else
            {
                MessageBox.Show("Chọn loai món cần xóa");
            }
        }


        private void BtnDeleteAccount_Click(object sender, EventArgs e)
        {
            if (txtIdEmp.Text != "")
            {
               if( nv.NhanVien_DemPDM(txtIdEmp.Text).Rows.Count >0)
                {
                    if (int.Parse(nv.NhanVien_DemPDM(txtIdEmp.Text).Rows[0]["SoNhanVien"].ToString()) > 0)
                    MessageBox.Show("Không thể xóa loại nhân viên này");
                }
                else
                {
                    nv.NhanVien_Xoa(txtIdEmp.Text);
                    MessageBox.Show("Xóa thành công!!");
                }

            }
            else
            {
                MessageBox.Show("Chọn nhân viên cần xóa");
            }
        }


        //Thao tác trên DTGRV
        private void DtgvFD_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            SetMonTextBox();
          
        }

        private void DtgvFD_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            SetMonTextBox();
        }

        private void DtgvCategory_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            SetLoaiMonTextBox();
        }
        private void DtgvCategory_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            SetLoaiMonTextBox();
        }


        private void DtgvTable_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            SetBanTextBox();
        }

        private void DtgvTable_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            SetBanTextBox();
        }

        private void DtgvAccount_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {
            SetNhanVienTextBox();
        }

        private void DtgvAccount_RowHeaderMouseClick_1(object sender, DataGridViewCellMouseEventArgs e)
        {
            SetNhanVienTextBox();
        }


        void SetMonTextBox()
        {
            ////
            //Món
            ////
            cbMaLoaiMon.DataSource = null;
            int i = dtgvFD.CurrentRow.Index;
            txtMaMon.Text = dtgvFD.Rows[i].Cells[0].Value.ToString();
            DataTable dt = lm.LoaiMon_Select_Where(int.Parse(dtgvFD.Rows[i].Cells[1].Value.ToString()));
            //cbMaLoaiMon.Text = dt.Rows[0]["TenLoaiMon"].ToString();
            txtTenMon.Text = dtgvFD.Rows[i].Cells[2].Value.ToString();
            //MessageBox.Show(dtgvFD.Rows[i].Cells[3].Value.ToString());
            nucGiaMon.Value = int.Parse(dtgvFD.Rows[i].Cells[3].Value.ToString());
            txtMota.Text = dtgvFD.Rows[i].Cells[4].Value.ToString();

            cbMaLoaiMon.DataSource = lm.LoaiMon_Select();
            ////Gán trường sẽ hiển thị trên comboBox
            cbMaLoaiMon.DisplayMember = "TenLoaiMon";
            ////Gã trường mã ẩn sau mỗi trường trên comboBox
            ////Nhằm mục đích khi chọn 1 item sẽ sử dụng mã ẩn để lọc dữ liệu 
            cbMaLoaiMon.ValueMember = "MaLoaiMon";
            cbMaLoaiMon.SelectedValue = dt.Rows[0]["MaLoaiMon"].ToString();

            //MessageBox.Show(dataGridView1.Rows[i].Cells[3].Value.ToString());
            if (dtgvFD.Rows[i].Cells[5].Value.ToString() == "True")
            {
                rdMon1.Checked = true;
            }
            else
            {
                rdMon0.Checked = true;
            }
        }

        void SetLoaiMonTextBox()
        {
            ////
            //Loại Món
            ////
            int i = dtgvCategory.CurrentRow.Index;
            txtMaLoaiMon.Text = dtgvCategory.Rows[i].Cells[0].Value.ToString();
            txtTenLoaiMon.Text = dtgvCategory.Rows[i].Cells[1].Value.ToString();
            txtMotaLoaiMon.Text = dtgvCategory.Rows[i].Cells[2].Value.ToString();

            if (dtgvCategory.Rows[i].Cells[3].Value.ToString() == "True")
            {
                rdLoaiMon1.Checked = true;
            }
            else
            {
                rdLoaiMon2.Checked = true;
            }
           
        }

        void SetBanTextBox()
        {

            ////
            //Bàn
            ////
            txtIdTable.Text = dtgvTable.Rows[dtgvTable.CurrentRow.Index].Cells[0].Value.ToString();

            if (dtgvTable.Rows[dtgvTable.CurrentRow.Index].Cells[1].Value.ToString() != "3")
            {
                rdBan1.Checked = true;
            }
            else
            {
                rdBan2.Checked = true;
            }


        }

        void SetNhanVienTextBox()
        {
            
            ////
            //NhanVien
            ////
            int i = dtgvAccount.CurrentRow.Index;
            txtIdEmp.Text = dtgvAccount.Rows[i].Cells[0].Value.ToString();
            txtNameEmp.Text = dtgvAccount.Rows[i].Cells[1].Value.ToString();
            txtYBDay.Text = dtgvAccount.Rows[i].Cells[2].Value.ToString();

            if (dtgvAccount.Rows[i].Cells[3].Value.ToString() == "True")
            {
                rdEmp1.Checked = true;
            }
            else
            {
                rdEmp2.Checked = true;
            }

            txtPhoneEmp.Text = dtgvAccount.Rows[i].Cells[4].Value.ToString();
            txtStartWork.Text = dtgvAccount.Rows[i].Cells[5].Value.ToString();
            txtUName.Text = dtgvAccount.Rows[i].Cells[6].Value.ToString();
            txtPassEmp.Text = dtgvAccount.Rows[i].Cells[7].Value.ToString();

            if(dtgvAccount.Rows[i].Cells[8].Value.ToString()=="0")
            {
                cbAccountType.SelectedText = cbAccountType.Items[0].ToString();
                cbAccountType.SelectedIndex = 0;
            }
               
            if (dtgvAccount.Rows[i].Cells[8].Value.ToString() == "1")
            {
                cbAccountType.SelectedText = cbAccountType.Items[1].ToString();
                cbAccountType.SelectedIndex = 1;
            }
               
            if (dtgvAccount.Rows[i].Cells[8].Value.ToString() == "2")
            {
                cbAccountType.SelectedText = cbAccountType.Items[2].ToString();
                cbAccountType.SelectedIndex = 2;
            }
                

        }
        void ClearNhanVien()
        {
            txtIdEmp.Text = "";
            txtNameEmp.Text = "";
            txtYBDay.Text = "";
            rdEmp1.Checked = false;
            rdEmp2.Checked = false;
            txtPhoneEmp.Text = "";
            txtStartWork.Text = "";
            txtUName.Text = "";
            txtPassEmp.Text = "";
            cbAccountType.Text="";
       
            //cbAccountType.Items.Clear();

        }
        //SEARCH
        private void BtnSeachDrink_Click(object sender, EventArgs e)
        {
            if(txbSeachMon.Text !="")
            {
                dtgvFD.DataSource = mon.Mon_Search(txbSeachMon.Text);
            }
            else
            {
                MessageBox.Show("Nhập thông tin cần tìm kiếm");
            }
        }

        private void TxbSeachMon_Enter(object sender, EventArgs e)
        {
            if (txbSeachMon.Text == "Tìm kiếm tên món")
            {
                txbSeachMon.Text = "";
                txbSeachMon.ForeColor = Color.Black;
            }
        }

        private void TxbSeachMon_Leave(object sender, EventArgs e)
        {
            if (txbSeachMon.Text == "")
            {
                txbSeachMon.Text = "Tìm kiếm tên món";
                txbSeachMon.ForeColor = Color.Gray;
            }
        }

        private void BtnResetPassword_Click_1(object sender, EventArgs e)
        {
            CheckQT = false;
            TaiKhoan formtk = new TaiKhoan();
            //formtk.Show();
            formtk.ShowDialog();
        }

        private void CrystalReportViewer1_Load_1(object sender, EventArgs e)
        {

        }

        private void DataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            SetHoaDon();
        }

        private void DataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            SetHoaDon();
        }

        private void SetHoaDon()
        {
            int i = dtgv_listhoadon.CurrentRow.Index;
            //MaHD 
            //dtgv_listhoadon.Rows[i].Cells[0].Value.ToString();
            BaoCaoHoaDon b = new BaoCaoHoaDon();
            b.SetDataSource(hd.InHoaDonTai(dtgv_listhoadon.Rows[i].Cells[0].Value.ToString()));
            crystalReportViewer1.ReportSource = b;
            crystalReportViewer1.Zoom(75);





        }
    }
}
