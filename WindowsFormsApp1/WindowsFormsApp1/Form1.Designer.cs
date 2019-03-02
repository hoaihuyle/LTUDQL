namespace WindowsFormsApp1
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
            this.components = new System.ComponentModel.Container();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.qLBHDataSet = new WindowsFormsApp1.QLBHDataSet();
            this.mAT_HANGTableAdapter = new WindowsFormsApp1.QLBHDataSetTableAdapters.MAT_HANGTableAdapter();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.nHACUNGCAPBindingSource3 = new System.Windows.Forms.BindingSource(this.components);
            this.nHACUNGCAPBindingSource2 = new System.Windows.Forms.BindingSource(this.components);
            this.nHACUNGCAPBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.nHA_CUNG_CAPTableAdapter = new WindowsFormsApp1.QLBHDataSetTableAdapters.NHA_CUNG_CAPTableAdapter();
            this.button1 = new System.Windows.Forms.Button();
            this.nHACUNGCAPBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.Ten_MH = new System.Windows.Forms.TextBox();
            this.Ma_MH = new System.Windows.Forms.TextBox();
            this.Tluong_MH = new System.Windows.Forms.TextBox();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.Loai_MH = new System.Windows.Forms.TextBox();
            this.Gia_Mua_MH = new System.Windows.Forms.TextBox();
            this.Gia_Ban_MH = new System.Windows.Forms.TextBox();
            this.Mau_MH = new System.Windows.Forms.TextBox();
            this.Ton_Kho_MH = new System.Windows.Forms.TextBox();
            this.Ma_NCC = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.qLBHDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nHACUNGCAPBindingSource3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nHACUNGCAPBindingSource2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nHACUNGCAPBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nHACUNGCAPBindingSource1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 58);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(776, 201);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            this.dataGridView1.RowHeaderMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dataGridView1_RowHeaderMouseClick);
            // 
            // qLBHDataSet
            // 
            this.qLBHDataSet.DataSetName = "QLBHDataSet";
            this.qLBHDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // mAT_HANGTableAdapter
            // 
            this.mAT_HANGTableAdapter.ClearBeforeFill = true;
            // 
            // comboBox1
            // 
            this.comboBox1.DataBindings.Add(new System.Windows.Forms.Binding("SelectedValue", this.nHACUNGCAPBindingSource3, "Ma_NCC", true));
            this.comboBox1.DataSource = this.nHACUNGCAPBindingSource2;
            this.comboBox1.DisplayMember = "Ten_NCC";
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(31, 26);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(121, 21);
            this.comboBox1.TabIndex = 1;
            this.comboBox1.ValueMember = "Ma_NCC";
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // nHACUNGCAPBindingSource3
            // 
            this.nHACUNGCAPBindingSource3.DataMember = "NHA_CUNG_CAP";
            this.nHACUNGCAPBindingSource3.DataSource = this.qLBHDataSet;
            // 
            // nHACUNGCAPBindingSource2
            // 
            this.nHACUNGCAPBindingSource2.DataMember = "NHA_CUNG_CAP";
            this.nHACUNGCAPBindingSource2.DataSource = this.qLBHDataSet;
            // 
            // nHACUNGCAPBindingSource
            // 
            this.nHACUNGCAPBindingSource.DataMember = "NHA_CUNG_CAP";
            this.nHACUNGCAPBindingSource.DataSource = this.qLBHDataSet;
            // 
            // nHA_CUNG_CAPTableAdapter
            // 
            this.nHA_CUNG_CAPTableAdapter.ClearBeforeFill = true;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(174, 19);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 34);
            this.button1.TabIndex = 2;
            this.button1.Text = "Hiển Thị CTGH";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // nHACUNGCAPBindingSource1
            // 
            this.nHACUNGCAPBindingSource1.DataMember = "NHA_CUNG_CAP";
            this.nHACUNGCAPBindingSource1.DataSource = this.qLBHDataSet;
            // 
            // Ten_MH
            // 
            this.Ten_MH.Location = new System.Drawing.Point(74, 323);
            this.Ten_MH.Name = "Ten_MH";
            this.Ten_MH.Size = new System.Drawing.Size(100, 20);
            this.Ten_MH.TabIndex = 3;
            // 
            // Ma_MH
            // 
            this.Ma_MH.Location = new System.Drawing.Point(74, 271);
            this.Ma_MH.Name = "Ma_MH";
            this.Ma_MH.Size = new System.Drawing.Size(100, 20);
            this.Ma_MH.TabIndex = 4;
            this.Ma_MH.TextChanged += new System.EventHandler(this.Ma_MH_TextChanged);
            // 
            // Tluong_MH
            // 
            this.Tluong_MH.Location = new System.Drawing.Point(264, 271);
            this.Tluong_MH.Name = "Tluong_MH";
            this.Tluong_MH.Size = new System.Drawing.Size(100, 20);
            this.Tluong_MH.TabIndex = 5;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(695, 355);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 7;
            this.button2.Text = "Cập nhập";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(695, 284);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(75, 23);
            this.button3.TabIndex = 8;
            this.button3.Text = "Thêm";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(695, 313);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(75, 23);
            this.button4.TabIndex = 9;
            this.button4.Text = "Sửa";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(695, 383);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(75, 23);
            this.button5.TabIndex = 10;
            this.button5.Text = "Xóa";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // Loai_MH
            // 
            this.Loai_MH.Location = new System.Drawing.Point(74, 373);
            this.Loai_MH.Name = "Loai_MH";
            this.Loai_MH.Size = new System.Drawing.Size(100, 20);
            this.Loai_MH.TabIndex = 16;
            // 
            // Gia_Mua_MH
            // 
            this.Gia_Mua_MH.Location = new System.Drawing.Point(445, 271);
            this.Gia_Mua_MH.Name = "Gia_Mua_MH";
            this.Gia_Mua_MH.Size = new System.Drawing.Size(100, 20);
            this.Gia_Mua_MH.TabIndex = 20;
            // 
            // Gia_Ban_MH
            // 
            this.Gia_Ban_MH.Location = new System.Drawing.Point(445, 326);
            this.Gia_Ban_MH.Name = "Gia_Ban_MH";
            this.Gia_Ban_MH.Size = new System.Drawing.Size(100, 20);
            this.Gia_Ban_MH.TabIndex = 19;
            // 
            // Mau_MH
            // 
            this.Mau_MH.Location = new System.Drawing.Point(263, 326);
            this.Mau_MH.Name = "Mau_MH";
            this.Mau_MH.Size = new System.Drawing.Size(100, 20);
            this.Mau_MH.TabIndex = 18;
            // 
            // Ton_Kho_MH
            // 
            this.Ton_Kho_MH.Location = new System.Drawing.Point(263, 373);
            this.Ton_Kho_MH.Name = "Ton_Kho_MH";
            this.Ton_Kho_MH.Size = new System.Drawing.Size(100, 20);
            this.Ton_Kho_MH.TabIndex = 17;
            // 
            // Ma_NCC
            // 
            this.Ma_NCC.Location = new System.Drawing.Point(445, 373);
            this.Ma_NCC.Name = "Ma_NCC";
            this.Ma_NCC.Size = new System.Drawing.Size(100, 20);
            this.Ma_NCC.TabIndex = 22;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(28, 274);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(45, 13);
            this.label1.TabIndex = 23;
            this.label1.Text = "Ma_MH";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(26, 323);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(49, 13);
            this.label2.TabIndex = 24;
            this.label2.Text = "Ten_MH";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(190, 274);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(63, 13);
            this.label3.TabIndex = 25;
            this.label3.Text = "Tluong_MH";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(180, 376);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(74, 13);
            this.label4.TabIndex = 26;
            this.label4.Text = "Ton_Kho_MH";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(370, 326);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(71, 13);
            this.label5.TabIndex = 27;
            this.label5.Text = "Gia_Ban_MH";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(189, 329);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(51, 13);
            this.label6.TabIndex = 28;
            this.label6.Text = "Mau_MH";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(26, 379);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(50, 13);
            this.label7.TabIndex = 29;
            this.label7.Text = "Loai_MH";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(369, 274);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(73, 13);
            this.label8.TabIndex = 30;
            this.label8.Text = "Gia_Mua_MH";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(391, 379);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(50, 13);
            this.label9.TabIndex = 31;
            this.label9.Text = "Ma_NCC";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 418);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Ma_NCC);
            this.Controls.Add(this.Gia_Mua_MH);
            this.Controls.Add(this.Gia_Ban_MH);
            this.Controls.Add(this.Mau_MH);
            this.Controls.Add(this.Ton_Kho_MH);
            this.Controls.Add(this.Loai_MH);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.Tluong_MH);
            this.Controls.Add(this.Ma_MH);
            this.Controls.Add(this.Ten_MH);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.dataGridView1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.qLBHDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nHACUNGCAPBindingSource3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nHACUNGCAPBindingSource2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nHACUNGCAPBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nHACUNGCAPBindingSource1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private QLBHDataSet qLBHDataSet;
        private QLBHDataSetTableAdapters.MAT_HANGTableAdapter mAT_HANGTableAdapter;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.BindingSource nHACUNGCAPBindingSource;
        private QLBHDataSetTableAdapters.NHA_CUNG_CAPTableAdapter nHA_CUNG_CAPTableAdapter;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.BindingSource nHACUNGCAPBindingSource1;
        private System.Windows.Forms.BindingSource nHACUNGCAPBindingSource2;
        private System.Windows.Forms.BindingSource nHACUNGCAPBindingSource3;
        private System.Windows.Forms.TextBox Ten_MH;
        private System.Windows.Forms.TextBox Ma_MH;
        private System.Windows.Forms.TextBox Tluong_MH;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.TextBox Loai_MH;
        private System.Windows.Forms.TextBox Gia_Mua_MH;
        private System.Windows.Forms.TextBox Gia_Ban_MH;
        private System.Windows.Forms.TextBox Mau_MH;
        private System.Windows.Forms.TextBox Ton_Kho_MH;
        private System.Windows.Forms.TextBox Ma_NCC;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
    }
}