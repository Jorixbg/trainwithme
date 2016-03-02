package com.twm.eventengine.services;

import org.springframework.stereotype.Service;

import com.twm.eventengine.dtos.EventDto;
import com.twm.eventengine.entities.Event;
import com.twm.eventengine.utils.HibernateUtil;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

@Service("eventDao")
public class EventDao {

	public Integer createEvent(EventDto eventDto) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = null;
		Integer eventId = null;
		try {
			tx = session.beginTransaction();
			Event event = new Event();
			event.setName(eventDto.getName());
			event.setLocation(eventDto.getLocation());
			event.setTimeslot(eventDto.getTimeslot());
			eventId = (Integer) session.save(event);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return eventId;
	}

}
