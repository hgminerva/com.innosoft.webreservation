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

import com.innosoft.webreservation.entity.MstCalendar;
import com.innosoft.webreservation.entity.MstCalendarActivity;
/**
 *CRUD implementation for calendar data object.
 */
@Repository
@Transactional
public class CalendarDaoImpl implements CalendarDao {
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
	 * List calendar method
	 */
	@SuppressWarnings("unchecked")
	public List<MstCalendar> listCalendar() {
		Session session = this.sessionFactory.getCurrentSession();
//		List<MstCalendar> list = session.createQuery("from MstCalendar").list();
		
		Criteria criteria = session.createCriteria(MstCalendar.class);
		criteria.addOrder(Order.asc("CLDR_DATE"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		
		return criteria.list();
	}
	/**
	 * Get current session method
	 * @return
	 */
	public int getMaxId()
	{
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(MstCalendar.class).setProjection(Projections.max("CLDR_ID"));
	    Integer maxId = (Integer)criteria.uniqueResult();
		if(maxId == null){
			maxId = 0;
		}
		return 	maxId;
	}
	/**
	 * Add calendar method
	 */
	public MstCalendar addCalendar(MstCalendar calendar) {
		try {
			
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;
			
			tx = session.beginTransaction();
			MstCalendar newCalendar = new MstCalendar();

			newCalendar.setCLDR_ID(getMaxId() + 1);
			newCalendar.setCLDR_DATE(calendar.CLDR_DATE);
			newCalendar.setCLDR_DAYCODE(calendar.CLDR_DAYCODE);
			newCalendar.setCLDR_NOTE(calendar.CLDR_NOTE);
			
			newCalendar.setCREATED_BY_USER_ID(calendar.CREATED_BY_USER_ID);
			newCalendar.setCREATED_DATE(calendar.CREATED_DATE);
			newCalendar.setUPDATED_BY_USER_ID(calendar.UPDATED_BY_USER_ID);
			newCalendar.setUPDATED_DATE(calendar.UPDATED_DATE);
			newCalendar.setISDELETED(calendar.ISDELETED);
			
			session.save(newCalendar);
			tx.commit();
			session.close();
			
			return newCalendar;			
			
		} catch(HibernateException e) {
			
			System.out.print(e);
			
			return calendar;	
		}
	}
	/**
	 * Edit session method
	 */
	public MstCalendar editCalendar(MstCalendar calendar) {
		try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
			tx = session.beginTransaction();
			MstCalendar updatecalendar = (MstCalendar)session.get(MstCalendar.class, calendar.CLDR_ID); 
			
			updatecalendar.setCLDR_DATE(calendar.CLDR_DATE);
			updatecalendar.setCLDR_DAYCODE(calendar.CLDR_DAYCODE);
			updatecalendar.setCLDR_NOTE(calendar.CLDR_NOTE);
			
			updatecalendar.setUPDATED_BY_USER_ID(calendar.UPDATED_BY_USER_ID);
			updatecalendar.setUPDATED_DATE(calendar.UPDATED_DATE);
			
			session.update(updatecalendar); 
			tx.commit();
			session.close();
			
			return updatecalendar;
		} catch (Exception e) 
		{
			return new MstCalendar();
		}		
	}
	/**
	 * Delete calendar method
	 */
	public boolean deleteCalendar(int id) {
	    try {
			Session session = this.sessionFactory.openSession();
			Transaction tx = null;	
			
	    	tx = session.beginTransaction();
	    	MstCalendar deleteCalendar = (MstCalendar)session.get(MstCalendar.class, id); 
	    	
	    	session.delete(deleteCalendar); 
	    	
	    	tx.commit();
	    	session.close();
	    	
	    	return true;
	    } catch (Exception e) {
	    	return false; 
	    }	
	}
}
