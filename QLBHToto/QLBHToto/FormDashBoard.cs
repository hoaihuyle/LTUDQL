using QLBHToto.UserControls;
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
    public partial class FormDashBoard : Form
    {
        int pnWidth;
        bool isColappsed;

        public static bool CheckHome = true;

        public FormDashBoard()
        {
            InitializeComponent();
            pnWidth = pnLeft.Width;
            isColappsed = false;
            timerTime.Start();
            //-----------------
            UC_Table utable = new UC_Table();
            AddControlsToPanel(utable);
           //if(UC_Table.ktmoveSucess==false) {this.Dispose();}
        }

private void Button2_Click(object sender, EventArgs e)
        {
           
        }

        private void Timer1_Tick(object sender, EventArgs e)
        {
            if(isColappsed)
            {
                pnLeft.Width = pnLeft.Width + 19;
                if(pnLeft.Width >= pnWidth)
                {
                    timer1.Stop();
                    isColappsed = false;
                    this.Refresh();
                }
            }
            else
            {
                pnLeft.Width = pnLeft.Width - 19;
                if (pnLeft.Width <= 59)
                {
                    timer1.Stop();
                    isColappsed = true;
                    this.Refresh();
                }
            }
        }

        private void BtnHideShowBar_Click(object sender, EventArgs e)
        {
            timer1.Start();
        }

        private void MoveSidePanel(Control btn)
        {
            pnSide.Top = btn.Top;
            pnSide.Height = btn.Height;
        }

        public void AddControlsToPanel (Control c)
        {
            c.Dock = DockStyle.Fill;
            pnControls.Controls.Clear();
            pnControls.Controls.Add(c);

        }

        private void BtnHome_Click(object sender, EventArgs e)
        {
            MoveSidePanel(btnHome);

            CheckHome = true;
            UC_Table utable = new UC_Table();
            AddControlsToPanel(utable);
        }

        private void BtnTakeAway_Click(object sender, EventArgs e)
        {
            MoveSidePanel(btnTakeAway);

            CheckHome = false;
            UC_Table utable = new UC_Table();
            AddControlsToPanel(utable);
        }

        private void BtnAccount_Click(object sender, EventArgs e)
        {
            MoveSidePanel(btnAccount);

            UC_Account uaccount = new UC_Account();
            AddControlsToPanel(uaccount);
        }

        private void BtnAdmin_Click(object sender, EventArgs e)
        {
            MoveSidePanel(btnAdmin);

            using (FormAdmin f = new FormAdmin())
            {
                f.ShowDialog();
            }
        }


        private void BtnLogOut_Click(object sender, EventArgs e)
        {
            MoveSidePanel(btnLogOut);
            this.Close();

        }

        private void TimerTime_Tick(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;
            lbDate.Text = dt.ToString("dd/MM/yyyy");
            lbTime.Text = dt.ToString("HH:mm:ss");
        }

        private void PnControls_Paint(object sender, PaintEventArgs e)
        {

        }

        private void FormDashBoard_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Dispose();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Thoát chương trình, đồng nghĩa với việc đăng xuất ?", "Thông báo", MessageBoxButtons.YesNo);
            if (dialogResult == DialogResult.Yes)
            {
                this.Dispose();
            }
            else if (dialogResult == DialogResult.No)
            {
                //do something else
            }
        }
    }
}
