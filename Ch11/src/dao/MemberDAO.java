package dao;

import db.DBHelper;
import dto.MemberDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO extends DBHelper {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public static MemberDAO instance = new MemberDAO();

    private MemberDAO() {
    }

    public static MemberDAO getInstance() {


        return instance;
    }

    public void insertMember(MemberDTO dto) {
        try {
            logger.info("MemberDAO insertMember...1 ");
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.INSERT_MEMBER);
            psmt.setString(1, dto.getUid());
            psmt.setString(2, dto.getName());
            psmt.setString(3, dto.getHp());
            psmt.setString(4, dto.getPos());
            psmt.setString(5, dto.getDep());
            psmt.executeUpdate();
            close();
            logger.info("MemberDAO insertMember...2 ");
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
    }

    public MemberDTO selectMember(String uid) {
        MemberDTO dto = new MemberDTO();

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_MEMBER);
            psmt.setString(1, uid);
            rs = psmt.executeQuery();
            while (rs.next()) {
                MemberDTOSet(dto);
            }
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return dto;
    }

    public List<MemberDTO> selectMembers() {
        List<MemberDTO> dtos = new ArrayList<MemberDTO>();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_ALL_MEMBERS);
            rs = psmt.executeQuery();
            while (rs.next()) {
                MemberDTO dto = new MemberDTO();
                MemberDTOSet(dto);
                dtos.add(dto);
            }
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return dtos;
    }

    private void MemberDTOSet(MemberDTO dto) throws SQLException {
        dto.setUid(rs.getString(1));
        dto.setName(rs.getString(2));
        dto.setHp(rs.getString(3));
        dto.setPos(rs.getString(4));
        dto.setDep(rs.getString(5));
        dto.setrDate(rs.getString(6));
    }

    public void updateMember(MemberDTO dto) {

        try {
            conn=getConnection();
            psmt=conn.prepareStatement(SQL.UPDATE_MEMBER);
            psmt.setString(1, dto.getName());
            psmt.setString(2, dto.getHp());
            psmt.setString(3, dto.getPos());
            psmt.setString(4, dto.getDep());
            psmt.setString(5, dto.getUid());
            psmt.executeUpdate();
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public void deleteMember(String uid) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.DELETE_MEMBER);
            psmt.setString(1, uid);
            psmt.executeUpdate();
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
