package service;

import Bean.Admin;
import Bean.Article;
import Bean.Comment;
import Bean.Danmu;
import dao.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Service {

    private Dao dao;

    public Service(Dao dao) {
        this.dao = dao;
    }

    public void delComment(String id){
        Connection conn=dao.getConn();
        PreparedStatement ps=null;
        try {
            ps=conn.prepareStatement("delete from comment where id=?");
            ps.setString(1,id);
            ps.execute();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<Admin> getAdmin(){
        Connection conn=dao.getConn();
        PreparedStatement ps=null;
        ResultSet rs=null;
        List<Admin> list=new ArrayList<>();
        try {
            ps=conn.prepareStatement("select * from admin");
            rs=ps.executeQuery();
            while(rs.next()){
                String user=rs.getString(1);
                String pwd=rs.getString(2);
                list.add(new Admin(user,pwd));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return list;
    }

    public List<Article> selectAll(int offset,int count) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;
        List<Article> list = new ArrayList<>();
        try {
            ps = conn.prepareStatement("select * from article order by pubdate desc limit ?,?");
            ps.setInt(1,offset);
            ps.setInt(2,count);
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                String author = rs.getString(3);
                String pubdate = rs.getString(4);
                String moddate = rs.getString(5);
                String cate = rs.getString(6);
                String tag = rs.getString(7);
                int view = rs.getInt(8);
                int zan = rs.getInt(9);
                int comment = rs.getInt(10);
                String content = rs.getString(11);
                String img = rs.getString(12);
                list.add(new Article(id, title, author, pubdate, moddate, cate, tag, view, zan, comment, content,img));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return list;
    }

    public List<Article> selectAllArticle() {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;
        List<Article> list = new ArrayList<>();
        try {
            ps = conn.prepareStatement("select * from article order by pubdate desc");
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                String author = rs.getString(3);
                String pubdate = rs.getString(4);
                String moddate = rs.getString(5);
                String cate = rs.getString(6);
                String tag = rs.getString(7);
                int view = rs.getInt(8);
                int zan = rs.getInt(9);
                int comment = rs.getInt(10);
                String content = rs.getString(11);
                String img = rs.getString(12);
                list.add(new Article(id, title, author, pubdate, moddate, cate, tag, view, zan, comment, content,img));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return list;
    }

    public List<Comment> selectAllComment(String article) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;
        List<Comment> list = new ArrayList<>();
        try {
            ps = conn.prepareStatement("select * from comment where articleId=? order by date desc limit 15");
            ps.setString(1,article);
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String articleId = rs.getString(2);
                String name = rs.getString(3);
                String img = rs.getString(4);
                String date = rs.getString(5);
                String header = rs.getString(6);
                String ip = rs.getString(7);
                String content = rs.getString(8);
                list.add(new Comment(id,articleId,name,img,date,header,ip,content));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return list;
    }

    public String randomArticle() {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;
        List<String> list = new ArrayList<>();
        String ran="";
        try {
            ps = conn.prepareStatement("select id from article");
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                list.add(id);
            }
            Random random = new Random();
            int n = random.nextInt(list.size());
            ran=list.get(n);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return ran;
    }

    public List<Danmu> selectAllDanmu() {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;
        List<Danmu> list = new ArrayList<>();
        try {
            ps = conn.prepareStatement("select * from danmu");
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String date = rs.getString(2);
                String content = rs.getString(3);
                list.add(new Danmu(id,date,content));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return list;
    }

    public void insertComment(Comment comment){
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        try {
            ps=conn.prepareStatement("insert into comment values(?,?,?,?,?,?,?,?)");
            ps.setString(1,comment.getId());
            ps.setString(2,comment.getArticleId());
            ps.setString(3,comment.getName());
            ps.setString(4,comment.getImg());
            ps.setString(5,comment.getDate());
            ps.setString(6,comment.getHeader());
            ps.setString(7,comment.getIp());
            ps.setString(8,comment.getContent());
            ps.execute();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public void insertDanmu(Danmu danmu){
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        try {
            ps=conn.prepareStatement("insert into danmu values(?,?,?)");
            ps.setString(1,danmu.getId());
            ps.setString(2, danmu.getDate());
            ps.setString(3,danmu.getContent());
            ps.execute();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public Article selectById(String pid) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;
        Article article=null;
        try {
            ps = conn.prepareStatement("select * from article where id=?");
            ps.setString(1,pid);
            rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String title = rs.getString(2);
                String author = rs.getString(3);
                String pubdate = rs.getString(4);
                String moddate = rs.getString(5);
                String cate = rs.getString(6);
                String tag = rs.getString(7);
                int view = rs.getInt(8);
                int zan = rs.getInt(9);
                int comment = rs.getInt(10);
                String content = rs.getString(11);
                String img = rs.getString(12);
                article=new Article(id, title, author, pubdate, moddate, cate, tag, view, zan, comment, content,img);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return article;
    }

    public int getView(String id){
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs=null;
        int data=0;
        try {
            ps=conn.prepareStatement("select view from article where id=?");
            ps.setString(1,id);
            rs=ps.executeQuery();
            while (rs.next()){
                data = rs.getInt(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return data;
    }

    public void setView(String id){
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        int data = getView(id);
        try {
            ps=conn.prepareStatement("update article set view=? where id=?");
            ps.setInt(1,data+1);
            ps.setString(2,id);
            ps.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public int getZan(String id){
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs=null;
        int data=0;
        try {
            ps=conn.prepareStatement("select zan from article where id=?");
            ps.setString(1,id);
            rs=ps.executeQuery();
            while (rs.next()){
                data = rs.getInt(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return data;
    }

    public void setZan(String id){
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        int data = getZan(id);
        try {
            ps=conn.prepareStatement("update article set zan=? where id=?");
            ps.setInt(1,data+1);
            ps.setString(2,id);
            ps.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public int getComment(String id){
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs=null;
        int data=0;
        try {
            ps=conn.prepareStatement("select comment from article where id=?");
            ps.setString(1,id);
            rs=ps.executeQuery();
            while (rs.next()){
                data = rs.getInt(1);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return data;
    }

    public void setComment(String id){
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        int data = getComment(id);
        try {
            ps=conn.prepareStatement("update article set comment=? where id=?");
            ps.setInt(1,data+1);
            ps.setString(2,id);
            ps.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    public int getArticleCount() {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;
        int count=0;
        try {
            ps = conn.prepareStatement("select count(*) from article");
            rs = ps.executeQuery();
            while (rs.next()) {
                count=rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return count;
    }

    public String getCateName(String id) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;

        try {
            ps = conn.prepareStatement("select name from cate where id=?");
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return null;
    }

    public String getTagName(String id) {
        Connection conn = null;
        PreparedStatement ps = null;
        conn = dao.getConn();
        ResultSet rs = null;

        try {
            ps = conn.prepareStatement("select name from tag where id=?");
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                ps.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return null;
    }

}
