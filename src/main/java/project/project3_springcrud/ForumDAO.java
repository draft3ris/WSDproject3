package project.springcrudtest;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ForumDAO {
    @Setter @Autowired
    private JdbcTemplate template;

    private final String FORUM_INSERT = "insert into forum_data (name, title, phone, post_type, user_type, inc_file) values (?,?,?,?,?,?)";

    public int insertBoard(ForumVO vo){
        return template.update(FORUM_INSERT,
                new Object[]{vo.getName(), vo.getTitle(), vo.getPhone(), vo.getPost_type(), vo.getUser_type(),
                vo.getFileName()});
    }
}
