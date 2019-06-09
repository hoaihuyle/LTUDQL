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
    public partial class FormPass : Form
    {
        public static string setpass = "";
        public static bool CheckPass =false;

        TaiKhoan_BLL tk = new TaiKhoan_BLL();
        public FormPass()
        {
            InitializeComponent();


        }

        private void Button2_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void Button_WOC1_Click(object sender, EventArgs e)
        {
            setpass = setpass + "1";
            Loadtxt();
        }

        private void Button_WOC2_Click(object sender, EventArgs e)
        {
            setpass = setpass + "2";
            Loadtxt();
        }

        private void Button_WOC3_Click(object sender, EventArgs e)
        {
            setpass = setpass + "3";
            Loadtxt();
        }

        private void Button_WOC6_Click(object sender, EventArgs e)
        {
            setpass = setpass + "4";
            Loadtxt();
        }

        private void Button_WOC5_Click(object sender, EventArgs e)
        {
            setpass = setpass + "5";
            Loadtxt();
        }

        private void Button_WOC4_Click(object sender, EventArgs e)
        {
            setpass = setpass + "6";
            Loadtxt();
        }

        private void Button_WOC9_Click(object sender, EventArgs e)
        {
            setpass = setpass + "7";
            Loadtxt();
        }

        private void Button_WOC8_Click(object sender, EventArgs e)
        {
            setpass = setpass + "8";
            Loadtxt();
        }

        private void Button_WOC7_Click(object sender, EventArgs e)
        {
            setpass = setpass + "9";
            Loadtxt();
        }

        private void Button_WOC12_Click(object sender, EventArgs e)
        {
            setpass = setpass + "0";
            Loadtxt();
        }

        private void Button_WOC11_Click(object sender, EventArgs e)
        {
            setpass = "";
            Loadtxt();
        }

        void Loadtxt()
        {
            txtPass.Text = setpass;
        }

        private void Button_WOC10_Click(object sender, EventArgs e)
        {
            setpass = txtPass.Text;
            foreach (DataRow row in tk.TaiKhoan_ChonTai_CapDo(0).Rows)
            {
                if (setpass == row["MatKhau"].ToString()) CheckPass = true;
            }

            if (CheckPass) { this.Dispose(); }
            else
            {
                DialogResult dialogResult = MessageBox.Show("Bạn nhập sai, bạn có muốn tiếp tục?", "Thông báo", MessageBoxButtons.YesNo);
                if (dialogResult == DialogResult.Yes)
                {
                    txtPass.Text="";
                    setpass="";
                }
                else if (dialogResult == DialogResult.No)
                {
                    this.Dispose();
                }
            }

        }
    }
}
