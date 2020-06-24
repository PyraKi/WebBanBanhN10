package fit.se.dao;

import java.util.List;

import fit.se.model.Banh;

public interface BanhDAO {
	
	public void themBanh(Banh b);
	
	public void xoaBanh(String maBanh);
	
	public void suaBanh(Banh b);
	
	public Banh timBanh(String maBanh);
	
	public List<Banh> getAllBanh();
	
}
