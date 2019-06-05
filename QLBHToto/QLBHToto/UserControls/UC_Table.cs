using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;

namespace QLBHToto.UserControls
{
    /*====Note=====
 * Mã bàn có 0: bàn trống; 1: bàn đang có khách; 2: bàn đã được in PĐM; 3: bàn ẩn
 *
 * 
 * 
 * 
 */
    public partial class UC_Table : UserControl
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

        //
        public static bool ktmoveSucess = false;

        public UC_Table()
        {
            InitializeComponent();

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
        private void UC_Table_Load(object sender, EventArgs e)
        {
            int i = 0;
            foreach (Control ctrl in tableLayoutPanel1.Controls)
            {
                if (ctrl is Button && FormTable.Moveban != "")
                {
                    moveban = FormTable.Moveban;
                    movepdm = FormTable.Movepdm;
                    i++;
                    //Text gồm một chuỗi các chữ và số
                    if (i == int.Parse(moveban))
                    {
                        
                        ctrl.BackColor = Color.DarkRed;
                        ctrl.Text = ctrl.Text + Environment.NewLine + "BÀN CHUYỂN";
                        ktmove = true;
                    }

                }

            }
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
                    string text = Environment.NewLine + "BÀN CÒN TRỐNG";
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
                                + "TỔNG TIỀN: " + total.ToString() + " VNĐ";
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
                    if (ktmove)
                    {
                        ban.Ban_Sua(int.Parse(moveban), 0, 0);
                        ban.Ban_Sua(int.Parse(SetMaBan), 1, 0);
                        pdm.PhieuDatMon_Sua_MaBan(movepdm, page);
                        ktmove = false;
                        ktmoveSucess = true;
                    }
                    //Open form 
                    //this.Hide();
                    //FormDashBoard f2 = new FormDashBoard();
                    //f2.ShowDialog(); // Shows Form2
                    //UC_DetailTable dtb = new UC_DetailTable();
                    //f2.AddControlsToPanel(dtb);
                    using (FormTable ftb = new FormTable())
                    {
                        
                        ftb.ShowDialog();

                    }
                }

            }
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
                txt_PageNum.Text = "Trang " + pagenum.ToString() + "/" + ((int)p).ToString();
                ReloadForm(pagenum);
            }


        }

        private void Btn_Left_Click(object sender, EventArgs e)
        {

            pagenum--;
            if (pagenum <= 0)
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
    }
}
