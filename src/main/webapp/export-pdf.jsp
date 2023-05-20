
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page import="com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="com.itextpdf.text.Document"%>
<%@ page import="com.itextpdf.text.Paragraph"%>
<%@ page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@ page import="vn.edu.hcmuaf.ttt.bean.User" %>
<%@ page contentType="application/pdf" %>
<html>
<head>
    <title>BDF</title>
</head>
<body>
    <% User auth= (User) session.getAttribute("auth");%>
    <%
        // Tạo đối tượng Document
        Document document = new Document();
        // Tạo đối tượng PdfWriter để viết tài liệu vào OutputStream
        PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
        // Mở tài liệu để bắt đầu viết nội dung
        document.open();
        // Thêm nội dung vào tài liệu
        document.add(new Paragraph(auth.getemail()));
        // Đóng tài liệu
        document.close();
        // Đóng OutputStream
        writer.close();
    %>


</body>
</html>
