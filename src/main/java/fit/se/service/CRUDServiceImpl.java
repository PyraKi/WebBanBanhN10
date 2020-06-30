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
	@Transactional
	public void themBanh(Banh b) {
		this.cr.themBanh(b);
	}

	@Override
	@Transactional
	public void xoaBanh(int maBanh) {
		this.cr.xoaBanh(maBanh);
	}

	@Override
	@Transactional
	public void suaBanh(Banh b) {
		this.cr.suaBanh(b);
	}

	@Override
	@Transactional
	public List<Banh> timBanh(int maBanh) {
		return this.cr.timBanh(maBanh);
	}

	@Override
	@Transactional
	public List<Banh> getAllBanh() {
		return this.cr.getAllBanh();
	}
	
	@Override
	@Transactional
	public void themTK(TaiKhoan t) {
		this.cr.themTK(t);
	}

	@Override
	@Transactional
	public void xoaTK(int maTK) {
		this.cr.xoaTK(maTK);
	}

	@Override
	@Transactional
	public void SuaTK(TaiKhoan t) {
		this.cr.SuaTK(t);
	}

	@Override
	@Transactional
	public List<TaiKhoan> timTK(int maTK) {
		return this.cr.timTK(maTK);
	}

	@Override
	@Transactional
	public List<TaiKhoan> getAllTK() {
		return this.cr.getAllTK();
	}

	@Override
	@Transactional
	public List<TaiKhoan> getUserbyUsername(String username) {
		return this.cr.getUserbyUsername(username);
	}

	@Override
	@Transactional
	public void themHoaDon(HoaDon hd) {
		this.cr.themHoaDon(hd);
	}

	@Override
	@Transactional
	public void xoaHoaDon(int maHoaDon) {
		this.cr.xoaHoaDon(maHoaDon);
	}

	@Override
	@Transactional
	public void suaHoaDon(HoaDon hd) {
		this.cr.suaHoaDon(hd);
	}

	@Override
	@Transactional
	public HoaDon timHoaDon(int maHoaDon) {
		return this.cr.timHoaDon(maHoaDon);
	}

	@Override
	@Transactional
	public List<HoaDon> getAllHoaDon() {
		return this.cr.getAllHoaDon();
	}

	@Override
	@Transactional
	public void themChiTietHoaDon(ChiTietHoaDon ct) {
		this.cr.themChiTietHoaDon(ct);
	}

	@Override
	@Transactional
	public void xoaChiTietHoaDon(int maChiTietHoaDon) {
		this.cr.xoaChiTietHoaDon(maChiTietHoaDon);
	}

	@Override
	@Transactional
	public void suaChiTietHoaDon(ChiTietHoaDon ct) {
		this.cr.suaChiTietHoaDon(ct);
	}

}
