package fit.se.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import fit.se.model.Banh;
import fit.se.model.TaiKhoan;

public class CRUDRepositoryImpl implements CRUDRepository {
	
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	@Override
	public void themBanh(Banh b) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(b);
	}

	@Override
	public void xoaBanh(String maBanh) {
		Session session = this.sessionFactory.getCurrentSession();
		Banh b = (Banh) session.load(Banh.class, new Integer(maBanh));
		if(null != b){
			session.delete(b);
		}
	}

	@Override
	public void suaBanh(Banh b) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(b);
	}

	@Override
	public Banh timBanh(String maBanh) {
		Session session = this.sessionFactory.getCurrentSession();
		Banh b = (Banh) session.load(Banh.class, new Integer(maBanh));
		return b;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Banh> getAllBanh() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Banh> list = session.createQuery("from Banh").list();
		return list;
	}
	
	@Override
	public void themTK(TaiKhoan t) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(t);		
	}

	@Override
	public void xoaTK(String maTK) {
		Session session = this.sessionFactory.getCurrentSession();
		TaiKhoan t = (TaiKhoan) session.load(TaiKhoan.class, new Integer(maTK));
		if(null != t){
			session.delete(t);
		}		
	}

	@Override
	public void SuaTK(TaiKhoan t) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(t);		
	}

	@Override
	public TaiKhoan timTK(String maTK) {
		Session session = this.sessionFactory.getCurrentSession();
		TaiKhoan t = (TaiKhoan) session.load(TaiKhoan.class, new Integer(maTK));
		return t;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TaiKhoan> getAllTK() {
		Session session = this.sessionFactory.getCurrentSession();
		List<TaiKhoan> list = session.createQuery("from TAIKHOAN").list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TaiKhoan> getUserbyUsername(String username) {
		Session session = this.sessionFactory.getCurrentSession();
		List<TaiKhoan> list = session.createQuery("FROM TAIKHOAN T WHERE T.USERNAME = " + username).list();
		System.out.println("tk check: " + list);
		return list;
	}
}
