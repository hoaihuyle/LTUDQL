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
/*====Note=====
 * Mã bàn có 0: bàn trống; 1: bàn đang có khách; 2: bàn đã được in PĐM; 3: bàn ẩn
 *
 * 
 * 
 * 
 */
namespace QLBHToto
{
    
    public partial class TrangChu : Form
    {
        //Nghiệp vụ chuyển bàn
        string moveban = "";
        string movepdm = "";

        public static string SetMaBan = "";
        DataTable dt;
        Ban_BLL ban = new Ban_BLL();
        PhieuDatMon_BLL pdm = new PhieuDatMon_BLL();
        int rowCount = 5;
        int columnCount = 5;
        static int pagenum = 1;
        double p = 0;
        bool ktmove = false;
        public static bool ktmoveSucess=false;
        public TrangChu()
        {

            ////Temp form 1
            //InitializeComponent();
            //this.FormBorderStyle = FormBorderStyle.FixedDialog;

            //// Set the MaximizeBox to false to remove the maximize box.
            //this.MaximizeBox = false;

            //// Set the MinimizeBox to false to remove the minimize box.
            //this.MinimizeBox = false;

            //// Set the start position of the form to the center of the screen.
            //this.StartPosition = FormStartPosition.CenterScreen;


            //Teamp form 2
            InitializeComponent();
            this.TopMost = true;
            this.FormBorderStyle = FormBorderStyle.SizableToolWindow;//.None; 
            this.FormBorderStyle = FormBorderStyle.Fixed3D;
            this.WindowState = FormWindowState.Maximized;

            ////Color
            SplitterPanel leftPanel = splitContainer1.Panel1;
            leftPanel.BackColor = Color.DarkSlateGray;
            leftPanel.ForeColor = Color.Blue;

            SplitterPanel rightPanel = splitContainer1.Panel2;
            rightPanel.BackColor = Color.DarkGray;
            rightPanel.ForeColor = Color.White;

            // Đưa mấy cái mà load bàn vào 1 hàm rồi 

            this.tableLayoutPanel1.ColumnCount = columnCount;
            this.tableLayoutPanel1.RowCount = rowCount;

            this.tableLayoutPanel1.ColumnStyles.Clear();
            this.tableLayoutPanel1.RowStyles.Clear();

            this.tableLayoutPanel1.Dock = DockStyle.Fill;

            double tcell = rowCount * columnCount;

            //Tính tổng trang
            if (ban.Ban_Select().Rows.Count % tcell == 0)
            {
                p = ban.Ban_Select().Rows.Count / tcell;//Tổng trang
            }
            else
            {
                p = ban.Ban_Select().Rows.Count / tcell + 1;//Tổng trang
            }
            txt_PageNum.Text = "Trang " + pagenum.ToString() + "/" + ((int)p).ToString();

            //Tạo bàn
            for (int i = 0; i < columnCount; i++)
            {
                this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 100 / columnCount));
            }
            for (int i = 0; i < rowCount; i++)
            {
                this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100 / rowCount));
            }
            handle_button();
        }

        private void handle_button()
        {
            for (int i = 0; i < rowCount * columnCount; i++)
            {
                var b = new Button();
                //Biến page muốn truyền
                int page = i + 1 + (rowCount * columnCount) * (pagenum - 1);
                dt = ban.Ban_ChonTai(page);
                //Create button in tableLayoutPanel1
                if (dt.Rows.Count > 0)
                {
                    string text = Environment.NewLine  + "BÀN CÒN TRỐNG";                    
                    b.Name = string.Format("b_{0}", page);
                    b.BackColor = Color.Chocolate;

                    bool kt = false;
                    //Bàn có người
                    if (int.Parse(dt.Rows[0]["TinhTrang"].ToString()) == 1)
                    {
                        b.BackColor = Color.Green;

                        kt = true;
                    }

                     //Bàn đã được in
                    if (int.Parse(dt.Rows[0]["TinhTrang"].ToString()) == 2)
                    {
                        b.BackColor = Color.DarkBlue;
                        kt = true;
                    }

                    if (kt)
                    {
                        //Đọc thông tin phiếu đặt món
                        //Hien thị giờ lập, tổng tiền
                        DataTable dt2 = pdm.PhieuDatMon_ChonTai_Ban(page);
                        if (dt2.Rows[0]["NgayLap"] != null)
                        {
                            //Tính tổng tiền
                            double total = double.Parse(dt2.Rows[0]["ThanhTien"].ToString()) 
                                - (double.Parse(dt2.Rows[0]["GiamGia"].ToString()) * double.Parse(dt2.Rows[0]["ThanhTien"].ToString()) / 100) 
                                + double.Parse(dt2.Rows[0]["PhuThu"].ToString());
                            //Ép kiểu 
                            DateTime tempDate = Convert.ToDateTime(dt2.Rows[0]["NgayLap"].ToString());
                            //Lưu dữ liệu
                            text = Environment.NewLine 
                                + "GIỜ GỌI MÓN: " + tempDate.ToString("HH:mm:ss").ToUpper() 
                                + Environment.NewLine + Environment.NewLine 
                                + "TỔNG TIỀN: "+ total.ToString() +" VNĐ";
                        }
                    }

                    b.Text = "BÀN SỐ " + page.ToString() + Environment.NewLine + text;
                    //Sự kiện tạo ra
                    //b.Click += b_Click;
                    b.Click += delegate (object sender, EventArgs e) { b_Click(sender, e, page); };
                    b.Dock = DockStyle.Fill;
                    this.tableLayoutPanel1.Controls.Add(b);
                }
                else return;


            }
               
            //Tạo nút
            void b_Click(object sender, EventArgs e, int page)
            {
                var b = sender as Button;
                if (b != null)
                {
                    // Nhận biến truyền page
                    SetMaBan = page.ToString();
                    if(ktmove)
                    {
                        //Chưa xong-- khi chuyển bàn xong thì form chưa reload lại thuộc tính nút
                        ban.Ban_Sua(int.Parse(moveban), 0, 0);
                        ban.Ban_Sua(int.Parse(SetMaBan), 1, 0);
                        pdm.PhieuDatMon_Sua_MaBan(movepdm, page);
                        ktmove = false;
                        ktmoveSucess = true;
                    }
                    //Open form 
                    this.Hide();
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

        private void Trangchu_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (DangNhap.SetPassword == "" && DangNhap.SetUsername == "")
            {
                Application.Exit();
            }

            if (DangNhap.SetPassword != "" && DangNhap.SetUsername != "")
            { 
                if (MessageBox.Show("Thoát chương trình, đồng nghĩa với việc đăng xuất ?", "Thông báo", MessageBoxButtons.OKCancel) != System.Windows.Forms.DialogResult.OK)
                {

                    e.Cancel = true;

                }
            }
               
            //if (DangNhap.SetPassword != "" && DangNhap.SetUsername != "")
            //{
            //    MessageBox.Show("Đăng xuất để thoát");
            //    this.Hide();
            //    TrangChu home = new TrangChu();
            //    home.ShowDialog();
            //    this.Show();
            //}
        }

        private void Btn_Right_Click(object sender, EventArgs e)
        {
           
            pagenum++;
            //MessageBox.Show(p.ToString()).ToString();
            if (pagenum > p)//trang hiện tại lớn hơn Tổng trang
            {

                pagenum = (int)p;

            }
            else
            {
                txt_PageNum.Text = "Trang " + pagenum.ToString()+"/" + ((int)p).ToString();
                ReloadForm(pagenum);
            }


        }

        private void Btn_Left_Click(object sender, EventArgs e)
        {
           
            pagenum--;
            if(pagenum <=0)
            {
                pagenum = 1;
            }
            else
            {
                txt_PageNum.Text = "Trang " + pagenum.ToString() + "/" + ((int)p).ToString();
                ReloadForm(pagenum);
                
            }
           


        }

        private void ReloadForm(int num)
        {
            //bool kt = true;
            foreach (Control ctrl in this.tableLayoutPanel1.Controls)
            {
                ctrl.Dispose();
            }
            this.tableLayoutPanel1.Controls.Clear();
            handle_button();
        }

        private void TrangChu_Load(object sender, EventArgs e)
        {
            int i = 0;
            foreach (Control ctrl in tableLayoutPanel1.Controls)
            {
                if (ctrl is Button && QuanLyNghiepVuBan.Moveban != "")
                {
                    moveban = QuanLyNghiepVuBan.Moveban;
                    movepdm = QuanLyNghiepVuBan.Movepdm;
                    i++;
                    //Text gồm một chuỗi các chữ và số
                    if (i == int.Parse(moveban))
                    {   if (ktmoveSucess) return;
                        ctrl.BackColor = Color.DarkRed;
                        ctrl.Text = ctrl.Text + Environment.NewLine + "BÀN CHUYỂN";
                        ktmove = true;
                    }
                    
                }
               
            }
        }

        private void TableLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {
          
        }

        private void Btn_home_Click(object sender, EventArgs e)
        {
            

        }

        private void Btn_accout_Click(object sender, EventArgs e)
        {
            this.Hide();
            TaiKhoan f2 = new TaiKhoan();
            f2.ShowDialog(); // Shows Form2
        }

        private void Btn_admin_Click(object sender, EventArgs e)
        {
            this.Hide();
            QuanLy f2 = new QuanLy();
            f2.ShowDialog(); // Shows Form2
        }


        private void Btn_logout_Click(object sender, EventArgs e)
        {
            DangNhap.SetUsername = "";
            DangNhap.SetPassword = "";
            this.Close();
        }

     
    }
}
