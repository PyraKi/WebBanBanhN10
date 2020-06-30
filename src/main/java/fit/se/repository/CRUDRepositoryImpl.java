package fit.se.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

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
	@Transactional
	public void themBanh(Banh b) {
		em.persist(b);
	}

	@Override
	@Transactional
	public void xoaBanh(int maBanh) {
		em.remove(em.find(Banh.class, maBanh));
	}

	@Override
	@Transactional
	public void suaBanh(Banh b) {
		em.detach(b);
		em.merge(b);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Banh> timBanh(int maBanh) {
		return em.createNamedQuery("getBanhByMaBanh").setParameter("ma", maBanh).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Banh> getAllBanh() {
		return em.createNamedQuery("getAllBanh").getResultList();
	}

	@Override
	@Transactional
	public void themTK(TaiKhoan t) {
		em.persist(t);
	}

	@Override
	@Transactional
	public void xoaTK(int maTK) {
		em.remove(em.find(TaiKhoan.class, maTK));
	}

	@Override
	@Transactional
	public void SuaTK(TaiKhoan t) {
		em.detach(t);
		em.merge(t);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<TaiKhoan> timTK(int maTK) {
		return em.createNamedQuery("getTaiKhoanByMa").setParameter("id", maTK).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<TaiKhoan> getAllTK() {
		return em.createNamedQuery("getAllTaiKhoan").getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<TaiKhoan> getUserbyUsername(String username) {
		return em.createNamedQuery("getTaiKhoanByName").setParameter("ma", username).getResultList();
	}

	@Override
	@Transactional
	public void themHoaDon(HoaDon hd) {
		em.persist(hd);
		em.flush();
	}

	@Override
	@Transactional
	public void xoaHoaDon(int maHoaDon) {
		em.remove(em.find(HoaDon.class, maHoaDon));
	}

	@Override
	@Transactional
	public void suaHoaDon(HoaDon hd) {
		em.detach(hd);
		em.merge(hd);
	}

	@Override
	@Transactional
	public HoaDon timHoaDon(int maHoaDon) {
		return em.find(HoaDon.class, maHoaDon);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<HoaDon> getAllHoaDon() {
		return em.createNamedQuery("getAllHoaDon").getResultList();
	}

	@Override
	@Transactional
	public void themChiTietHoaDon(ChiTietHoaDon ct) {
		em.createNativeQuery("insert into CHITIETDONHANG(MABANH, MADH, SOLUONG) values(?,?,?)")
		.setParameter(1, ct.getBanh().getMaBanh())
		.setParameter(2, ct.getHoaDon().getMaHD())
		.setParameter(3, ct.getSoLuong())
		.executeUpdate();
	}

	@Override
	@Transactional
	public void xoaChiTietHoaDon(int maChiTietHoaDon) {
		em.remove(em.find(ChiTietHoaDon.class, maChiTietHoaDon));
	}

	@Override
	@Transactional
	public void suaChiTietHoaDon(ChiTietHoaDon ct) {
		em.detach(ct);
		em.merge(ct);
	}

}
