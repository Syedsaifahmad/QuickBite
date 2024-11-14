	package com.foodapp.model.daoimpl;
	
	import java.io.IOException;
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.sql.Statement;
	import java.util.ArrayList;
	import java.util.List;
	
	import com.foodapp.model.dao.UserDAO;
	import com.foodapp.model.pojo.Users;
	import com.foodapp.security.Decrypt;
	
	public class UserDAOImpl  implements UserDAO
	{
		    // Database connection
		    private Connection getConnection() throws SQLException {
		    	try {
					Class.forName("com.mysql.cj.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	return DriverManager.getConnection("jdbc:mysql://localhost:3306/food_app","root", "root");
		    }
	
		    @Override
		    public void addUser(Users user) {
		        String query = "INSERT INTO users (id, name, email, mobile, password, address) VALUES (?, ?, ?, ?, ?, ?)";
		        try (Connection conn = getConnection();
		             PreparedStatement pstmt = conn.prepareStatement(query)) {
		        	pstmt.setInt(1, user.getId());
		            pstmt.setString(2, user.getName());
		            pstmt.setString(3, user.getEmail());
		            pstmt.setString(4, Decrypt.dycrypt(user.getPassword()));
		            pstmt.setString(5, user.getMobile());
		            pstmt.setString(6, user.getAddress());
		            pstmt.executeUpdate();
	
		            System.out.println("User added successfully.");
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    
		    public Users getUserByEmail(String email){
		    	String query = "SELECT * FROM users WHERE email=?";
		    	Users user = null;
		    	try(Connection conn = getConnection();
		    		PreparedStatement pstmt = conn.prepareStatement(query)){
		    		
		    		pstmt.setString(1, email);
		    		ResultSet rs = pstmt.executeQuery();
		    		
		    		if(rs.next()){
		    			user = new Users(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("mobile"), rs.getString("password"), rs.getString("address"));
		            }
		    		
		    	}
		    	catch(SQLException e) {
		    		e.printStackTrace();
		    	}
		    	System.out.println("userDaoImpl 64 "+user);
		    	return user;
		    }
		    
		    
	
		    @Override
		    public Users getUserById(int uid) {
		        String query = "SELECT * FROM users WHERE id = ?";
		        Users user = null;
		        try (Connection conn = getConnection();
		             PreparedStatement pstmt = conn.prepareStatement(query)) {
	
		            pstmt.setInt(1, uid);
		            ResultSet rs = pstmt.executeQuery();
	
		            if (rs.next()) {
		                user = new Users(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("mobile"), rs.getString("password"), rs.getString("address"));
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		        return user;
		    }
	
		    @Override
		    public List<Users> getAllUsers() {
		    	
		        List<Users> users = new ArrayList<>();
		        
		        String query = "SELECT * FROM users";
		        
		        try (Connection conn = getConnection();
		             Statement stmt = conn.createStatement();
		             ResultSet rs = stmt.executeQuery(query)) {
	
		            while (rs.next()) {
		                Users user = new Users(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("mobile"), rs.getString("password"), rs.getString("address"));
		                users.add(user);
		            }
		        } catch (SQLException e) {
		        	
		            e.printStackTrace();
		            
		        }
		        return users;
		    }
	
		    @Override
		    public void updateUser(Users user) {
		        String query = "UPDATE users SET name = ?, email = ?, mobile = ?, password = ?, address = ? WHERE uid = ?";
		        try (Connection conn = getConnection();
		             PreparedStatement pstmt = conn.prepareStatement(query)) {
	
		            pstmt.setString(1, user.getName());
		            pstmt.setString(2, user.getEmail());
		            pstmt.setString(3, user.getMobile());
		            pstmt.setString(4, user.getPassword());
		            pstmt.setString(5, user.getAddress());	            
		            pstmt.setInt(6, user.getId());
		            pstmt.executeUpdate();
	
		            System.out.println("User updated successfully.");
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    
		    @Override
		    public void deleteUser(int id) throws IOException {
		        String query = "DELETE FROM users WHERE id = ?";
		        try (Connection conn = getConnection();
		             PreparedStatement pstmt = conn.prepareStatement(query)) {
	
		            pstmt.setInt(1, id);
		            pstmt.executeUpdate();
	
		            System.out.println("User deleted successfully.");
		        } catch (SQLException e) {
					e.printStackTrace();
				}
		    }
	}
