package com.twm.eventengine.entities;

import java.sql.Timestamp;

import javax.persistence.*;

@Entity
@Table(name = "EVENT")
public class Event {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "name")
	private String name;

	@Column(name = "location")
	private String location;

	@Column(name = "timeslot")
	private Timestamp timeslot;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Timestamp getTimeslot() {
		return timeslot;
	}

	public void setTimeslot(Timestamp timeslot) {
		this.timeslot = timeslot;
	}

}
