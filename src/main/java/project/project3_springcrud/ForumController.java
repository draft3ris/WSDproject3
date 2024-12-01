package project.project3_springcrud;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ForumController {

    @Autowired
    ForumDAO dao = new ForumDAO();

    @RequestMapping("/")
    public String landing(Model model){
        LocalDateTime time = LocalDateTime.now();
        model.addAttribute("serverTime", time);
        return "landing";
    }

    @RequestMapping(value="/list", method=RequestMethod.GET)
    public String home(Model model){
        model.addAttribute("list", dao.getForumList());
        return "index";
    }

    @RequestMapping(value="/add", method= RequestMethod.GET)
    public String add(){
        return "add";
    }

    @RequestMapping(value="/add_ok", method=RequestMethod.POST)
    public String addForumOk(ForumVO vo){
        vo.setView_count(0);
        int i = dao.insertForum(vo);
        if(i==0){
            System.out.println("Failed to add data.");
        }
        else{
            System.out.println("Successfully added data.");
        }
        return "redirect:/list";
    }

    @RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
    public String edit(@PathVariable("id") int id, Model model){
        ForumVO vo = dao.getForumPost(id);
        model.addAttribute("vo", vo);
        return "edit";
    }

    @RequestMapping(value="/edit_ok", method=RequestMethod.POST)
    public String editForumOk(ForumVO vo){
        int i = dao.updateForum(vo);
        if(i==0){
            System.out.println("Failed to edit data.");
        }
        else{
            System.out.println("Successfully edited data.");
        }
        return "redirect:/list";
    }

    @RequestMapping(value="/view/{id}", method=RequestMethod.GET)
    public String view(@PathVariable("id") int id, Model model){
        ForumVO vo = dao.getForumPost(id);
        int current_views = vo.getView_count();
        System.out.println("this post views: " + current_views);
        current_views++;
        vo.setView_count(current_views);
        int countIncreaseResult = dao.increaseViews(vo.getId(), current_views);
        if(countIncreaseResult==0){
            System.out.println("Failed to increase view count.");
        }
        else{
            System.out.println("Successfully increased view count.");
        }
        model.addAttribute("vo", vo);
        return "view";
    }

    @RequestMapping(value="/delete_ok/{id}", method=RequestMethod.GET)
    public String delete(@PathVariable int id){
        int i = dao.deleteForum(id);
        if(i==0){
            System.out.println("Failed to delete data.");
        }
        else{
            System.out.println("Successfully deleted data.");
        }
        return "redirect:/list";
    }

    @RequestMapping(value="/search", method=RequestMethod.GET)
    public String search_result(@RequestParam("title") String title, @RequestParam("userType") String user_type, Model model){
        System.out.println("searched title: " + title + ", user_type: " + user_type);
        List<ForumVO> list = dao.searchForumList(title, user_type);
        for(ForumVO vo : list){
            System.out.println(vo);
        }
        model.addAttribute("list", list);
        return "index";
    }
}
