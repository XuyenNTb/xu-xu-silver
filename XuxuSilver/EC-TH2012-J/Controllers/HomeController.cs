using WebNhaHangOnline.Models;
using log4net;
using VNPAY_CS_ASPX;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using System.Configuration;

namespace WebNhaHangOnline.Controllers
{
    public class HomeController : Controller
    {
        private static readonly ILog log =
         LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private static WebGiayHangHieuEntities db = new WebGiayHangHieuEntities();

        public static List<Thanhviennhom> Ds_Group;
        public ActionResult Index()
        {
            ManagerObiect.getIntance();
            var countGioHang = ManagerObiect.getIntance().giohang.getGiohang().Count;
            for (int index = 0; index < countGioHang; index++)
            {
                ManagerObiect.getIntance().giohang.removeCart(index);
            }
            ManagerObiect.getIntance().giohang.removeCart(0);
            ManagerObiect.getIntance().giohang.removeCart(1);
            ManagerObiect.getIntance().giohang.removeCart(2);
            ManagerObiect.getIntance().giohang.removeCart(3);
            ManagerObiect.getIntance().giohang.removeCart(4);
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
        public ActionResult _VNPAYReturn()
        {
            return View();
        }

        public JsonResult _VNPAYReturns(Donhangtongquan dh)
        {

            if (User.Identity.IsAuthenticated)
            {
                DonhangKHModel dhmodel = new DonhangKHModel();
                dhmodel.Luudonhang(dh, User.Identity.GetUserId(), ManagerObiect.getIntance().giohang, true);
                var countGioHang = ManagerObiect.getIntance().giohang.getGiohang().Count;
                for (int index = 0; index < countGioHang; index++)
                {
                    ManagerObiect.getIntance().giohang.removeCart(index);
                }
                ManagerObiect.getIntance().giohang.removeCart(0);
                ManagerObiect.getIntance().giohang.removeCart(1);
                ManagerObiect.getIntance().giohang.removeCart(2);
                ManagerObiect.getIntance().giohang.removeCart(3);
                ManagerObiect.getIntance().giohang.removeCart(4);
                return Json("MuaHangThanhCong", JsonRequestBehavior.AllowGet);
            }
            else
            {
                DonhangKHModel dhmodel = new DonhangKHModel();
                dhmodel.Luudonhang_(dh, ManagerObiect.getIntance().giohang, true);
                var countGioHang = ManagerObiect.getIntance().giohang.getGiohang().Count;
                for (int index = 0; index < countGioHang; index++)
                {
                    ManagerObiect.getIntance().giohang.removeCart(index);
                }
                ManagerObiect.getIntance().giohang.removeCart(0);
                ManagerObiect.getIntance().giohang.removeCart(1);
                ManagerObiect.getIntance().giohang.removeCart(2);
                ManagerObiect.getIntance().giohang.removeCart(3);
                ManagerObiect.getIntance().giohang.removeCart(4);
                return Json("MuaHangThanhCong_", JsonRequestBehavior.AllowGet);
                //return RedirectToAction("Checkout", "Home");
            }
        }

        public ActionResult GetUrl()
        {
            string vnp_Returnurl = ConfigurationManager.AppSettings["vnp_Returnurl"]; //URL nhan ket qua tra ve 
            string vnp_Url = ConfigurationManager.AppSettings["vnp_Url"]; //URL thanh toan cua VNPAY 
            string vnp_TmnCode = ConfigurationManager.AppSettings["vnp_TmnCode"]; //Ma website
            string vnp_HashSecret = ConfigurationManager.AppSettings["vnp_HashSecret"]; //Chuoi bi mat

            //Get payment input
            OrderInfo order = new OrderInfo();
            //Save order to db
            order.OrderId = DateTime.Now.Ticks;
            order.Amount = Convert.ToDecimal(Request.QueryString["Amount"]);
            order.OrderDescription = Request.QueryString["OrderDescription"];
            order.CreatedDate = DateTime.Now;

            //Build URL for VNPAY
            VnPayLibrary vnpay = new VnPayLibrary();

            vnpay.AddRequestData("vnp_Version", "2.0.0");
            vnpay.AddRequestData("vnp_Command", "pay");
            vnpay.AddRequestData("vnp_TmnCode", vnp_TmnCode);
            //vnpay.AddRequestData("vnp_SecureHashType", "SHA256");

            string locale = "vn";//"en"
            if (!string.IsNullOrEmpty(locale))
            {
                vnpay.AddRequestData("vnp_Locale", locale);
            }
            else
            {
                vnpay.AddRequestData("vnp_Locale", "vn");
            }

            vnpay.AddRequestData("vnp_CurrCode", "VND");
            vnpay.AddRequestData("vnp_TxnRef", order.OrderId.ToString());
            vnpay.AddRequestData("vnp_OrderInfo", order.OrderDescription);
            vnpay.AddRequestData("vnp_OrderType", "insurance"); //default value: other
            vnpay.AddRequestData("vnp_Amount", (order.Amount * 100).ToString());
            vnpay.AddRequestData("vnp_ReturnUrl", vnp_Returnurl);
            vnpay.AddRequestData("vnp_IpAddr", GetIpAddress());
            vnpay.AddRequestData("vnp_CreateDate", order.CreatedDate.ToString("yyyyMMddHHmmss"));
            //if (bank.SelectedItem != null && !string.IsNullOrEmpty(bank.SelectedItem.Value))
            //{
            //    vnpay.AddRequestData("vnp_BankCode", bank.SelectedItem.Value);
            //}
            string paymentUrl = vnpay.CreateRequestUrl(vnp_Url, vnp_HashSecret);
            log.InfoFormat("VNPAY URL: {0}", paymentUrl);

            Response.Clear();
            Response.Write("{\"code\":\"00\",\"Message\":\"Confirm Success\",\"data\":\"" + paymentUrl + "\"}");

            Response.End();
            return View();
        }

        public string GetIpAddress()
        {
            string ipAddress;
            try
            {
                ipAddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (string.IsNullOrEmpty(ipAddress) || (ipAddress.ToLower() == "unknown"))
                    ipAddress = Request.ServerVariables["REMOTE_ADDR"];
            }
            catch (Exception ex)
            {
                ipAddress = "Invalid IP:" + ex.Message;
            }

            return ipAddress;
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Thongtinnhom()
        {
            if (Ds_Group == null)
            {
                Ds_Group = new List<Thanhviennhom>();
                Ds_Group.Add(new Thanhviennhom
                {
                    MSSV = "B16DCCN138",
                    Hoten = "Nguyễn Sỹ Hiệp",
                    LinkFacebook = "https://www.facebook.com/hjep.nguyen.792"
                });
                Ds_Group.Add(new Thanhviennhom
                {
                    MSSV = "B16DCCN",
                    Hoten = "Nguyễn Văn Thắng",
                    LinkFacebook = "https://www.facebook.com/hjep.nguyen.792"
                });
                Ds_Group.Add(new Thanhviennhom
                {
                    MSSV = "B16DCCN",
                    Hoten = "Ngô Trường Giang",
                    LinkFacebook = "https://www.facebook.com/hjep.nguyen.792"
                });
                Ds_Group.Add(new Thanhviennhom
                {
                    MSSV = "B16DCCN",
                    Hoten = "Dương Thị Mơ",
                    LinkFacebook = "https://www.facebook.com/hjep.nguyen.792"
                });
                Ds_Group.Add(new Thanhviennhom
                {
                    MSSV = "B16DCCN",
                    Hoten = "Nguyễn Quang Linh",
                    LinkFacebook = "https://www.facebook.com/hjep.nguyen.792"
                });
            }
            return View(Ds_Group);
        }
        
        public ActionResult Cart()
        {
            return View(ManagerObiect.getIntance().giohang);
        }

        [AuthLog(Roles = "Quản trị viên,Nhân viên,Khách hàng")]
        //Đơn hàng
        public ActionResult Xemdonhang(string maKH)
        {
            List<DonhangKHModel> temp = new List<DonhangKHModel>();
            if (maKH.Length != 0)
            {
                DonhangKHModel dh = new DonhangKHModel();
                temp = dh.Xemdonhang(maKH);
            }
            return View(temp);
        }

        [AuthLog(Roles = "Quản trị viên,Nhân viên,Khách hàng")]
        public ActionResult Huydonhang(string maDH)
        {
            DonhangKHModel dh = new DonhangKHModel();
            dh.HuyDH(maDH);
            var donhang = dh.Xemdonhang(User.Identity.GetUserId());
            return View(donhang);
        }
        public ActionResult Checkout()
        {
            if (Request.IsAuthenticated)
            {
                DonhangKHModel dh = new DonhangKHModel();
                dh.nguoiMua = dh.Xemttnguoidung(User.Identity.GetUserId());
                Donhangtongquan dhtq = new Donhangtongquan()
                {
                    buyer = dh.nguoiMua.HoTen,
                    seller = dh.nguoiMua.HoTen,
                    phoneNumber = dh.nguoiMua.PhoneNumber,
                    address = dh.nguoiMua.DiaChi
                };
                return View(dhtq);
            }
            else
            {
                //DonhangKHModel dh = new DonhangKHModel();
                //dh.nguoiMua = dh.Xemttnguoidung(User.Identity.GetUserId());
                //Donhangtongquan dhtq = new Donhangtongquan()
                //{
                //    buyer = "",
                //    seller = "",
                //    phoneNumber = "",
                //    address = ""
                //};
                return View();

                //return RedirectToAction("Authentication", "Account", new { returnUrl = "/Home/Checkout" });
            }
        }

        [AuthLog(Roles = "Quản trị viên,Nhân viên,Khách hàng")]
        [HttpPost]
        [AllowAnonymous]
        public ActionResult Checkout(Donhangtongquan dh)
        {
            if (User.Identity.IsAuthenticated)
            {
                DonhangKHModel dhmodel = new DonhangKHModel();
                dhmodel.Luudonhang(dh, User.Identity.GetUserId(), ManagerObiect.getIntance().giohang);
                var countGioHang = ManagerObiect.getIntance().giohang.getGiohang().Count;
                for (int index = 0; index < countGioHang; index++)
                {
                    ManagerObiect.getIntance().giohang.removeCart(index);
                }
                ManagerObiect.getIntance().giohang.removeCart(0);
                ManagerObiect.getIntance().giohang.removeCart(1);
                ManagerObiect.getIntance().giohang.removeCart(2);
                ManagerObiect.getIntance().giohang.removeCart(3);
                ManagerObiect.getIntance().giohang.removeCart(4);
                return RedirectToAction("MuaHangThanhCong", "Home");
            }
            else
            {
                DonhangKHModel dhmodel = new DonhangKHModel();
                dhmodel.Luudonhang_(dh, ManagerObiect.getIntance().giohang);
                var countGioHang = ManagerObiect.getIntance().giohang.getGiohang().Count;
                for (int index = 0; index < countGioHang; index++)
                {
                    ManagerObiect.getIntance().giohang.removeCart(index);
                }
                ManagerObiect.getIntance().giohang.removeCart(0);
                ManagerObiect.getIntance().giohang.removeCart(1);
                ManagerObiect.getIntance().giohang.removeCart(2);
                ManagerObiect.getIntance().giohang.removeCart(3);
                ManagerObiect.getIntance().giohang.removeCart(4);
                return RedirectToAction("MuaHangThanhCong_", "Home");
                //return RedirectToAction("Checkout", "Home");
            }
        }

        public ActionResult MuaHangThanhCong_()
        {      
            return View();
        }

        public ActionResult MuaHangThanhCong()
        {
            var userName = User.Identity.Name;        
            using (WebGiayHangHieuEntities db = new WebGiayHangHieuEntities())
            {
                var listUsers_ = db.AspNetUsers.Where(x => x.UserName == userName).ToList();
                var IdUser_ = listUsers_[0].Id;

                var PointUser = listUsers_[0].AccessFailedCount;
                ViewBag.PointUser = PointUser;
            }
            return View();
        }




        public ActionResult MainMenu()
        {
            MainMenuModel mnmodel = new MainMenuModel();
            var menulist = mnmodel.GetMenuList();
            return PartialView("_MainMenuPartial", menulist);
        }

        public ActionResult SPNoiBat(int? skip)
        {
            SanPhamModel sp = new SanPhamModel();
            int skipnum = (skip ?? 0);
            IQueryable<SanPham> splist = sp.SPHot();
            splist = splist.OrderBy(r => r.MaSP).Skip(skipnum).Take(4);
            if (splist.Any())
                return PartialView("_ProductTabLoadMorePartial", splist);
            else
                return null;
        }

        public ActionResult SPMoiNhap(int? skip)
        {
            SanPhamModel sp = new SanPhamModel();
            int skipnum = (skip ?? 0);
            IQueryable<SanPham> splist = sp.SPMoiNhap();
            splist = splist.OrderBy(r => r.MaSP).Skip(skipnum).Take(4);
            if (splist.Any())
                return PartialView("_ProductTabLoadMorePartial", splist);
            else
                return null;
        }

        public ActionResult SPKhuyenMai(int? skip)
        {
            SanPhamModel sp = new SanPhamModel();
            int skipnum = (skip ?? 0);
            IQueryable<SanPham> splist = sp.SPKhuyenMai();
            splist = splist.OrderBy(r => r.MaSP).Skip(skipnum).Take(4);
            if (splist.Any())
                return PartialView("_ProductTabLoadMorePartial", splist);
            else
                return null;
        }

        public ActionResult SPBanChay()
        {
            SanPhamModel sp = new SanPhamModel();
            IQueryable<SanPham> splist = sp.SPBanChay(7);      
            if (splist.Any())
                return PartialView("_BestSellerPartial", splist.ToList());
            else
                return null;
        }
        public ActionResult SPMoiXem()
        {
            return PartialView("_RecentlyViewPartial", ManagerObiect.getIntance().Laydanhsachsanphammoixem());
        }

    }
}