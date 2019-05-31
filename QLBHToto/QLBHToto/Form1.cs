using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;

namespace GUI
{

    public partial class Form1 : Form
    {
        LoaiMon_BLL loaimon = new LoaiMon_BLL();
        Ban_BLL ban = new Ban_BLL();
        Mon_BLL mon = new Mon_BLL();
        PhieuDatMon_BLL pdm = new PhieuDatMon_BLL();
        ChiTietPDM_BLL ctpdm = new ChiTietPDM_BLL();
        private void Form1_Load(object sender, EventArgs e)
        {
            //dataGridView1.DataSource = loaimon.SinhVien_Select();

            ////Gán dữ liệu nguồn
            comboBox1.DataSource = loaimon.LoaiMon_Select();
            ////Gán trường sẽ hiển thị trên comboBox
            comboBox1.DisplayMember = "TenLoaiMon";
            ////Gã trường mã ẩn sau mỗi trường trên comboBox
            ////Nhằm mục đích khi chọn 1 item sẽ sử dụng mã ẩn để lọc dữ liệu 
            comboBox1.ValueMember = "MaLoaiMon";


            //Gán dữ liệu nguồn
            cbBan.DataSource = ban.Ban_Select();
            //Gán trường sẽ hiển thị trên comboBox
            cbBan.DisplayMember = "MaBan";
            //Gã trường mã ẩn sau mỗi trường trên comboBox
            //Nhằm mục đích khi chọn 1 item sẽ sử dụng mã ẩn để lọc dữ liệu 
            cbBan.ValueMember = "MaBan";

   
        }
        private void ClearData()
        {
            txtTenMon.Clear();
            txtMoTa.Clear();
            txtGiaMon.Clear();
            rdMon1.Checked = false;
            rdMon0.Checked = false;
        }
        private void DisplayData( string query)
        {
            //con.Open();
            //DataTable dt = new DataTable();
            //sql = "SELECT dbo.Mon.MaMon,dbo.Mon.MaLoaiMon,dbo.Mon.TenMon, dbo.Mon.Gia, dbo.Mon.Mota, dbo.Mon.TinhTrang " +
            //    "FROM dbo.LoaiMon INNER JOIN dbo.Mon " +
            //    "ON dbo.LoaiMon.MaLoaiMon = dbo.Mon.MaLoaiMon " +
            //    query;
            ////MessageBox.Show(sql);
            //da = new SqlDataAdapter(sql, con);
            //da.Fill(dt);
            //dataGridView1.DataSource = dt;
            //con.Close();
            
        }
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
        //private int MaPDM()
        //{
        //    if (pdm.PhieuDatMon_ChonTai_Ban(int.Parse(cbBan.SelectedValue.ToString())).Rows.Count == 0)
        //    {
        //        return 0;
        //    }

        //    return int.Parse(pdm.PhieuDatMon_ChonTai_Ban(int.Parse(cbBan.SelectedValue.ToString())).Rows[0]["MaPDM"].ToString()); 
        //}
        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = mon.Mon_ChonAll_where_LoaiMon(int.Parse(comboBox1.SelectedValue.ToString()));
           
            ////Gán dữ liệu nguồn
            cbMaLoaiMon.DataSource = loaimon.LoaiMon_Select();
            ////Gán trường sẽ hiển thị trên comboBox
            cbMaLoaiMon.DisplayMember = "TenLoaiMon";
            ////Gã trường mã ẩn sau mỗi trường trên comboBox
            ////Nhằm mục đích khi chọn 1 item sẽ sử dụng mã ẩn để lọc dữ liệu 
            cbMaLoaiMon.ValueMember = "MaLoaiMon";

            //Hiển thị chi tiết phiếu đặt món
            //int mapdm =0;
            //MessageBox.Show(pdm.PhieuDatMon_ChonTai_Ban(int.Parse(cbBan.SelectedValue.ToString())).Rows[0]["MaPDM"].ToString());

            string MaPDM = "";
            if (pdm.PhieuDatMon_ChonTai_Ban(int.Parse(cbBan.SelectedValue.ToString())).Rows.Count == 0)
            {
              
            }
            else
            {
                MaPDM = (pdm.PhieuDatMon_ChonTai_Ban(int.Parse(cbBan.SelectedValue.ToString())).Rows[0]["MaPDM"].ToString());
            }
           
            dataGridPDM.DataSource = ctpdm.ChiTietPDM_ChonTai(MaPDM);
            //if (Math.Abs(pdm.Check_PhieuDatMon_ChonTai_Ban(int.Parse(cbBan.SelectedValue.ToString()))) == 1)
            //{
            //    int MaPDM =  int.Parse(pdm.PhieuDatMon_ChonTai_Ban(int.Parse(cbBan.SelectedValue.ToString())).Rows[0]["MaPDM"].ToString());
            //    MessageBox.Show(" UNSuccessfully");
            //}
            //else
            //{
            //    MessageBox.Show(" Successfully");
            //}



        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            int i = dataGridView1.CurrentRow.Index;
            txtMaMon.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            cbMaLoaiMon.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
            txtTenMon.Text = dataGridView1.Rows[i].Cells[2].Value.ToString();
            txtGiaMon.Text = dataGridView1.Rows[i].Cells[3].Value.ToString();
            txtMoTa.Text = dataGridView1.Rows[i].Cells[4].Value.ToString();
            //MessageBox.Show(dataGridView1.Rows[i].Cells[3].Value.ToString());
            if (dataGridView1.Rows[i].Cells[5].Value.ToString()=="True")
            {
                rdMon1.Checked = true;
            }
            else
            {
                rdMon0.Checked = true;
            }

            SoBan.Text = (ban.Ban_ChonTai(int.Parse(cbBan.SelectedValue.ToString())).Rows[0]["MaBan"]).ToString();

        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (txtMaMon.Text != "" && txtTenMon.Text != "")
            {

                mon.Mon_Xoa(int.Parse(txtMaMon.Text));
                MessageBox.Show("Record Deleted Successfully!");
                ClearData();
            }
            else
            {
                MessageBox.Show("Please Select Record to Delete");
            }
        }

        private void txtTenMon_TextChanged(object sender, EventArgs e)
        {

        }

        private void MonThem_Click(object sender, EventArgs e)
        {
            if (txtTenMon.Text != "" && txtMaMon.Text != "")
            {
                mon.Mon_Them(int.Parse(cbMaLoaiMon.Text), txtTenMon.Text, int.Parse(txtGiaMon.Text), txtMoTa.Text);
                MessageBox.Show("Record Inserted Successfully");

                //DisplayData(query);
                ClearData();
            }
            else
            {
                MessageBox.Show("Please Provide Details!");
            }
        }

        private void MonSua_Click(object sender, EventArgs e)
        {
            if (txtTenMon.Text != "" && txtMaMon.Text != "")
            {
                mon.Mon_CapNhap(int.Parse(cbMaLoaiMon.Text), int.Parse(txtMaMon.Text), txtTenMon.Text, int.Parse(txtGiaMon.Text), txtMoTa.Text, rdMon1.Checked);
                
                MessageBox.Show("Record Updated Successfully");
                //DisplayData(query);
                //ClearData();

            }
            else
            {
                MessageBox.Show("Please Provide Details!");
            }
        }

        private void PDMThem_Click(object sender, EventArgs e)
        {
            ////Đầu tiên xét trạng thái bàn
            ///
            int MaPDM = 0;
            if (pdm.PhieuDatMon_ChonTai_Ban(int.Parse(cbBan.SelectedValue.ToString())).Rows.Count == 0)
            {
                
            }
            else
            {
                MaPDM = int.Parse(pdm.PhieuDatMon_ChonTai_Ban(int.Parse(cbBan.SelectedValue.ToString())).Rows[0]["MaPDM"].ToString());
            }

            if (ban.Ban_ChonTai(int.Parse(cbBan.SelectedValue.ToString())).Rows[0]["TinhTrang"].ToString()=="True")
            {
                //Bàn trống
                //Thay đổi tình trạng bàn
                ban.Ban_Sua(int.Parse(cbBan.SelectedValue.ToString()),1,0);
                //Tạo phiếu đặt món
                pdm.PhieuDatMon_Them("NV05061901",int.Parse(cbBan.SelectedValue.ToString()),0,0,0);
                //Tao luon ca mon vao PDM
                if (txtMaMon.Text == "")
                {

                }
                else
                {
                    //ctpdm.ChiTietPDM_Them(MaPDM, int.Parse(txtMaMon.Text),soluong);
                    MessageBox.Show("Record Inserted Successfully");
                }
            }
            else
            {
                // Bàn đang có khách
                MessageBox.Show("Table not empty!!");
            }

            //CTPDM- chi tiet phieu dat mon
            //Kiem tra mon da ton tai trong CTPDM chua

            if (ctpdm.ChiTietPDM_ChonTai(MaPDM.ToString()) != null)
            {
                var datatable = ctpdm.ChiTietPDM_ChonTai(MaPDM.ToString());
                var numberofrows = datatable.Rows.Count;
                for (int i = 0; i < numberofrows; i++)
                {
                    //for each row, get the 3rd column
                    var cellValue = datatable.Rows[i]["MaMon"];
                    MessageBox.Show(cellValue.ToString());
                }
            }
            //Ton tai
            //Cap nhap so luong

            //Chua ton tai
            //Tao CTPDM
            //ctpdm.ChiTietPDM_Them(MaPDM ,int.Parse(txtMaMon.Text.ToString()));




            ////MaPDM theo cú pháp 'PDM'+'XX'+'YYMMDD'+'STT'
            ////Kiểm tra tồn tại của MaPDM trong PĐM
            ////-- Tồn tại: Xét trạng thái bàn
            ////-- Không tồn tại: Insert CSDL trong bản PĐM và CTPĐM
            ////Nếu không tồn tại thì tạo PĐM

            //sql = "SELECT MaBan, TinhTrang, BanGop FROM dbo.Ban WHERE MaBan ="+ cbBan.SelectedValue;
            //da = new SqlDataAdapter(sql, con);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            ////Bàn đang được sử dụng
            //if (dt.Rows[0][1].Equals(true))
            //{
            //    //
            //}
            ////Trống
            //else
            //{

            //}
            ////if (dt.Rows.Count > 0)
            ////{
            ////    DataRow row = dt.Rows[0];
            ////    TinhTrang = row["TinhTrang"].ToString();
            ////}
            ////else
            ////{
            ////    MessageBox.Show("WRONG!!!");
            ////}
            ////dataGridView2.DataSource = dt;
            //con.Close();
        }

        private void cbMaLoaiMon_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void Exit_Click(object sender, EventArgs e)
        {
            System.Environment.Exit(1);
        }

        private void dataGridPDM_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}

