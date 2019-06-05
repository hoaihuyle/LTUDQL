using BLL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLBHToto
{
    public partial class FormLogin : Form
    {
        public static string SetUsername = "";
        public static string SetPassword = "";

        DataTable dt;
        TaiKhoan_BLL tk = new TaiKhoan_BLL();
        public FormLogin()
        {
            InitializeComponent();
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void Button1_Click_1(object sender, EventArgs e)
        {
            string matk = txtUName.Text;
            string mk = txtPWord.Text;

            if (Login(matk, mk))
            {
                //this.Hide();
                //TrangChu home = new TrangChu();
                //home.ShowDialog();
                //this.Show();

                using (FormDashBoard f = new FormDashBoard())
                {
                    f.ShowDialog();
                }
            }
            else
            {
                MessageBox.Show("Sai tên đăng nhập hoặc mật khẩu !","Thông báo");
            }
           
        }

        bool Login(string matk, string mk)
        {
            dt = tk.TaiKhoan_ChonTai(matk);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["MaTaiKhoan"].ToString() == matk)
                    if (dt.Rows[0]["MatKhau"].ToString() == mk)
                    {
                        SetUsername = matk;
                        SetPassword = mk;
                        return true;
                    }

            }

            return false;
        }

        private void Button3_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
