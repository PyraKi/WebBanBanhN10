package fit.se.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import fit.se.model.Banh;
import fit.se.model.TaiKhoan;
import fit.se.repository.CRUDRepository;

public class CRUDServiceImpl implements CRUDService {
	
	private CRUDRepository cr;

	public void setCRUDRepository(CRUDRepository cr) {
		this.cr = cr;
	}

	@Override
	@Transactional
	public void themBanh(Banh b) {
		this.cr.themBanh(b);
	}

	@Override
	@Transactional
	public void xoaBanh(String maBanh) {
		this.cr.xoaBanh(maBanh);
	}

	@Override
	@Transactional
	public void suaBanh(Banh b) {
		this.suaBanh(b);
	}

	@Override
	@Transactional
	public Banh timBanh(String maBanh) {
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
	public void xoaTK(String maTK) {
		this.cr.xoaTK(maTK);
	}

	@Override
	@Transactional
	public void SuaTK(TaiKhoan t) {
		this.cr.SuaTK(t);
	}

	@Override
	@Transactional
	public TaiKhoan timTK(String maTK) {
		return cr.timTK(maTK);
	}

	@Override
	@Transactional
	public List<TaiKhoan> getAllTK() {
		return this.cr.getAllTK();
	}

	@Override
	@Transactional
	public List<TaiKhoan> getUserbyUsername(String username) {
		return this.getUserbyUsername(username);
	}
}
