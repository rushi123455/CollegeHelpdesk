package com.college.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

@SuppressWarnings("serial")
@WebServlet("/chatbot")
public class AIChatbotServlet extends HttpServlet {

protected void doPost(HttpServletRequest req, HttpServletResponse res)
throws ServletException, IOException {

    String msg = req.getParameter("msg").toLowerCase();

    String reply = "";

    // 🔥 STATIC BIG ANSWERS

    if(msg.contains("java")){
        reply = "Java is a high-level, object-oriented programming language developed by Sun Microsystems. "
              + "It is widely used for building enterprise applications, Android apps, web applications, and backend systems. "
              + "Java follows the principle of Write Once Run Anywhere (WORA), meaning compiled code can run on any platform with JVM. "
              + "It supports OOP concepts like inheritance, polymorphism, encapsulation, and abstraction. "
              + "Java is secure, robust, and widely used in industries.";
    }
    else if(msg.contains("python")){
        reply = "Python is a high-level, interpreted programming language known for its simplicity and readability. "
              + "It is widely used in web development, data science, artificial intelligence, machine learning, and automation. "
              + "Python has a large number of libraries like NumPy, Pandas, TensorFlow, and Django. "
              + "It is beginner-friendly and allows developers to write less code compared to other languages. "
              + "Python is one of the most in-demand programming languages today.";
    }
    else if(msg.contains("c language") || msg.equals("c")){
        reply = "C is a powerful low-level programming language developed by Dennis Ritchie. "
              + "It is used for system programming, operating systems, and embedded systems. "
              + "C provides direct memory access using pointers and is very fast and efficient. "
              + "It is the foundation for many modern languages like C++, Java, and Python.";
    }
    else if(msg.contains("fees")){
        reply = "Course fees range from 5000 to 15000 depending on the course selected. "
              + "Java and Python courses may cost slightly higher due to advanced topics.";
    }
    else if(msg.contains("duration")){
        reply = "Course duration is usually 2 to 3 months. "
              + "It includes theory, practical sessions, and project work.";
    }

    // ✅ AGAR STATIC ANSWER MIL GAYA → DIRECT RETURN
    if(!reply.equals("")){
        res.setContentType("text/plain");
        res.getWriter().write(reply);
        return;
    }

    // 🤖 AI CALL (fallback)

    String apiKey = "YOUR_REAL_API_KEY";

    String urlString = "https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent?key=" + apiKey;

    @SuppressWarnings("deprecation")
	URL url = new URL(urlString);
    HttpURLConnection con = (HttpURLConnection) url.openConnection();

    con.setRequestMethod("POST");
    con.setRequestProperty("Content-Type", "application/json");
    con.setDoOutput(true);

    String jsonInput = "{ \"contents\": [ { \"parts\": [ { \"text\": \"" + msg.replace("\"", "\\\"") + "\" } ] } ] }";

    OutputStream os = con.getOutputStream();
    os.write(jsonInput.getBytes());
    os.flush();

    BufferedReader br;

    if (con.getResponseCode() == 200) {
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
    } else {
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
    }

    String line;
    StringBuilder responseData = new StringBuilder();

    while ((line = br.readLine()) != null) {
        responseData.append(line);
    }

    String result = responseData.toString();

    String aiReply = "No response";

    try {
        int start = result.indexOf("\"text\": \"") + 9;
        int end = result.indexOf("\"", start);
        aiReply = result.substring(start, end);
    } catch (Exception e) {
        aiReply = "AI error occurred";
    }

    res.setContentType("text/plain");
    res.getWriter().write(aiReply);
}
}
