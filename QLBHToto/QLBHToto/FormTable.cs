using BLL;
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
    public partial class FormTable : Form
    {
        //Tiền
        int soluong = 1;
        float red;
        float sur;

        //Số lượng
        int num = 1;
        //Tổng page
        int tong = 0;
        object[] row = { };
        DataTable dt;
        //int soluong = 1;
        LoaiMon_BLL loaimon = new LoaiMon_BLL();
        Ban_BLL ban = new Ban_BLL();
        Mon_BLL mon = new Mon_BLL();
        PhieuDatMon_BLL pdm = new PhieuDatMon_BLL();
        ChiTietPDM_BLL ctpdm = new ChiTietPDM_BLL();
        HoaDon_BLL hd = new HoaDon_BLL();

        private string mamon = "", tenmon = "", giamon = "";

        //Nghiệp vụ chuyển bàn
        public static string Moveban = "";
        public static string Movepdm = "";
        public FormTable()
        {
            InitializeComponent();

            //Hide form
            if (UC_Table.ktmoveSucess) this.Dispose();

            ////Gán dữ liệu nguồn
            comboBox1.DataSource = loaimon.LoaiMon_Select();
            ////Gán trường sẽ hiển thị trên comboBox
            comboBox1.DisplayMember = "TenLoaiMon";
            ////Gã trường mã ẩn sau mỗi trường trên comboBox
            ////Nhằm mục đích khi chọn 1 item sẽ sử dụng mã ẩn để lọc dữ liệu 
            comboBox1.ValueMember = "MaLoaiMon";

            //=========================== Datagridview 1
            dataGridView1.ColumnCount = 3;
            dataGridView1.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView1.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
            dataGridView1.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView1.Columns[0].Name = "Mã Món";
            dataGridView1.Columns[1].Name = "Tên Món";
            dataGridView1.Columns[2].Name = "Giá tiền";
            DataGridViewButtonColumn btndt1 = new DataGridViewButtonColumn();
            dataGridView1.Columns.Add(btndt1);
            btndt1.HeaderText = "Thêm món";
            btndt1.Text = "Thêm";
            btndt1.Name = "btn";
            btndt1.UseColumnTextForButtonValue = true;
            //=========================== Datagridview 2
            dataGridView2.ColumnCount = 4;
            dataGridView2.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView2.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
            dataGridView2.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView2.Columns[3].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView2.Columns[0].Name = "Mã Món";
            dataGridView2.Columns[1].Name = "Tên Món";
            dataGridView2.Columns[2].Name = "Số lượng";
            dataGridView2.Columns[3].Name = "Thành tiền";
           

            ///Recieve table-number from Trangchu
            lb_soBan.Text = UC_Table.SetMaBan;
            lb_MaNV.Text = "NV23051901";
            lb_pdm.Text = "";
            dt = pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString()));
            if (dt.Rows.Count > 0)
            {
                //if (dt.Rows[0]["TinhTrang"].ToString() == "True")
                //{
                lb_pdm.Text = dt.Rows[0]["MaPDM"].ToString();
                txt_tong.Text = dt.Rows[0]["ThanhTien"].ToString();
                txt_surcharge.Text = dt.Rows[0]["PhuThu"].ToString();
                txt_reduce.Text = dt.Rows[0]["GiamGia"].ToString();
                tong = int.Parse(txt_tong.Text);
                txt_tong.ReadOnly = true;
                txt_tong.BackColor = System.Drawing.SystemColors.Window;
                //}

            }
            //Check if exist ChiTietPDM show on DataGridView--&&&&--Create fourth-button
            dt = ctpdm.ThonTinPDM_ChonTai(lb_pdm.Text);
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {

                    object[] field = new object[5];
                    int dem = 0;

                    foreach (DataColumn dc in dt.Columns)
                    {
                        field[dem] = dr[dc.ColumnName];
                        if (dem == 3)
                        {
                            field[dem] = double.Parse(dr[dc.ColumnName].ToString()) * soluong;
                        }
                        if (dem == 2)
                        {
                            soluong = int.Parse(field[dem].ToString());
                        }
                        dem++;
                    }

                    dataGridView2.Rows.Add(field);

                }
                DataGridViewButtonColumn btn = new DataGridViewButtonColumn();
                dataGridView2.Columns.Add(btn);
                btn.HeaderText = "Xóa món";
                btn.Text = "Xóa";
                btn.Name = "btn";
                btn.UseColumnTextForButtonValue = true;
            }
        }

        private void ClearData()
        {
           
        }

        private void DisplayData(string query)
        {


        }

        private void Set_ValueD1(int i)
        {
            mamon = dataGridView1.Rows[i].Cells[0].Value.ToString();
            tenmon = dataGridView1.Rows[i].Cells[1].Value.ToString();
            giamon = dataGridView1.Rows[i].Cells[2].Value.ToString();
        }

        private void Set_ValueD2(int i)
        {

            if (dataGridView2.Rows[i].Cells[0].Value != null)
            {
                mamon = dataGridView2.Rows[i].Cells[0].Value.ToString();
                tenmon = dataGridView2.Rows[i].Cells[1].Value.ToString();
                //Nếu số lượng =0
                soluong = int.Parse(dataGridView2.Rows[i].Cells[2].Value.ToString());
                if (soluong == 0)
                    soluong = 1;
                giamon = (int.Parse(dataGridView2.Rows[i].Cells[3].Value.ToString()) / soluong).ToString();
                //txtMaMon.Text = dataGridView2.Rows[i].Cells[0].Value.ToString();
                //txtTenMon.Text = dataGridView2.Rows[i].Cells[1].Value.ToString();
                //txtGiaMon.Text = (int.Parse(dataGridView2.Rows[i].Cells[3].Value.ToString()) / int.Parse(dataGridView2.Rows[i].Cells[2].Value.ToString())).ToString();
            }
        }

        private void DataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {
            int i = dataGridView1.CurrentRow.Index;
            Set_ValueD1(i);
            if (e.ColumnIndex == 3)
            {
                foreach (DataGridViewRow row1 in dataGridView2.Rows)
                {
                    if (row1.Cells[0].Value == null)
                    {
                        if (mamon != "" && tenmon != "" && giamon != "")
                        {
                            row = new object[] { mamon, tenmon, num.ToString(), double.Parse(giamon) };
                            dataGridView2.Rows.Add(row);
                            tong += int.Parse(giamon);
                            txt_tong.Text = tong.ToString();
                            return;
                        }
                        else
                        {
                            MessageBox.Show("Xin mời chọn món!!!");
                        }
                    }
                    else
                    {

                        if (row1.Cells[0].Value.ToString() == mamon.ToString())
                        {
                            //update cell[2]- soluong
                            row1.Cells[2].Value = int.Parse(row1.Cells[2].Value.ToString()) + 1;
                            soluong = int.Parse(row1.Cells[2].Value.ToString());
                            row1.Cells[3].Value = Math.Abs(double.Parse(giamon) * int.Parse(row1.Cells[2].Value.ToString()));
                            tong = tong + int.Parse(giamon);
                            txt_tong.Text = tong.ToString();
                            return;
                        }
                    }

                }
            }
        }

        private void DataGridView1_RowHeaderMouseClick_1(object sender, DataGridViewCellMouseEventArgs e)
        {
            int i = dataGridView1.CurrentRow.Index;
            Set_ValueD1(i);
        }

        private void TongTien(int gia, int sl, int dau)
        {
            if (dau == 0)
                tong -= gia * sl;
            else tong += int.Parse(giamon);
            txt_tong.Text = tong.ToString();
        }
        private void DataGridView2_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {

        }

        private void DataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int i = dataGridView2.CurrentRow.Index;
            Set_ValueD2(i);
            if (e.ColumnIndex == 4)
            {
                //MessageBox.Show((e.RowIndex + 1) + "  Row  " + (e.ColumnIndex + 1) + "  Column button clicked ");
                if (i >= 0)
                {
                    //Số lượng
                    soluong = int.Parse(dataGridView2.Rows[i].Cells[2].Value.ToString());
                    if (soluong >= 2)
                    {
                        dataGridView2.Rows[i].Cells[2].Value = soluong - 1;
                        //Thành tiền
                        if (giamon != "")
                        {
                            dataGridView2.Rows[i].Cells[3].Value = double.Parse(giamon) * int.Parse(dataGridView2.Rows[i].Cells[2].Value.ToString());

                        }
                        else MessageBox.Show("Xin chọn món!!!!");
                    }
                    else
                    {
                        dataGridView2.Rows.RemoveAt(i);

                    }
                    TongTien(int.Parse(giamon), 1, 0);
                }
                else
                    MessageBox.Show("Xin chọn món cần xóa");
            }
        }

        private void Btn_HienThi_Click(object sender, EventArgs e)
        {
            DataTable dtmon = mon.Mon_ChonAll_where_LoaiMon(int.Parse(comboBox1.SelectedValue.ToString()));
            foreach (DataRow row1 in dtmon.Rows)
            {
                int dem = 0;
                foreach (var item in row1.ItemArray)
                {
                    if (dem == 0) { mamon = item.ToString();  }
                    if (dem == 1) { tenmon = item.ToString(); }
                    if (dem == 2) { giamon = item.ToString(); }
                    dem++;
                }
                row = new object[] { mamon, tenmon, giamon };
                dataGridView1.Rows.Add(row);
            }


        }
        //Nghiệp vụ chuyển bàn
        private void Btn_Mvtb_Click(object sender, EventArgs e)
        {
            if (lb_pdm.Text == "")
            {
                MessageBox.Show("Bàn đang trống không thể chuyển bàn !!!");
                this.Dispose();
            }
            else
            {
                Moveban = lb_soBan.Text;
                Movepdm = lb_pdm.Text;

                using (FormDashBoard f = new FormDashBoard())
                {
                    f.ShowDialog();
                }
            }
            
        }

        private void Btn_back_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void Btn_LuuPDM_Click(object sender, EventArgs e)
        {

        }

        private void BtnXoaMon_Click(object sender, EventArgs e)
        {

        }

        private void HoaDon_Click(object sender, EventArgs e)
        {

        }


        private void PDMIn_Click(object sender, EventArgs e)
        {

        }

        private void PDMXoa_Click(object sender, EventArgs e)
        {

        }

    }
}
