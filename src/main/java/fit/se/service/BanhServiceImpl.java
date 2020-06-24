package fit.se.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fit.se.dao.BanhDAO;
import fit.se.model.Banh;

@Service
public class BanhServiceImpl implements BanhService{

	private BanhDAO banhDAO;

	public void setBanhDAO(BanhDAO banhDAO) {
		this.banhDAO = banhDAO;
	}

	@Override
	@Transactional
	public void themBanh(Banh b) {
		this.banhDAO.themBanh(b);
	}

	@Override
	@Transactional
	public void xoaBanh(String maBanh) {
		this.banhDAO.xoaBanh(maBanh);
	}

	@Override
	@Transactional
	public void suaBanh(Banh b) {
		this.suaBanh(b);
	}

	@Override
	@Transactional
	public Banh timBanh(String maBanh) {
		return this.banhDAO.timBanh(maBanh);
	}

	@Override
	@Transactional
	public List<Banh> getAllBanh() {
		return this.banhDAO.getAllBanh();
	}
	
	
}
