package project.springcrudtest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ForumController {
    @Autowired
    ForumDAO dao = new ForumDAO();

    @RequestMapping("/write_ok")
    public String write_ok(){
        return "";
        //dao.insertBoard()
    }
}
