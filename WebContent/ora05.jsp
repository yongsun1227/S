<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String driver = "oracle.jdbc.driver.OracleDriver";
	String url ="jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String sql = "select empno,ename,job,sal from emp";
	ArrayList<Emp> al = new ArrayList<Emp>();
	class.forName(driver);
	connection conn = DriverManager.getConnection(url,"scott","tiger");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	if(rs.next()){
		do{Emp emp = new Emp();
		emp.setEmpno(rs.getint(1)); emp.setEname(rs.getString(2));
		emp.setlob(rs.getString(3)); emp.setSal(rs.getint(4));
		al.add(emp);
		}while(rs.next());
		request.setAttribute("al",al);
		rs.close(); stmt.close(); conn.close();
		RequestDispatcher rd = request.getRequestDispatcher("ora05Result2.jsp");
		rd.forward(request,response);
	}else{out.println("데이터가 없습니다");
	stmt.close(); conn.close();
	}





%>
</body>
</html>