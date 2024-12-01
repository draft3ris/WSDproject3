package project.project3_springcrud;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ForumService {
    @Autowired
    ForumDAO dao = new ForumDAO();
}
