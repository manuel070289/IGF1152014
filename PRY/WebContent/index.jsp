<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <% 
 
 if((session.getAttribute("rol")!=null || session.getAttribute("rol")!="")  && (session.getAttribute("id_usuario")!=null || session.getAttribute("id_usuario")!=null))
 {
	String site = new String("menu.jsp");
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", site);
 }
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"	href="bootstrap-3.2.0-dist/normalize.css">
<link rel="stylesheet" type="text/css"	href="bootstrap-3.2.0-dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"	href="bootstrap-3.2.0-dist/css/bootstrap-theme.min.css">
<script type="text/javascript" src="jquery-2.1.1.min.js"></script>
<script type="text/javascript"src="bootstrap-3.2.0-dist/js/bootstrap.min.js"></script>
<style>
.form-signin
{
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
}
.form-signin .form-signin-heading, .form-signin .checkbox
{
    margin-bottom: 10px;
}
.form-signin .checkbox
{
    font-weight: normal;
}
.form-signin .form-control
{
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus
{
    z-index: 2;
}
.form-signin input[type="text"]
{
    margin-bottom: -1px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}
.form-signin input[type="password"]
{
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.account-wall
{
    margin-top: 20px;
    padding: 40px 0px 20px 0px;
    background-color: #f7f7f7;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}
.login-title
{
    color: #555;
    font-size: 18px;
    font-weight: 400;
    display: block;
}
.profile-img
{
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
.need-help
{
    margin-top: 10px;
}
.new-account
{
    display: block;
    margin-top: 10px;
}</style>
</head>
<body>
	<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <div class="account-wall">
                <img  src="RESOURCES/igf115.png"  alt="">
                <form class="form-signin" action="login.jsp" >
                <input type="text" class="form-control" placeholder="Usuario" required autofocus name="user" id="user">
                <input type="password" class="form-control" placeholder="Contraseña" required name="pass" id="pass">
                <button class="btn btn-lg btn-primary btn-block" type="submit">
                    Iniciar Sesión</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
</body>
</html>