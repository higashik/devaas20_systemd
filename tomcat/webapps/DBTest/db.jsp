<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.InitialContext,javax.naming.Context" %>

<%
  String insertStr = request.getParameter("insert");
  String deleteFlg = request.getParameter("delete");

  InitialContext initCon = new InitialContext();
  Context envContext  = (Context)initCon.lookup("java:/comp/env");
  DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");
  Connection con = ds.getConnection();

  boolean noExists = true;
  try ( ResultSet rst = con.getMetaData().getTables(null, null, "test", null) ){
    while ( rst.next() ){
      String tName = rst.getString("TABLE_NAME");
      if ( tName != null && tName.equals("test") ){
        noExists = false;
        break;
      }
    }
  }

  if ( noExists ){
    Statement createTable = con.createStatement();
    createTable.executeUpdate("CREATE TABLE test ( id serial primary key, date timestamp default CURRENT_TIMESTAMP, text text );");
    PreparedStatement insert = con.prepareStatement("INSERT INTO test (text) VALUES (?);");
    insert.setString(1, "test text 1");
    insert.executeUpdate();
    insert.setString(1, "test text 2");
    insert.executeUpdate();
  }

  String status = "";
  if ( insertStr != null ){
    PreparedStatement insert2 = con.prepareStatement("INSERT INTO test (text) VALUES (?);");
    insert2.setString(1, insertStr);
    insert2.executeUpdate();
    status = status + insertStr + "をINSERTしました。";
  }

  if ( deleteFlg != null ){
    Statement delete = con.createStatement();
    delete.executeUpdate("DELETE FROM test;");
    status = status + "DELETEしました。";
  }

  Statement stmt = con.createStatement();
  ResultSet result = stmt.executeQuery("select id,date,text from test;");
%>
<!DOCTYPE html>
<html>
<head><title>Database Test</title></head>
<body>
<%= status %>
<h1>Data from test Table.</h1>
<table border="1">
    <tr>
        <th>id</th>
        <th>date</th>
        <th>text</th>
    </tr>
    <%
        while (result.next()) {
    %>
    <tr>
        <td><%= result.getString(1) %></td>
        <td><%= result.getString(2) %></td>
        <td><%= result.getString(3) %></td>
    </tr>
    <%
        }
        con.close();
        initCon.close();
    %>
</table>
</body>
</html>

