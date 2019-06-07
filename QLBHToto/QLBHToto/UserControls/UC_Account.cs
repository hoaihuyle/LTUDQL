using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;

namespace QLBHToto.UserControls
{
    public partial class UC_Account : UserControl
    {
        TaiKhoan_BLL tk = new TaiKhoan_BLL();
        public UC_Account()
        {
            InitializeComponent();
            txtID.Text = "";
            txtUserName.Text = "";
            txtPassWord.Text = "";

        }

        private void UC_Account_Load(object sender, EventArgs e)
        {
            txtUserName.Text = FormLogin.SetUsername;
            txtPassWord.Text = FormLogin.SetPassword;
            txtID.Text = tk.TaiKhoan_ChonTai(txtUserName.Text).Rows[0]["MaNV"].ToString();
        }

        private void BtnUpAcount_Click(object sender, EventArgs e)
        {
            if (txtNewPass.Text != "")
            {
                if (txtRePass.Text == txtNewPass.Text)
                {
                    tk.TaiKhoan_Sua(txtUserName.Text, txtNewPass.Text, txtID.Text);
                    MessageBox.Show("Đổi mật khẩu thành công", "Thông báo");
                }
                else MessageBox.Show("Mật khẩu không trùng khớp", "Thông báo");
            }
            else MessageBox.Show("Nhập mật khẩu mới !", "Thông báo");
        }
    }
}
