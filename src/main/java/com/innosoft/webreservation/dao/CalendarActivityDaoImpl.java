package com.innosoft.webreservation.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.innosoft.webreservation.entity.MstCalendarActivity;
import com.innosoft.webreservation.entity.MstSecurityUser;
/**
 * CRUD implementation for calendar activity data object.
 */
@Repository
@Transactional
public class CalendarActivityDaoImpl implements CalendarActivityDao{
	/**
	 * Session factory method
	 */
	@Autowired
	private SessionFactory sessionFactory;
	/**
	 * Get session factory method
	 * @return
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	/**
	 * Set session factory method
	 * @param sessionFactory
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}	
	/**
	 * List calendar activity method
	 */
	
	@SuppressWarnings("unchecked")
	public List<MstCalendarActivity> listCalendarActivity() {
		Session session = this.sessionFactory.getCurrentSession();
		List<MstCalendarActivity> list = session.createQuery("from MstCalendarActivity").list();
		return list;
	}
	/**
	 * List calendar activity by customer method
	 */
	@SuppressWarnings("unchecked")
	public List<MstCalendarActivity> listCalendarActivityByCustomer(int customerId) {
		Session session = this.sessionFactory.getCurrentSession();
//		List<MstCalendarActivity> list = session.createQuery("from MstCalendarActivity where CACT_CUST_ID=" + customerId).list();	
		Criteria criteria = session.createCriteria(MstCalendarActivity.class)
				.add(Restrictions.eq("CACT_CUST_ID",customerId));
		criteria.addOrder(Order.asc("CACT_CLDR_ID"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}
	
	
	
	/**
	 * Get current session method
	 */
	@SuppressWarnings("unchecked")
	public List<MstCalendarActivity> listCalendarActivityByCalendarDate(MstCalendarActivity calendarAct){
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(MstCalendarActivity.class)
				.add(Restrictions.eq("CACT_CLDR_ID", calendarAct.getCACT_CLDR_ID()))
				.add(Restrictions.eq("CACT_CUST_ID", calendarAct.getCACT_CUST_ID()));
		return criteria.list();
	}
	/**
	 * Get current session method
	 */
	public MstCalendarActivity getCalendarActivityById(int cactId){
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(MstCalendarActivity.class)
				.add(Restrictions.eq("CACT_ID", cactId));
		return (MstCalendarActivity)criteria.list().get(0);
	}
	/**
	 * Get current session method
	 * @return
	 */
	public int getMaxId()
	{
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(MstCalendarActivity.class).setProjection(Projections.max("CACT_ID"));
	    Integer maxId = (Integer)criteria.uniqueResult();
		if(maxId == null){
			maxId = 0;
		}
		return 	maxId;
	}
	/**
	 * Add calendar activity method
	 */
	public MstCalendarActivity addCalendarActivity(MstCalendarActivity calendarActivity){
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;

			tx = session.beginTransaction();
			MstCalendarActivity newCalendarActivity = new MstCalendarActivity();
			newCalendarActivity.setCACT_ID(getMaxId() + 1);
			newCalendarActivity.setCACT_CLDR_ID(calendarActivity.CACT_CLDR_ID);
			newCalendarActivity.setCACT_CUST_ID(calendarActivity.CACT_CUST_ID);  
			newCalendarActivity.setCACT_CLDR_ID(calendarActivity.CACT_CLDR_ID);  
			newCalendarActivity.setCACT_DETAILS_NO(calendarActivity.CACT_DETAILS_NO);  
			newCalendarActivity.setCACT_ACTIVITY_CLASSIFICATION(calendarActivity.CACT_ACTIVITY_CLASSIFICATION); 
			newCalendarActivity.setCACT_ACTIVITY_CONTENTS(calendarActivity.CACT_ACTIVITY_CONTENTS);
			newCalendarActivity.setCACT_START_TIME_ID(calendarActivity.CACT_START_TIME_ID);
			newCalendarActivity.setCACT_END_TIME_ID(calendarActivity.CACT_END_TIME_ID);
			newCalendarActivity.setCACT_OPERATION_FLAG(calendarActivity.CACT_OPERATION_FLAG);
			
			newCalendarActivity.setCREATED_DATE(calendarActivity.CREATED_DATE);
			newCalendarActivity.setCREATED_BY_USER_ID(calendarActivity.CREATED_BY_USER_ID);
			newCalendarActivity.setUPDATED_DATE(calendarActivity.UPDATED_DATE);
			newCalendarActivity.setUPDATED_BY_USER_ID(calendarActivity.UPDATED_BY_USER_ID); 
			newCalendarActivity.setISDELETED(0);
			
			session.save(newCalendarActivity);
			tx.commit();
			session.close();
			
			return newCalendarActivity;			
			
		} catch(HibernateException e) {
			
			return calendarActivity;	
		}		
	}
	/**
	 * Edit calendar activity
	 * @param calendarActivity
	 * @return
	 */
	public MstCalendarActivity editCalendarActivity(MstCalendarActivity calendarActivity){
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstCalendarActivity updateCalendarActivity = (MstCalendarActivity)session.get(MstCalendarActivity.class, calendarActivity.CACT_ID); 
			
			updateCalendarActivity.setCACT_CLDR_ID(calendarActivity.CACT_CLDR_ID);
			updateCalendarActivity.setCACT_CUST_ID(calendarActivity.CACT_CUST_ID);  
			updateCalendarActivity.setCACT_CLDR_ID(calendarActivity.CACT_CLDR_ID);  
			updateCalendarActivity.setCACT_DETAILS_NO(calendarActivity.CACT_DETAILS_NO);  
			updateCalendarActivity.setCACT_ACTIVITY_CLASSIFICATION(calendarActivity.CACT_ACTIVITY_CLASSIFICATION); 
			updateCalendarActivity.setCACT_ACTIVITY_CONTENTS(calendarActivity.CACT_ACTIVITY_CONTENTS);
			updateCalendarActivity.setCACT_START_TIME_ID(calendarActivity.CACT_START_TIME_ID);
			updateCalendarActivity.setCACT_END_TIME_ID(calendarActivity.CACT_END_TIME_ID);
			updateCalendarActivity.setCACT_OPERATION_FLAG(calendarActivity.CACT_OPERATION_FLAG);
			
			updateCalendarActivity.setUPDATED_DATE(calendarActivity.UPDATED_DATE);
			updateCalendarActivity.setUPDATED_BY_USER_ID(calendarActivity.UPDATED_BY_USER_ID); 
			updateCalendarActivity.setISDELETED(0);
			
			session.update(updateCalendarActivity); 
			tx.commit();
			session.close();
			
			return updateCalendarActivity;
		} catch (Exception e) 
		{
			return new MstCalendarActivity();
		}		
	}
	/**
	 * Delete calendar activity
	 */
	public boolean deleteCalendarActivity(int id){
	    try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
	    	tx = session.beginTransaction();
	    	MstCalendarActivity deleteCalendarActivity = (MstCalendarActivity)session.get(MstCalendarActivity.class, id); 
	    	
	    	session.delete(deleteCalendarActivity); 
	    	
	    	tx.commit();
	    	session.close();
	    	
	    	return true;
	    } catch (Exception e) {
	    	return false; 
	    }			
	}
}
