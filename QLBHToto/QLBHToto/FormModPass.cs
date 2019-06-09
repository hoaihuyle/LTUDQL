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
    public partial class FormModPass : Form
    {
        TaiKhoan_BLL tk = new TaiKhoan_BLL();
        public FormModPass()
        {
            //Temp form 1
            InitializeComponent();
          
        }


        private void TaiKhoan_Load(object sender, EventArgs e)
        {
           
            txtUserName.Text = FormAdmin.UName;
        }



        private void TaiKhoan_FormClosing(object sender, FormClosingEventArgs e)
        {
            //MovetoHome();

            this.Dispose();

        }

        private void BtnUpdate_Click_1(object sender, EventArgs e)
        {
            if (txtNewPassWord.Text != "")
            {
                if (txtRePassWord.Text == txtNewPassWord.Text)
                {
                    tk.TaiKhoan_Sua(txtUserName.Text, txtNewPassWord.Text, FormAdmin.IdEmp.ToString());
                    MessageBox.Show("Đổi mật khẩu thành công", "Thông báo");
                }
                else MessageBox.Show("Mật khẩu không trùng khớp", "Thông báo");
            }
            else MessageBox.Show("Nhập mật khẩu mới !", "Thông báo");
        }

        private void BtnExit_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }
    }
}
