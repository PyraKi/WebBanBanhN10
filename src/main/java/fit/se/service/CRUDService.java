package fit.se.service;

import java.util.List;

import fit.se.model.Banh;
import fit.se.model.TaiKhoan;

public interface CRUDService {
	
	public void themBanh(Banh b);

	public void xoaBanh(String maBanh);

	public void suaBanh(Banh b);

	public Banh timBanh(String maBanh);

	public List<Banh> getAllBanh();

	public void themTK(TaiKhoan t);

	public void xoaTK(String maTK);

	public void SuaTK(TaiKhoan t);

	public TaiKhoan timTK(String maTK);

	public List<TaiKhoan> getAllTK();

	public List<TaiKhoan> getUserbyUsername(String username);
}
