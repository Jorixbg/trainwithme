package com.twm.eventengine.client;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.twm.eventengine.dtos.EventDto;
import com.twm.eventengine.services.EventDao;

@RestController
public class GreetingController {

    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();
    
    @Autowired
    @Qualifier("eventDao")
    EventDao eventDao;

    @RequestMapping("/greeting")
    public Greeting greeting(@RequestParam(value="name", defaultValue="World") String name) {
    	persistEvent(name);
        return new Greeting(counter.incrementAndGet(),
                            String.format(template, name));
    }

	private void persistEvent(String name) {
		EventDto eventDto = new EventDto();
		eventDto.setName(name);
		eventDto.setLocation("From Service");
		eventDao.createEvent(eventDto);
	}
}