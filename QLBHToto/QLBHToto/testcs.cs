﻿using System;
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
    public partial class testcs : Form
    {
        public testcs()
        {
            InitializeComponent();
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
                b.Text = (i + 1).ToString();
                b.Name = string.Format("b_{0}", i + 1);
                b.Click += b_Click;
                b.Dock = DockStyle.Fill;
                this.tableLayoutPanel1.Controls.Add(b);
            }

            void b_Click(object sender, EventArgs e)
            {
                var b = sender as Button;
                if (b != null)
                    MessageBox.Show(string.Format("{0} Clicked", b.Text));
            }
        }


    }
}
