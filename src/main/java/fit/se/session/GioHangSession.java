package fit.se.session;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import fit.se.bean.GioHang;
import fit.se.model.ChiTietHoaDon;
import fit.se.model.HoaDon;
import fit.se.service.CRUDService;

public class GioHangSession {
	private static CRUDService cr;

	@Autowired()
	CRUDService crudService;

	@PostConstruct
	public void setKhoanService() {
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
		System.out.println(gioHang);
		return gioHang;
	}
	
	public static boolean thanhToan(GioHang gh, int maKH, String hoKH, String tenKH, String soDT, String diaChi, String thanhToan) {
		List<ChiTietHoaDon> dsCTHD = new ArrayList<ChiTietHoaDon>();

		HoaDon df = new HoaDon(null, cr.timTK(maKH), tenKH, hoKH, soDT, diaChi, thanhToan, Date.valueOf(LocalDate.now()), gh.tong());
		List<ChiTietHoaDon> temp = gh.getChiTietHoaDons();

		temp.forEach(x ->{
			dsCTHD.add(new ChiTietHoaDon(df, x.getBanh(), x.getSoLuong()));
		});
		
		
		for(ChiTietHoaDon x : temp) {
			ChiTietHoaDon ct = new ChiTietHoaDon(df, x.getBanh(), x.getSoLuong());
			cr.themChiTietHoaDon(ct);
		};
		gh.getChiTietHoaDons().clear();
		
		return true;
	}
}
