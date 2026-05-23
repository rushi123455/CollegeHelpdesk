package com.college.util;

import java.sql.Connection;
import com.college.util.DBConnection;

@SuppressWarnings("unused")
public class TestDB {

    public static void main(String[] args) {

        Connection con = DBConnection.getConnection();

        if(con != null){
            System.out.println("DB CONNECTED SUCCESSFULLY ✅");
        }else{
            System.out.println("DB CONNECTION FAILED ❌");
        }
    }
}