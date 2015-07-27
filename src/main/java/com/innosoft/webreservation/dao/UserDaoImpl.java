package com.innosoft.webreservation.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.MstMessage;
import com.innosoft.webreservation.entity.MstSecurityUser;

@Repository
@Transactional
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public MstSecurityUser getUser(String login){
        List<MstSecurityUser> userList = new ArrayList<MstSecurityUser>();
        Session session = this.getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from MstSecurityUser u where u.USER_LOGIN = :login");
        query.setParameter("login", login);
        userList = query.list();
        if (userList.size() > 0)
            return userList.get(0);
        else
            return new MstSecurityUser();    		
	}
	
	public MstSecurityUser addUser(MstSecurityUser user) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstSecurityUser newUser = new MstSecurityUser();

			newUser.setUSER_LOGIN(user.USER_LOGIN);
			newUser.setUSER_PASSWORD(user.USER_PASSWORD);
			
			session.save(newUser);
			tx.commit();
			session.close();
			
			return newUser;			
		} catch(Exception e) {
			return user;	
		}
	}	
}
