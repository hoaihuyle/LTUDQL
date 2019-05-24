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
    public partial class DangNhap : Form
    {
        DataTable dt;
        TaiKhoan_BLL tk = new TaiKhoan_BLL();
        public DangNhap()
        {
            InitializeComponent();
        }
        private void lblPassword_Click(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string matk = txbUserName.Text;
            string mk = txbPassWord.Text;
            if (Login(matk,mk))
            {
                TrangChu home = new TrangChu();
                this.Hide();
                home.ShowDialog();
                this.Show();
            }
            else
            {
                MessageBox.Show("Sai tên đăng nhập hoặc mật khẩu !");
            }
        }

        bool Login(string matk, string mk)
        {
            dt = tk.TaiKhoan_ChonTai(matk);
            if (dt.Rows.Count >0)
            {
                if (dt.Rows[0]["MaTaiKhoan"].ToString() == matk.ToString())
                    if (dt.Rows[0]["MatKhau"].ToString() == mk)
                        return true;
            }
            
            return false;
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void fLogin_FormClosing(object sender, FormClosingEventArgs e)
        {
            //if (MessageBox.Show("Bạn có chắc chắn muốn thoát chương trình ?", "Thông báo", MessageBoxButtons.OKCancel) != System.Windows.Forms.DialogResult.OK)
            //{
            //    e.Cancel = true;
            //}
            Environment.Exit(0);
        }

        private void DangNhap_Load(object sender, EventArgs e)
        {

        }
    }
}
