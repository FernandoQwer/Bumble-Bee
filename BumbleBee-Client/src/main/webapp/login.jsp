<%-- 
    Document   : login
    Created on : Mar 20, 2023, 7:40:34 PM
    Author     : SANDUNI FERNANDO
--%>

<%@ include file="includes/header.jsp" %>

<div class="container" style="padding-top: 100px; padding-bottom: 100px;">
    <!--Login Form Starts-->
    <div class="row">
        <div class="col-md-8 col-12 mx-auto shadow rounded">
            <div class="row px-0">
                <div class="col-6 px-0">
                    <img src="assets/images/login-01.png" width="100%" alt="alt"/>
                </div>
                <div class="col-6 p-5">  
                    <h3 class="mb-3 mt-5">Login to continue</h3>
                    <form class="login-form" id="loginForm">
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="email" aria-describedby="emailHelp">
                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password">
                        </div>
                        <button type="button" id="loginBtn" class="btn btn-primary rounded-pill px-4 mt-2">Sign In</button>
                    </form> 
                    <p>New User? <a href="register.jsp">Sign Up</a></<p>
                </div>
            </div>
        </div>
    </div>
    <!--Login Form Ends-->
</div>

<script>

    const login_url = "http://localhost:8080/BumbleBee-WebServices/api/user/login";

    $(document).ready(function () {

        $("#loginBtn").click(function (event) {
            event.preventDefault();

            var formData = {
                email: $("#email").val(),
                password: $("#password").val()
            };

            $.ajax({
                type: "POST",
                url: login_url,
                contentType: 'application/json',
                data: JSON.stringify(formData),
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    Cookies.set('userId', data.userId);
                    Cookies.set('role', data.role);

                    if (data.role === "admin") {
                        window.location.replace("admin/dashboard.jsp");
                    }
                },
                error: function (data) {
                    console.log(data.responseJSON);

                }
            });
        });
    });

</script>

<%@ include file="includes/footer.jsp" %>

