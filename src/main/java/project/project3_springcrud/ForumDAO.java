package project.project3_springcrud;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ForumDAO {
    @Setter @Autowired
    private JdbcTemplate template;

    private final String FORUM_INSERT = "insert into forum_data (name, title, phone, post_type, user_type, inc_file) values (?,?,?,?,?,?)";
    private final String FORUM_LIST = "select * from forum_data order by id desc";
    private final String FORUM_GET = "select * from forum_data where id=?";
    private final String FORUM_UPDATE = "update forum_data set name=?,title=?,phone=?,post_type=?,user_type=?,inc_file=? where id=?";
    private final String FORUM_INCREASEVIEW = "update forum_data set views=? where id=?";
    private final String FORUM_DELETE = "delete from forum_data where id=?";

    public int insertForum(ForumVO vo){
        return template.update(FORUM_INSERT,
                new Object[]{vo.getName(), vo.getTitle(),
                        vo.getPhone(), vo.getPost_type(),
                        vo.getUser_type(), vo.getFileName()});
    }

    public List<ForumVO> getForumList(){
        return template.query(FORUM_LIST, new Object[]{}, new RowMapper<ForumVO>(){
            @Override
            public ForumVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                ForumVO data = new ForumVO();
                data.setId(rs.getInt("id"));
                data.setName(rs.getString("name"));
                data.setTitle(rs.getString("title"));
                data.setPhone(rs.getString("phone"));
                data.setPost_type(rs.getString("post_type"));
                data.setUser_type(rs.getString("user_type"));
                data.setFileName(rs.getString("inc_file"));
                data.setAdd_date(rs.getTimestamp("add_date").toLocalDateTime());
                data.setView_count(rs.getInt("views"));
                return data;
            }
        });
    }

    public ForumVO getForumPost(int id){
        return template.queryForObject(FORUM_GET, new Object[] {id},
                new RowMapper<ForumVO>(){
                    @Override
                    public ForumVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                        ForumVO data = new ForumVO();
                        data.setId(rs.getInt("id"));
                        data.setName(rs.getString("name"));
                        data.setTitle(rs.getString("title"));
                        data.setPhone(rs.getString("phone"));
                        data.setPost_type(rs.getString("post_type"));
                        data.setUser_type(rs.getString("user_type"));
                        data.setFileName(rs.getString("inc_file"));
                        data.setAdd_date(rs.getTimestamp("add_date").toLocalDateTime());
                        data.setView_count(rs.getInt("views"));
                        return data;
                    }
                });
    }

    public int updateForum(ForumVO vo){
        return template.update(FORUM_UPDATE,
                new Object[]{vo.getName(), vo.getTitle(), vo.getPhone(), vo.getPost_type(),
                        vo.getUser_type(), vo.getFileName(), vo.getId()});
    }

    public int deleteForum(int id){
        return template.update(FORUM_DELETE, new Object[]{id});
    }

    public int increaseViews(int id, int new_view_count){
        return template.update(FORUM_INCREASEVIEW,
                new Object[]{new_view_count, id});
    }
}
