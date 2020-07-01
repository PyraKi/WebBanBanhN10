package fit.se.session;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import fit.se.bean.GioHang;
import fit.se.model.Banh;
import fit.se.model.ChiTietHoaDon;
import fit.se.model.HoaDon;
import fit.se.model.TaiKhoan;
import fit.se.service.CRUDService;

public class GioHangSession {
	private static CRUDService cr;

	@Autowired
	CRUDService crudService;
	
	@PostConstruct
	public void init() {
		GioHangSession.cr = crudService;
	}

	public static void removeCartInSession(HttpServletRequest request) {
		request.getSession().removeAttribute("cart");
	}
	
	public static GioHang getGioHangInSession(HttpServletRequest request) {
		GioHang gioHang = (GioHang) request.getSession().getAttribute("cart");
		if(gioHang == null) {
			gioHang = new GioHang();
			request.getSession().setAttribute("cart", gioHang);
		}
		return gioHang;
	}
	
	public static boolean thanhToan(GioHang gh, TaiKhoan tk, String hoKH, String tenKH, String soDT, String diaChi, String thanhToan, String soThe) {
		HoaDon df = new HoaDon();
		
		df.setTaiKhoan(tk);
		df.setTenKH(tenKH);
		df.setHoKH(hoKH);
		df.setSoDT(soDT);
		df.setDiaChi(diaChi);
		df.setThanhToan(thanhToan);
		df.setSoThe(soThe);
		df.setNgayLapHD(Date.valueOf(LocalDate.now()));
		df.setTongTien(gh.tong());
		df.setChiTietHoaDons(new ArrayList<ChiTietHoaDon>());
		
//		System.out.println(df);
		cr.themHoaDon(df);
		
		List<ChiTietHoaDon> temp = gh.getChiTietHoaDons();
		temp.forEach(x ->{
			ChiTietHoaDon ct = new ChiTietHoaDon(df, x.getBanh(), x.getSoLuong());
//			System.out.println(ct);
			cr.themChiTietHoaDon(ct);
			Banh b = x.getBanh();
			b.setSoLuong(b.getSoLuong() - x.getSoLuong());
			cr.suaBanh(b);
		});
		
		gh.getChiTietHoaDons().clear();
		
		return true;
	}
}
