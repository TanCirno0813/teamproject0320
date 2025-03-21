package edu.du.team_project.mapper;

import edu.du.team_project.model.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Optional;

@Mapper
public interface UserMapper {
    @Insert("INSERT INTO users (name, email, password, phone_number) VALUES (#{name}, #{email}, #{password}, #{phoneNumber})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertUser(User user);

    @Select("SELECT * FROM users WHERE email = #{email}")
    Optional<User> findByEmail(String email);

    @Select("SELECT COUNT(*) FROM users WHERE email = #{email}")
    boolean existsByEmail(String email);

    @Select("SELECT * FROM users WHERE email = #{email} AND password = #{password}")
    User findByEmailAndPassword(String email, String password);

    // UserMapper.java
    @Select("SELECT id, name, email, phone_number AS phoneNumber, role FROM users")
    List<User> getAllUsers();

    @Select("SELECT * FROM users WHERE id = #{id}")
    User findById(Long id);

    @Update("""
    UPDATE users 
    SET name = #{name}, phone_number = #{phoneNumber}, role = #{role}
    WHERE id = #{id}
""")
    void updateUser(User user);

    @Delete("DELETE FROM users WHERE id = #{id}")
    void deleteUser(Long id);
}
