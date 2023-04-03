<%-- 
    Document   : register
    Created on : Mar 20, 2023, 10:59:27 PM
    Author     : SANDUNI FERNANDO
--%>


<%@ include file="includes/header.jsp" %>

<div class="container" style="padding-top: 60px; padding-bottom: 60px;">
    <!--Login Form Starts-->
    <div class="row">
        <div class="col-md-6 col-12 mx-auto shadow rounded p-5">

            <h3 class="mb-4 text-center">Registration</h3>
            <form class="row g-3" id="register">
                <div class="col-md-6">
                    <label for="firstName" class="form-label">First Name</label>
                    <input type="text" class="form-control" id="firstName" required>
                </div>
                <div class="col-md-6">
                    <label for="lastName" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="lastName" required>
                </div>
                <div class="col-md-12">
                    <label for="inputEmail4" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" required>
                </div>

                <div class="col-md-6">
                    <label for="nic" class="form-label">NIC</label>
                    <input type="text" class="form-control" id="nic" required>
                </div>
                <div class="col-md-6">
                    <label for="dateOfBirth" class="form-label">Date of Birth</label>
                    <input type="date" class="form-control" id="dob" required>
                </div>

                <div class="col-12">
                    <label for="inputAddress" class="form-label">Address Line 1</label>
                    <input type="text" class="form-control" id="addressLineOne" required>
                </div>
                <div class="col-12">
                    <label for="inputAddress2" class="form-label">Address Line 2</label>
                    <input type="text" class="form-control" id="addressLineTwo" required>
                </div>
                <div class="col-md-6">
                    <label for="inputCity" class="form-label">City</label>
                    <input type="text" class="form-control" id="city" required>
                </div>
                <div class="col-md-6">
                    <label for="inputCity" class="form-label">Mobile</label>
                    <input type="text" class="form-control" id="mobile" required>
                </div>

                <div class="col-md-6">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" required>
                </div>
                <div class="col-md-6">
                    <label for="confirmPassword" class="form-label">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" required>
                </div>

                <div class="col-12">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="isAgreed" required>
                        <label class="form-check-label" for="gridCheck">
                            I read and agree to <a href="#">Terms & Conditions</a>
                        </label>
                    </div>
                </div>

                <div class="col-12 text-center mt-3">
                    <button type="button" id="registerBtn" class="btn btn-primary rounded-pill px-4 mt-2">Create New Account</button>                  
                    <p class="mt-3">Already have an account? <a href="login.jsp">Sign In</a></<p>
                </div>
            </form>
        </div>
    </div>
    <!--Login Form Ends-->
</div>

<script>

    $("#registerBtn").click(function (event) {
        event.preventDefault();

        var formData = {
            email: $("#email").val(),
            password: $("#password").val(),
            firstName: $("#firstName").val(),
            lastName: $("#lastName").val(),
            nic: $("#nic").val(),
            mobile: $("#mobile").val(),
            addressLineOne: $("#addressLineOne").val(),
            addressLineTwo: $("#addressLineTwo").val(),
            city: $("#city").val(),
            dob: $("#dob").val()
        };

        $.ajax({
            url: 'http://localhost:8080/BumbleBee-WebServices/api/user/customer-register',
            type: 'POST',
            data: JSON.stringify(formData),
            contentType: 'application/json',
            success: function (response) {
                window.location.replace("customer.jsp");
            },
            error: function (xhr, status, error) {
                console.log('Form submission error: ' + error);
            }
        });

    });




</script>
<%@ include file="includes/footer.jsp" %>