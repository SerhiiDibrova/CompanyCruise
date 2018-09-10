<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="static/taglib.jsp" %>
<html>
<head>
    <title>Contact US</title>
    <c:import url="static/head.jsp"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
            integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
            integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
            crossorigin="anonymous"></script>

</head>
<body>
<c:import url="static/menu.jsp"/>
<style>
    #contact .card:hover i, #contact .card:hover h4 {
        color: #87d37c;
    }
</style>
<section id="contact">
    <div class="container">
        <h3 class="text-center text-uppercase">contact us</h3>
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-3 my-5">
                <div class="card border-0">
                    <div class="card-body text-center">
                        <i class="fa fa-phone fa-5x mb-3" aria-hidden="true"></i>
                        <h4 class="text-uppercase mb-5">call us</h4>
                        <p>+380955189394</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-3 my-5">
                <div class="card border-0">
                    <div class="card-body text-center">
                        <i class="fa fa-linkedin fa-5x mb-3" aria-hidden="true"></i>
                        <a href="https://www.linkedin.com/in/serhiidibrova"><h4 class="text-uppercase mb-5">
                            Linkedin</h4></a>
                        <address>serhiidibrova</address>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-3 my-5">
                <div class="card border-0">
                    <div class="card-body text-center">
                        <i class="fa fa-github-alt fa-5x mb-3" aria-hidden="true"></i>
                        <a href="https://github.com/SerhiiDibrova"><h4 class="text-uppercase mb-5">GitHub</h4></a>
                        <address>SerhiiDibrova</address>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-3 my-5">
                <div class="card border-0">
                    <div class="card-body text-center">
                        <i class="fa fa-globe fa-5x mb-3" aria-hidden="true"></i>
                        <h4 class="text-uppercase mb-5">email</h4>
                        <p>http://dibrova.sergiy@gmail.com</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
