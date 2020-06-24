package fit.se.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import fit.se.model.Banh;

@Repository
public class BanhDAOImpl implements BanhDAO{

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
		List<Banh> personsList = session.createQuery("select * from Banh bn").list();
		return personsList;
	}
	
}
