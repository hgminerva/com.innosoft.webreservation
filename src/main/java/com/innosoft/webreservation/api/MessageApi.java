package com.innosoft.webreservation.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.innosoft.webreservation.entity.MstMessage;
import com.innosoft.webreservation.service.MessageService;
import com.innosoft.webreservation.service.SecurityService;
/**
 *Message CRUD API
 */
@Controller
@RequestMapping("api/message")
public class MessageApi {
	/**
	 * Message service property		
	 */
	@Autowired
	private MessageService messageService;
	/**
	 * Security service property
	 */
	@Autowired
	private SecurityService securityService;
	/**
	 *Return list of message 
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<MstMessage> listMessage() {
		List<MstMessage> list = messageService.listMessage(); 
		return list;
	}
	/**
	 * Update message
	 * @param message
	 * @return
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity<MstMessage> updateMessage(@RequestBody MstMessage message) {
		try {
			if(message.getMESG_ID()==0) {			
				message = (MstMessage)securityService.stampCreated(message);
				MstMessage newMessage = messageService.addMessage(message);
				return new ResponseEntity<MstMessage>(newMessage, HttpStatus.OK);
			} else {
				message = (MstMessage)securityService.stampUpdated(message);
				MstMessage editMessage = messageService.editMessage(message);
				return new ResponseEntity<MstMessage>(editMessage, HttpStatus.OK);
			}
		} catch(Exception e) {
			System.out.print(e);
			return new ResponseEntity<MstMessage>(message, HttpStatus.BAD_REQUEST);
		}	
	}	
	/**
	 * Delete message
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteMessage(@PathVariable("id") int id) {
		try {
			boolean deleteReturn = messageService.deleteMessage(id);
			if (deleteReturn==true) {
				return new ResponseEntity<String>(HttpStatus.OK);
			} else {
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}
		}catch(Exception e) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
}
