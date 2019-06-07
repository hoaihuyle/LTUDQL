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
        int mangve = 0;
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

            //Check lb_soban can convert to int? if can not -> Mang Về
            DataTable dt1=null;
            if(CheckConvert(lb_pdm.Text)) {/*True*/ dt1 = pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString())); }
            else
            { /*False--*/
                mangve = int.Parse(UC_Table.SplitString(lb_soBan.Text));
                 //= int.Parse(lb_soBan.Text.Substring(lb_soBan.Text.Length - (lb_soBan.Text.Length - 7), (lb_soBan.Text.Length - 7)));
                dt1=dtpdMangVe(mangve);
            }
            if (dt1!=null)
            {
                if (dt1.Rows.Count > 0)
                {
                    //if (dt.Rows[0]["TinhTrang"].ToString() == "True")
                    //{
                    lb_pdm.Text = dt1.Rows[0]["MaPDM"].ToString();
                    //=============Tong tiền TEXTBOX
                    txt_tong.Text = dt1.Rows[0]["ThanhTien"].ToString();
                    txt_surcharge.Text = dt1.Rows[0]["PhuThu"].ToString();
                    txt_reduce.Text = dt1.Rows[0]["GiamGia"].ToString();
                    tong = int.Parse(txt_tong.Text);

                    //double costred = double.Parse(txt_reduce.Text.ToString()) * (double)tong / 100;
                    //tong = tong + int.Parse(txt_surcharge.Text.ToString()) - Convert.ToInt32(costred);
                    //txt_tong.Text = tong.ToString();
                    //Update txt tong

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
           
        }

        private DataTable dtpdMangVe(int mamv)
        {
            DataTable dtpdm = pdm.PhieuDatMon_MangVe_TonTai();
            DataTable dt_copy = new DataTable();
            dt_copy = dtpdm.Clone();
            int dem = 1;
            foreach (DataRow row in dtpdm.Rows)
            {
                //foreach (var item in row.ItemArray)
                //{
                //    MessageBox.Show(item.ToString());
                //}
                if (mamv == dem) { dt_copy.Rows.Add(row.ItemArray); ; return dt_copy; };
                dem++;
                
            }

            //foreach (DataRow row in dt_copy.Rows)
            //{
            //    foreach (var item in row.ItemArray)
            //    {
            //        MessageBox.Show(item.ToString());
            //    }

            //}
            return null;
        }

        private void FormTable_Load(object sender, EventArgs e)
        {
            
            if(Moveban!=""){  Moveban = ""; MoveDB(); }
            //MessageBox.Show(UC_Table.ktmoveSucess.ToString());
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
                            if(txt_reduce.Text.ToString()!="")
                            {
                                double costred = double.Parse(txt_reduce.Text.ToString()) * (double)tong / 100;
                                tong = tong + int.Parse(txt_surcharge.Text.ToString()) - Convert.ToInt32(costred);
                            }
                            txt_tong.Text = tong.ToString();
                            return;
                        }
                        else
                        {
                            MessageBox.Show("Xin mời chọn món!!!", "Thông báo");
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
            int i = dataGridView2.CurrentRow.Index;
            Set_ValueD2(i);
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
                        else MessageBox.Show("Xin chọn món!!!!", "Thông báo");
                    }
                    else
                    {
                        dataGridView2.Rows.RemoveAt(i);

                    }
                    TongTien(int.Parse(giamon), 1, 0);
                }
                else
                    MessageBox.Show("Xin chọn món cần xóa", "Thông báo");
            }
        }

        private void Btn_HienThi_Click(object sender, EventArgs e)
        {
            if (dataGridView1.RowCount > 1)
            {
                dataGridView1.Rows.Clear();

            }
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

        private void ComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
          
               

        }

        //Nghiệp vụ chuyển bàn
        private void Btn_Mvtb_Click(object sender, EventArgs e)
        {
            if(mangve==0)
            {
                if (lb_pdm.Text == "")
                {
                    MessageBox.Show("Bàn đang trống không thể chuyển bàn !!!", "Thông báo");
                }
                else
                {
                    Moveban = lb_soBan.Text;
                    Movepdm = lb_pdm.Text;

                }
                MoveDB();
            }
            else
            {
                MessageBox.Show("Phiếu mang về, không thể chuyển !!!","Thông báo");
            }
            
        }
        //Quay trở lại
        private void Btn_back_Click(object sender, EventArgs e)
        {
            MoveDB();
        }

        void MoveDB()
        {
            this.Dispose();
            using (FormDashBoard f = new FormDashBoard()) { f.ShowDialog(); }
        }

        private void Btn_LuuPDM_Click(object sender, EventArgs e)
        {

            StatusPDM(1);
            MoveDB();
        }


        //In hóa đơn
        private void PDMIn_Click(object sender, EventArgs e)
        {
            StatusPDM(2);
            MoveDB();
        }
        private bool CheckConvert(string Str)
        {
            int value;
            if (int.TryParse(lb_soBan.Text, out value)) return true;
            return false;
        }
        private void StatusPDM(int tinhtrang)
        {
            //Phụ thu, giảm giá va tổng tiền
            if (txt_reduce.Text != "")
            red = float.Parse(txt_reduce.Text.ToString());
            if (txt_surcharge.Text != "")
                sur = float.Parse(txt_surcharge.Text.ToString());

            if (CheckConvert(lb_soBan.Text))
            {
                if (int.Parse(ban.Ban_ChonTai(int.Parse(lb_soBan.Text.ToString())).Rows[0]["TinhTrang"].ToString()) == 0)
                {
                    //Tạo phiếu đặt món
                    pdm.PhieuDatMon_Them(lb_MaNV.Text, int.Parse(lb_soBan.Text.ToString()), tong, red, sur);
                    //Lấy MaPDM
                    lb_pdm.Text = (pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString())).Rows[0]["MaPDM"].ToString());
                }
                else
                {
                    // Bàn đang có khách
                    //Xóa CTPDM
                    ctpdm.ChiTietPDM_Xoa(lb_pdm.Text);
                }
            }
            else
            {
                if(UC_Table.CheckMangVe==false)
                {
                    //Không có PĐM nào mang về
                    pdm.PhieuDatMon_Them_THMV(lb_MaNV.Text, 1, tong, red, sur);
                    //lb_pdm.Text = pdm.PhieuDatMon_MangVe_TonTai().Rows[0]["MaPDM"].ToString();
                    lb_pdm.Text = dtpdMangVe(mangve).Rows[0]["MaPDM"].ToString();
                }
                else
                {
                    //PDM đã tồn tại-> cập nhập CTPDM bằng cách xóa cái cũ
                    ctpdm.ChiTietPDM_Xoa(lb_pdm.Text);
                }
            }

            //Tao chi tiết PDM
            int dem = 0;
            //Lặp lại việc thêm ChiTietPDM
            //Chỉnh sửa trạng thái bàn
            foreach (DataGridViewRow row in dataGridView2.Rows)
            {
                if (row.Cells[0].Value != null)
                {
                    ctpdm.ChiTietPDM_Them(lb_pdm.Text, int.Parse(row.Cells[0].Value.ToString()), int.Parse(row.Cells[2].Value.ToString()));
                }
                dem++;
            }
            if (dem > 1)
            {
                if (CheckConvert(lb_soBan.Text))
                {
                    if (pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString())).Rows[0]["TinhTrang"].ToString() == "True")
                        ban.Ban_Sua(int.Parse(lb_soBan.Text.ToString()), tinhtrang, 0);
                }  
                else
                {
                    //string mangve = pdm.PhieuDatMon_MangVe_TonTai().Rows[0]["MangVe"].ToString();
                    //if (pdm.PhieuDatMon_ChonTai_MangVe(int.Parse(mangve)).Rows[0]["TinhTrang"].ToString() == "True") { }
                }
            }
            else
            {
                //Xóa phiếu đặt món, xóa bàn, xóa CTPDM
                DialogResult dialogResult = MessageBox.Show("Bạn có muốn xóa bàn ?", "Xóa bàn", MessageBoxButtons.YesNo);
                if (dialogResult == DialogResult.Yes)
                {
                    //do something
                    XoaBanPDM();
                }
                else if (dialogResult == DialogResult.No)
                {
                    //do something else

                }
            }
            //--end edit bàn vs CTPDM

            //
            if (CheckConvert(lb_soBan.Text))
            {
                //Nếu bàn đang có người ngồi
                if (tinhtrang == 1)
                {

                    if (pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString())).Rows[0]["TinhTrang"].ToString() == "True")
                        pdm.PhieuDatMon_Sua(lb_pdm.Text.ToString(), lb_MaNV.Text.ToString(), int.Parse(lb_soBan.Text), true, tong, red, sur);
                    else
                        MessageBox.Show("Phiếu đã được xuất!! Gặp người quản lý để thay đổi thông tin.", "Thông báo");
                }
                else
                    pdm.PhieuDatMon_Sua(lb_pdm.Text.ToString(), lb_MaNV.Text.ToString(), int.Parse(lb_soBan.Text), false, tong, red, sur);
            }
            else
            {
                //Cập nhập lại CPDM, khi được chỉnh sửa-- trường hợp InPDM, thanh toán --> thay đổi trạng thái PĐM
                if (tinhtrang == 1) { pdm.PhieuDatMon_Sua(lb_pdm.Text.ToString(), lb_MaNV.Text.ToString(), 1, true, tong, red, sur); }
                else { pdm.PhieuDatMon_Sua(lb_pdm.Text.ToString(), lb_MaNV.Text.ToString(), 1, false, tong, red, sur); }
            }
        }
        

        private void HoaDon_Click(object sender, EventArgs e)
        {
            ////Tạo HĐ
            if (lb_pdm.Text.ToString() == "")
                StatusPDM(1);
            //MessageBox.Show(lb_pdm.Text.ToString() + "-" + lb_MaNV.Text.ToString());
            hd.HoaDon_Them(lb_pdm.Text.ToString(), lb_MaNV.Text.ToString());
            //Nếu chưa tồn tại pdm
            if (CheckConvert(lb_soBan.Text))
            {
                //Chuyển tình trạng bàn
                ban.Ban_Sua(int.Parse(lb_soBan.Text.ToString()), 0, 0);
            }
            MoveDB();
        }


        //Xóa món
        private void BtnXoaMon_Click(object sender, EventArgs e)
        {
            if (dataGridView2.CurrentRow != null && dataGridView2.CurrentRow.Index < dataGridView2.Rows.Count - 1)
            {
                int i = dataGridView2.CurrentRow.Index;
                if(giamon!="")
                TongTien(int.Parse(giamon.ToString()), soluong, 0);
                dataGridView2.Rows.RemoveAt(i);
            }
            else MessageBox.Show("Chọn món cần xóa", "Thông báo");
        }

       

        //Hàm cho xóa phiếu đặt món
        private void XoaBanPDM()
        {
            if (CheckConvert(lb_soBan.Text))
            {
                if (pdm.PhieuDatMon_ChonTai_Ban(int.Parse(lb_soBan.Text.ToString())).Rows[0]["TinhTrang"].ToString() == "True")
                {
                    //Xóa chi tiết phiếu đặt món
                    ctpdm.ChiTietPDM_Xoa(lb_pdm.Text);
                    //Xóa phiếu đặt món
                    pdm.PhieuDatMon_Xoa(lb_pdm.Text);

                    //thay đổi tình trạng bàn
                    ban.Ban_Sua(int.Parse(lb_soBan.Text.ToString()), 0, 0);
                    //Chuyển ra trangchus
                }
                else
                {
                    MessageBox.Show("Phiếu đã được xuất!! Gặp người quản lý để thay đổi thông tin.", "Thông báo");
                }
            }
            else
            {
                //Xóa chi tiết phiếu đặt món
                ctpdm.ChiTietPDM_Xoa(lb_pdm.Text);
                //Xóa phiếu đặt món
                pdm.PhieuDatMon_Xoa(lb_pdm.Text);
            }
            MoveDB();
        }

        private void PDMXoa_Click(object sender, EventArgs e)
        {
            XoaBanPDM();
        }

    }
}
