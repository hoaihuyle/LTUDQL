namespace QLBHToto
{
    partial class Form1
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.txtTenMon = new System.Windows.Forms.TextBox();
            this.txtGiaMon = new System.Windows.Forms.TextBox();
            this.txtMoTa = new System.Windows.Forms.TextBox();
            this.rdMon1 = new System.Windows.Forms.RadioButton();
            this.rdMon0 = new System.Windows.Forms.RadioButton();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.MonThem = new System.Windows.Forms.Button();
            this.MonSua = new System.Windows.Forms.Button();
            this.Mon_Xoa = new System.Windows.Forms.Button();
            this.Exit = new System.Windows.Forms.Button();
            this.PDMThem = new System.Windows.Forms.Button();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.PĐM = new System.Windows.Forms.Label();
            this.PDMMonXoa = new System.Windows.Forms.Button();
            this.PDMXoa = new System.Windows.Forms.Button();
            this.PDMIn = new System.Windows.Forms.Button();
            this.HoaDon = new System.Windows.Forms.Button();
            this.labelmamon = new System.Windows.Forms.Label();
            this.txtMaMon = new System.Windows.Forms.TextBox();
            this.txtMaLoaiMon = new System.Windows.Forms.Label();
            this.cbMaLoaiMon = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(13, 53);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(407, 260);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            this.dataGridView1.RowHeaderMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dataGridView1_RowHeaderMouseClick);
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(75, 12);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(121, 22);
            this.comboBox1.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(24, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(47, 14);
            this.label1.TabIndex = 2;
            this.label1.Text = "LoaiMon";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(218, 10);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 3;
            this.button1.Text = "Hiển thị";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // txtTenMon
            // 
            this.txtTenMon.Location = new System.Drawing.Point(53, 338);
            this.txtTenMon.Name = "txtTenMon";
            this.txtTenMon.Size = new System.Drawing.Size(100, 20);
            this.txtTenMon.TabIndex = 4;
            this.txtTenMon.TextChanged += new System.EventHandler(this.txtTenMon_TextChanged);
            // 
            // txtGiaMon
            // 
            this.txtGiaMon.Location = new System.Drawing.Point(53, 363);
            this.txtGiaMon.Name = "txtGiaMon";
            this.txtGiaMon.Size = new System.Drawing.Size(100, 20);
            this.txtGiaMon.TabIndex = 5;
            // 
            // txtMoTa
            // 
            this.txtMoTa.Location = new System.Drawing.Point(159, 338);
            this.txtMoTa.Name = "txtMoTa";
            this.txtMoTa.Size = new System.Drawing.Size(156, 20);
            this.txtMoTa.TabIndex = 6;
            // 
            // rdMon1
            // 
            this.rdMon1.AutoEllipsis = true;
            this.rdMon1.AutoSize = true;
            this.rdMon1.Location = new System.Drawing.Point(159, 364);
            this.rdMon1.Name = "rdMon1";
            this.rdMon1.Size = new System.Drawing.Size(60, 18);
            this.rdMon1.TabIndex = 8;
            this.rdMon1.Text = "Hiển thị";
            this.rdMon1.UseVisualStyleBackColor = true;
            // 
            // rdMon0
            // 
            this.rdMon0.AutoSize = true;
            this.rdMon0.Location = new System.Drawing.Point(225, 364);
            this.rdMon0.Name = "rdMon0";
            this.rdMon0.Size = new System.Drawing.Size(93, 18);
            this.rdMon0.TabIndex = 9;
            this.rdMon0.TabStop = true;
            this.rdMon0.Text = "Không hiển thị";
            this.rdMon0.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(-1, 341);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(48, 14);
            this.label2.TabIndex = 10;
            this.label2.Text = "Tên món";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(10, 366);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(23, 14);
            this.label3.TabIndex = 11;
            this.label3.Text = "Gia";
            // 
            // MonThem
            // 
            this.MonThem.Location = new System.Drawing.Point(321, 333);
            this.MonThem.Name = "MonThem";
            this.MonThem.Size = new System.Drawing.Size(46, 25);
            this.MonThem.TabIndex = 12;
            this.MonThem.Text = "Thêm";
            this.MonThem.UseVisualStyleBackColor = true;
            this.MonThem.Click += new System.EventHandler(this.MonThem_Click);
            // 
            // MonSua
            // 
            this.MonSua.Location = new System.Drawing.Point(373, 333);
            this.MonSua.Name = "MonSua";
            this.MonSua.Size = new System.Drawing.Size(49, 25);
            this.MonSua.TabIndex = 13;
            this.MonSua.Text = "Sửa";
            this.MonSua.UseVisualStyleBackColor = true;
            this.MonSua.Click += new System.EventHandler(this.MonSua_Click);
            // 
            // Mon_Xoa
            // 
            this.Mon_Xoa.Location = new System.Drawing.Point(321, 364);
            this.Mon_Xoa.Name = "Mon_Xoa";
            this.Mon_Xoa.Size = new System.Drawing.Size(46, 21);
            this.Mon_Xoa.TabIndex = 14;
            this.Mon_Xoa.Text = "Xóa";
            this.Mon_Xoa.UseVisualStyleBackColor = true;
            this.Mon_Xoa.Click += new System.EventHandler(this.button4_Click);
            // 
            // Exit
            // 
            this.Exit.Location = new System.Drawing.Point(373, 364);
            this.Exit.Name = "Exit";
            this.Exit.Size = new System.Drawing.Size(49, 22);
            this.Exit.TabIndex = 15;
            this.Exit.Text = "Thoát";
            this.Exit.UseVisualStyleBackColor = true;
            // 
            // PDMThem
            // 
            this.PDMThem.Location = new System.Drawing.Point(426, 286);
            this.PDMThem.Name = "PDMThem";
            this.PDMThem.Size = new System.Drawing.Size(48, 53);
            this.PDMThem.TabIndex = 16;
            this.PDMThem.Text = "Thêm vào PĐM";
            this.PDMThem.UseVisualStyleBackColor = true;
            this.PDMThem.Click += new System.EventHandler(this.PDMThem_Click);
            // 
            // dataGridView2
            // 
            this.dataGridView2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView2.Location = new System.Drawing.Point(426, 70);
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.Size = new System.Drawing.Size(143, 210);
            this.dataGridView2.TabIndex = 17;
            // 
            // PĐM
            // 
            this.PĐM.AutoSize = true;
            this.PĐM.Location = new System.Drawing.Point(453, 53);
            this.PĐM.Name = "PĐM";
            this.PĐM.Size = new System.Drawing.Size(74, 14);
            this.PĐM.TabIndex = 19;
            this.PĐM.Text = "Phiếu đặt món";
            // 
            // PDMMonXoa
            // 
            this.PDMMonXoa.Location = new System.Drawing.Point(480, 286);
            this.PDMMonXoa.Name = "PDMMonXoa";
            this.PDMMonXoa.Size = new System.Drawing.Size(89, 27);
            this.PDMMonXoa.TabIndex = 20;
            this.PDMMonXoa.Text = "Xóa món";
            this.PDMMonXoa.UseVisualStyleBackColor = true;
            // 
            // PDMXoa
            // 
            this.PDMXoa.Location = new System.Drawing.Point(480, 311);
            this.PDMXoa.Name = "PDMXoa";
            this.PDMXoa.Size = new System.Drawing.Size(89, 28);
            this.PDMXoa.TabIndex = 21;
            this.PDMXoa.Text = "Xóa PĐM";
            this.PDMXoa.UseVisualStyleBackColor = true;
            // 
            // PDMIn
            // 
            this.PDMIn.Location = new System.Drawing.Point(426, 345);
            this.PDMIn.Name = "PDMIn";
            this.PDMIn.Size = new System.Drawing.Size(67, 38);
            this.PDMIn.TabIndex = 22;
            this.PDMIn.Text = "In PĐM";
            this.PDMIn.UseVisualStyleBackColor = true;
            // 
            // HoaDon
            // 
            this.HoaDon.Location = new System.Drawing.Point(491, 345);
            this.HoaDon.Name = "HoaDon";
            this.HoaDon.Size = new System.Drawing.Size(78, 38);
            this.HoaDon.TabIndex = 23;
            this.HoaDon.Text = "ThanhToan";
            this.HoaDon.UseVisualStyleBackColor = true;
            // 
            // labelmamon
            // 
            this.labelmamon.AutoSize = true;
            this.labelmamon.Location = new System.Drawing.Point(-1, 318);
            this.labelmamon.Name = "labelmamon";
            this.labelmamon.Size = new System.Drawing.Size(44, 14);
            this.labelmamon.TabIndex = 25;
            this.labelmamon.Text = "Mã món";
            // 
            // txtMaMon
            // 
            this.txtMaMon.Location = new System.Drawing.Point(53, 315);
            this.txtMaMon.Name = "txtMaMon";
            this.txtMaMon.Size = new System.Drawing.Size(100, 20);
            this.txtMaMon.TabIndex = 24;
            // 
            // txtMaLoaiMon
            // 
            this.txtMaLoaiMon.AutoSize = true;
            this.txtMaLoaiMon.Location = new System.Drawing.Point(161, 318);
            this.txtMaLoaiMon.Name = "txtMaLoaiMon";
            this.txtMaLoaiMon.Size = new System.Drawing.Size(63, 14);
            this.txtMaLoaiMon.TabIndex = 27;
            this.txtMaLoaiMon.Text = "Mã loại món";
            // 
            // cbMaLoaiMon
            // 
            this.cbMaLoaiMon.FormattingEnabled = true;
            this.cbMaLoaiMon.Location = new System.Drawing.Point(230, 315);
            this.cbMaLoaiMon.Name = "cbMaLoaiMon";
            this.cbMaLoaiMon.Size = new System.Drawing.Size(84, 22);
            this.cbMaLoaiMon.TabIndex = 28;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(571, 387);
            this.Controls.Add(this.cbMaLoaiMon);
            this.Controls.Add(this.txtMaLoaiMon);
            this.Controls.Add(this.labelmamon);
            this.Controls.Add(this.txtMaMon);
            this.Controls.Add(this.HoaDon);
            this.Controls.Add(this.PDMIn);
            this.Controls.Add(this.PDMXoa);
            this.Controls.Add(this.PDMMonXoa);
            this.Controls.Add(this.PĐM);
            this.Controls.Add(this.dataGridView2);
            this.Controls.Add(this.PDMThem);
            this.Controls.Add(this.Exit);
            this.Controls.Add(this.Mon_Xoa);
            this.Controls.Add(this.MonSua);
            this.Controls.Add(this.MonThem);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.rdMon0);
            this.Controls.Add(this.rdMon1);
            this.Controls.Add(this.txtMoTa);
            this.Controls.Add(this.txtTenMon);
            this.Controls.Add(this.txtGiaMon);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.dataGridView1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox txtTenMon;
        private System.Windows.Forms.TextBox txtGiaMon;
        private System.Windows.Forms.TextBox txtMoTa;
        private System.Windows.Forms.RadioButton rdMon1;
        private System.Windows.Forms.RadioButton rdMon0;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button MonThem;
        private System.Windows.Forms.Button MonSua;
        private System.Windows.Forms.Button Mon_Xoa;
        private System.Windows.Forms.Button Exit;
        private System.Windows.Forms.Button PDMThem;
        private System.Windows.Forms.DataGridView dataGridView2;
        private System.Windows.Forms.Label PĐM;
        private System.Windows.Forms.Button PDMMonXoa;
        private System.Windows.Forms.Button PDMXoa;
        private System.Windows.Forms.Button PDMIn;
        private System.Windows.Forms.Button HoaDon;
        private System.Windows.Forms.Label labelmamon;
        private System.Windows.Forms.TextBox txtMaMon;
        private System.Windows.Forms.Label txtMaLoaiMon;
        private System.Windows.Forms.ComboBox cbMaLoaiMon;
    }
}

