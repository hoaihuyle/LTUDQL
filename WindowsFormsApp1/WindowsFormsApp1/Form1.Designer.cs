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
            this.dataGridView1.Location = new System.Drawing.Point(12, 106);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(776, 292);
            this.dataGridView1.TabIndex = 0;
            //this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
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
            this.comboBox1.Location = new System.Drawing.Point(31, 28);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(121, 22);
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
            this.button1.Location = new System.Drawing.Point(174, 20);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 37);
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
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
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
    }
}