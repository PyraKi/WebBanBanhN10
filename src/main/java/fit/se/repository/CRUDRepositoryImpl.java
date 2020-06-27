package fit.se.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import fit.se.model.Banh;
import fit.se.model.ChiTietHoaDon;
import fit.se.model.HoaDon;
import fit.se.model.TaiKhoan;

@Repository
public class CRUDRepositoryImpl implements CRUDRepository {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public void themBanh(Banh b) {
		 em.persist(b);
	}

	@Override
	public void xoaBanh(int maBanh) {
		em.remove(em.find(Banh.class, maBanh));
	}

	@Override
	public void suaBanh(Banh b) {
		em.detach(b);
		em.merge(b);
	}

	@Override
	public Banh timBanh(int maBanh) {
		return em.find(Banh.class, maBanh);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Banh> getAllBanh() {
		return em.createNamedQuery("getAllBanh").getResultList();
	}
	
	@Override
	public void themTK(TaiKhoan t) {
		em.persist(t);
	}

	@Override
	public void xoaTK(int maTK) {
		em.remove(em.find(TaiKhoan.class, maTK));
	}

	@Override
	public void SuaTK(TaiKhoan t) {
		em.detach(t);
		em.merge(t);
	}

	@Override
	public TaiKhoan timTK(int maTK) {
		return em.find(TaiKhoan.class, maTK);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TaiKhoan> getAllTK() {
		return em.createNamedQuery("getAllTaiKhoan").getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TaiKhoan> getUserbyUsername(String username) {
		return em.createNamedQuery("getUserTaiKhoanByName").setParameter("ma", username).getResultList();
	}

	@Override
	public void themHoaDon(HoaDon hd) {
		em.persist(hd);
	}

	@Override
	public void xoaHoaDon(int maHoaDon) {
		em.remove(em.find(HoaDon.class, maHoaDon));
	}

	@Override
	public void suaHoaDon(HoaDon hd) {
		em.detach(hd);
		em.merge(hd);
	}

	@Override
	public HoaDon timHoaDon(int maHoaDon) {
		return em.find(HoaDon.class, maHoaDon);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HoaDon> getAllHoaDon() {
		return em.createNamedQuery("getAllHoaDon").getResultList();
	}

	@Override
	public void themChiTietHoaDon(ChiTietHoaDon ct) {
		 em.createNativeQuery("insert into CHITIETDONHANG(MABANH, MADH, SOLUONG) values(?,?,?)")
	     	.setParameter(1, ct.getBanh().getMaBanh())
	     	.setParameter(2, ct.getHoaDon().getMaHD())
	     	.setParameter(3, ct.getSoLuong())
	     	.executeUpdate();
	}

	@Override
	public void xoaChiTietHoaDon(int maChiTietHoaDon) {
		em.remove(em.find(ChiTietHoaDon.class, maChiTietHoaDon));
	}

	@Override
	public void suaChiTietHoaDon(ChiTietHoaDon ct) {
		em.detach(ct);
		em.merge(ct);
	}

}
