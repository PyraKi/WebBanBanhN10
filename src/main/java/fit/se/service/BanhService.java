package fit.se.service;

import java.util.List;

import fit.se.model.Banh;

public interface BanhService {
	
	public void themBanh(Banh b);
	
	public void xoaBanh(String maBanh);
	
	public void suaBanh(Banh b);
	
	public Banh timBanh(String maBanh);
	
	public List<Banh> getAllBanh();
	
}
