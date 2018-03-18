<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mak
  Date: 3/18/18
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="daggerok.ejb.api.CalculatorRemote" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="io.vavr.control.Try" %>
<html>
<head>
  <title>ejb calc</title>
</head>
<%--
	java:global/app/CalculatorBean!daggerok.ejb.api.CalculatorRemote
	java:app/app/CalculatorBean!daggerok.ejb.api.CalculatorRemote
	java:module/CalculatorBean!daggerok.ejb.api.CalculatorRemote
	java:jboss/exported/app/CalculatorBean!daggerok.ejb.api.CalculatorRemote
	java:global/app/CalculatorBean
	java:app/app/CalculatorBean
	java:module/CalculatorBean
--%>
<%
  final CalculatorRemote calc = CalculatorRemote.class.cast(
      Try.of(() -> new InitialContext().lookup("java:global/app/CalculatorBean"))
         .getOrElse(() -> null)
  );
%>
<body>
  <p>1 + 2 + 3 = <%= null == calc ? 0 : calc.add(1, 2, 3) %></p>
</body>
</html>
