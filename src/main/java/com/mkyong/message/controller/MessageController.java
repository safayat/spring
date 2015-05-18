package com.mkyong.message.controller;

import com.mkyong.assignment.model.Assignment;
import com.mkyong.assignment.service.AssignmentService;
import com.mkyong.login.model.Login;
import com.mkyong.message.model.Message;
import com.mkyong.message.service.MessageService;
import com.mkyong.util.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.Date;
import java.util.List;

/**
 * Created by safayat on 2/3/15.
 */
@Configuration

@Controller
@ComponentScan("com.mkyong.message.service")
public class MessageController {

    @Autowired
    MessageService messageService;


    @RequestMapping(value = "/private/getMessageByAssignmentId.web",
            method = RequestMethod.GET,
            produces = "application/json")
    public @ResponseBody
    List<Message> getMessageByAssignmentId(ModelMap map, @RequestParam(value = "assignmentId") Integer assignmentId)
    {
        return messageService.getMessageByAssignmentId(assignmentId);
    }

    @RequestMapping(value = "/private/getMessages.web",
            method = RequestMethod.GET,
            produces = "application/json")
    public @ResponseBody
    List<Message> getMessageByAssignmentId(ModelMap map, @RequestParam(value = "messageKey") String messageKey)
    {
        return messageService.getMessageByGroupKey(messageKey);
    }

    @RequestMapping(value = "/private/saveMessage.web",
            method = RequestMethod.POST,
            produces = "application/json")
    public @ResponseBody
    String saveMessage(@RequestParam(value = "messageKey") String messagekey, @RequestParam(value = "messageText") String messageText, Principal principal )
    {
        Message message = new Message();
        message.setMessage(messageText);
        message.setMessageGroupKey(messagekey);
        message.setSenderId(Login.getLoginIdFromPrincipal(principal.getName()));
        message.setMessageCreationTime(new Date());
        messageService.saveOrUpdate(message);
        return "{'message': 'success'}";
    }





}
