using GUI;
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
    
    public partial class TrangChu : Form
    {
        public static string SetMaBan = "";
        DataTable dt;
        Ban_BLL ban = new Ban_BLL();
        public TrangChu()
        {

            InitializeComponent();
            //SplitterPanel leftPanel = splitContainer1.Panel1;
            //leftPanel.BackColor = Color.Green;
            //leftPanel.ForeColor = Color.Yellow;

            //SplitterPanel rightPanel = splitContainer1.Panel2;
            //rightPanel.BackColor = Color.OrangeRed;
            //rightPanel.ForeColor = Color.White;

            this.tableLayoutPanel1.ColumnStyles.Clear();
            this.tableLayoutPanel1.RowStyles.Clear();

            var rowCount = 5;
            var columnCount = 5;

            this.tableLayoutPanel1.ColumnCount = columnCount;
            this.tableLayoutPanel1.RowCount = rowCount;

            this.tableLayoutPanel1.ColumnStyles.Clear();
            this.tableLayoutPanel1.RowStyles.Clear();

            this.tableLayoutPanel1.Dock = DockStyle.Fill;

            for (int i = 0; i < columnCount; i++)
            {
                this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100 / columnCount));
            }
            for (int i = 0; i < rowCount; i++)
            {
                this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100 / rowCount));
            }

            for (int i = 0; i < rowCount * columnCount; i++)
            {
                var b = new Button();
                dt = ban.Ban_ChonTai(i + 1);
                //Create button in tableLayoutPanel1
                if (dt.Rows.Count > 0)
                { 
                    b.Text = (i + 1).ToString();
                    b.Name = string.Format("b_{0}", i + 1);
                    //MessageBox.Show(dt.Rows[0]["TinhTrang"].ToString());
                    //Check table exist or not PDM-> change color-- Not finally
                    if(dt.Rows[0]["TinhTrang"].ToString()=="False")
                        b.BackColor = Color.Blue;
                    b.Click += b_Click;
                    b.Dock = DockStyle.Fill;
                    this.tableLayoutPanel1.Controls.Add(b);
                }
                else return;

                    
            }

            void b_Click(object sender, EventArgs e)
            {
                var b = sender as Button;
                if (b != null)
                {
                    //MessageBox.Show(string.Format("{0} Clicked", b.Text));
                    SetMaBan = b.Text;
                    //Form1 f2 = new Form1();
                    QuanLyNghiepVuBan f2 = new QuanLyNghiepVuBan();
                    f2.ShowDialog(); // Shows Form2

                }
                    
            }          


    }

        private void splitContainer1_Panel2_Paint(object sender, PaintEventArgs e)
        {
           
        }

        private void splitContainer1_Panel1_Paint(object sender, PaintEventArgs e)
        {

        }
       

    }
}
