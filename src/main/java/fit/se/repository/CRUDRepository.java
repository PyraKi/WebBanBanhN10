package fit.se.repository;

import java.util.List;

import fit.se.model.Banh;
import fit.se.model.ChiTietHoaDon;
import fit.se.model.HoaDon;
import fit.se.model.TaiKhoan;

public interface CRUDRepository {

	public void themBanh(Banh b);
	
	public void xoaBanh(int maBanh);
	
	public void suaBanh(Banh b);
	
	public List<Banh> timBanh(int maBanh);
	
	public List<Banh> getAllBanh();
	
	public void themTK(TaiKhoan t);
	
	public void xoaTK(int maTK);
	
	public void SuaTK(TaiKhoan t);
	
	public List<TaiKhoan> timTK(int maTK);
	
	public List<TaiKhoan> getAllTK();
	
	public List<TaiKhoan> getUserbyUsername(String username);
	
	public void themHoaDon(HoaDon hd);
	
	public void xoaHoaDon(int maHoaDon);
	
	public void suaHoaDon(HoaDon hd);
	
	public HoaDon timHoaDon(int maHoaDon);
	
	public List<HoaDon> getAllHoaDon();
	
	public void themChiTietHoaDon(ChiTietHoaDon ct);
	
	public void xoaChiTietHoaDon(int maChiTietHoaDon);
	
	public void suaChiTietHoaDon(ChiTietHoaDon ct);
	
}
