package fit.se.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.context.annotation.ScopedProxyMode;

import fit.se.model.Banh;
import fit.se.model.ChiTietHoaDon;
import fit.se.model.HoaDon;
import fit.se.model.TaiKhoan;
import fit.se.repository.CRUDRepository;

@Service
@Scope(proxyMode = ScopedProxyMode.INTERFACES)
@Transactional
public class CRUDServiceImpl implements CRUDService {
	
	@Autowired
	CRUDRepository cr;


	@Override
	public void themBanh(Banh b) {
		this.cr.themBanh(b);
	}

	@Override
	public void xoaBanh(int maBanh) {
		this.cr.xoaBanh(maBanh);
	}

	@Override
	public void suaBanh(Banh b) {
		this.suaBanh(b);
	}

	@Override
	public Banh timBanh(int maBanh) {
		return this.cr.timBanh(maBanh);
	}

	@Override
	public List<Banh> getAllBanh() {
		return this.cr.getAllBanh();
	}
	
	@Override
	public void themTK(TaiKhoan t) {
		this.cr.themTK(t);
	}

	@Override
	public void xoaTK(int maTK) {
		this.cr.xoaTK(maTK);
	}

	@Override
	public void SuaTK(TaiKhoan t) {
		this.cr.SuaTK(t);
	}

	@Override
	public TaiKhoan timTK(int maTK) {
		return cr.timTK(maTK);
	}

	@Override
	public List<TaiKhoan> getAllTK() {
		return this.cr.getAllTK();
	}

	@Override
	public List<TaiKhoan> getUserbyUsername(String username) {
		return this.cr.getUserbyUsername(username);
	}

	@Override
	public void themHoaDon(HoaDon hd) {
		this.cr.themHoaDon(hd);
	}

	@Override
	public void xoaHoaDon(int maHoaDon) {
		this.cr.xoaHoaDon(maHoaDon);
	}

	@Override
	public void suaHoaDon(HoaDon hd) {
		this.cr.suaHoaDon(hd);
	}

	@Override
	public HoaDon timHoaDon(int maHoaDon) {
		return this.cr.timHoaDon(maHoaDon);
	}

	@Override
	public List<HoaDon> getAllHoaDon() {
		return this.cr.getAllHoaDon();
	}

	@Override
	public void themChiTietHoaDon(ChiTietHoaDon ct) {
		this.cr.themChiTietHoaDon(ct);
	}

	@Override
	public void xoaChiTietHoaDon(int maChiTietHoaDon) {
		this.cr.xoaChiTietHoaDon(maChiTietHoaDon);
	}

	@Override
	public void suaChiTietHoaDon(ChiTietHoaDon ct) {
		this.cr.suaChiTietHoaDon(ct);
	}

}
