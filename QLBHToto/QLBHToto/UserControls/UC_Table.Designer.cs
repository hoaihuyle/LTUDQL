namespace QLBHToto.UserControls
{
    partial class UC_Table
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.panel1 = new System.Windows.Forms.Panel();
            this.txt_PageNum = new System.Windows.Forms.TextBox();
            this.btn_Right = new System.Windows.Forms.Button();
            this.btn_Left = new System.Windows.Forms.Button();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.txt_PageNum);
            this.panel1.Controls.Add(this.btn_Right);
            this.panel1.Controls.Add(this.btn_Left);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 662);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1358, 53);
            this.panel1.TabIndex = 1;
            // 
            // txt_PageNum
            // 
            this.txt_PageNum.Dock = System.Windows.Forms.DockStyle.Left;
            this.txt_PageNum.Location = new System.Drawing.Point(212, 0);
            this.txt_PageNum.Margin = new System.Windows.Forms.Padding(4, 2, 4, 2);
            this.txt_PageNum.Name = "txt_PageNum";
            this.txt_PageNum.Size = new System.Drawing.Size(208, 22);
            this.txt_PageNum.TabIndex = 5;
            this.txt_PageNum.Text = "Trang 1";
            // 
            // btn_Right
            // 
            this.btn_Right.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.btn_Right.Dock = System.Windows.Forms.DockStyle.Left;
            this.btn_Right.Location = new System.Drawing.Point(108, 0);
            this.btn_Right.Margin = new System.Windows.Forms.Padding(0);
            this.btn_Right.Name = "btn_Right";
            this.btn_Right.Size = new System.Drawing.Size(104, 53);
            this.btn_Right.TabIndex = 4;
            this.btn_Right.Text = ">>>";
            this.btn_Right.UseVisualStyleBackColor = false;
            this.btn_Right.Click += new System.EventHandler(this.Btn_Right_Click);
            // 
            // btn_Left
            // 
            this.btn_Left.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(192)))));
            this.btn_Left.Dock = System.Windows.Forms.DockStyle.Left;
            this.btn_Left.Location = new System.Drawing.Point(0, 0);
            this.btn_Left.Margin = new System.Windows.Forms.Padding(0);
            this.btn_Left.Name = "btn_Left";
            this.btn_Left.Size = new System.Drawing.Size(108, 53);
            this.btn_Left.TabIndex = 3;
            this.btn_Left.Text = "<<<";
            this.btn_Left.UseVisualStyleBackColor = false;
            this.btn_Left.Click += new System.EventHandler(this.Btn_Left_Click);
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.AutoScroll = true;
            this.tableLayoutPanel1.AutoSize = true;
            this.tableLayoutPanel1.ColumnCount = 5;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Margin = new System.Windows.Forms.Padding(0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 5;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(1358, 662);
            this.tableLayoutPanel1.TabIndex = 2;
            // 
            // UC_Table
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.AutoSize = true;
            this.Controls.Add(this.tableLayoutPanel1);
            this.Controls.Add(this.panel1);
            this.Name = "UC_Table";
            this.Size = new System.Drawing.Size(1358, 715);
            this.Load += new System.EventHandler(this.UC_Table_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.TextBox txt_PageNum;
        private System.Windows.Forms.Button btn_Right;
        private System.Windows.Forms.Button btn_Left;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
    }
}
