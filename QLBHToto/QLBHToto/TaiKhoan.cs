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
    public partial class TaiKhoan : Form
    {
        TaiKhoan_BLL tk = new TaiKhoan_BLL();
        public TaiKhoan()
        {
            //Temp form 1
            InitializeComponent();
            this.FormBorderStyle = FormBorderStyle.FixedDialog;

            // Set the MaximizeBox to false to remove the maximize box.
            this.MaximizeBox = false;

            // Set the MinimizeBox to false to remove the minimize box.
            this.MinimizeBox = false;

            // Set the start position of the form to the center of the screen.
            this.StartPosition = FormStartPosition.CenterScreen;
        }


        private void TaiKhoan_Load(object sender, EventArgs e)
        {
           
            txtUserName.Text = DangNhap.SetUsername;
            txtPassWord.Text = DangNhap.SetPassword;
            txtMaNV.Text = tk.TaiKhoan_ChonTai(txtUserName.Text).Rows[0]["MaNV"].ToString();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
           
        }

        void MovetoHome()
        {
            this.Hide();
            TrangChu home = new TrangChu();
            home.ShowDialog();

        }


        private void BtnUpdate_Click(object sender, EventArgs e)
        {
            if (txtNewPassWord.Text != "")
            {
                if (txtRePassWord.Text == txtNewPassWord.Text)
                {
                    tk.TaiKhoan_Sua(txtUserName.Text, txtNewPassWord.Text, txtMaNV.Text);
                    MessageBox.Show("Đổi mật khẩu thành công","Thông báo");
                }
                else MessageBox.Show("Mật khẩu không trùng khớp","Thông báo");
            }
            else MessageBox.Show("Nhập mật khẩu mới !", "Thông báo");
        }

        private void TaiKhoan_FormClosing(object sender, FormClosingEventArgs e)
        {
            //MovetoHome();
 
            if (QuanLy.CheckQT == true)
            {
                MovetoHome();
            }
            if (QuanLy.CheckQT == false)
            {
                QuanLy.CheckQT = true;
                this.Hide();
            }

        }

    }
}
