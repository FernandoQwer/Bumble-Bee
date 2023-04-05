<%-- 
Document : footer 
Created on : Mar 16, 2023, 11:45:42 PM 
Author : SANDUNI FERNANDO 
--%>

<!-- Footer -->
<footer class="text-center text-lg-start text-white pt-2" style="background-color: #1c2331;">


    <!-- Section: Links  -->
    <section>
        <div class="container text-center text-md-start mt-5">
            <!-- Grid row -->
            <div class="row mt-3">
                <!-- Grid column -->
                <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                    <!-- Content -->
                    <h6 class="text-uppercase fw-bold">Bumble Bee</h6>
                    <hr class="mb-4 mt-0 d-inline-block mx-auto"
                        style="width: 60px; background-color: #7c4dff; height: 2px" />
                    <p>
                        Bumble bee: Buy first and pay later!
                        Online loan offering system to buy items in installments.
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold">Useful Links</h6>
                    <hr class="mb-4 mt-0 d-inline-block mx-auto"
                        style="width: 60px; background-color: #7c4dff; height: 2px" />
                    <p>
                        <a href="#!" class="text-white">Home</a>
                    </p>
                    <p>
                        <a href="#" class="text-white">Your Account</a>
                    </p>
                    <p>
                        <a href="#!" class="text-white">Register</a>
                    </p>
                    <p>
                        <a href="#!" class="text-white">Store</a>
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold">Company</h6>
                    <hr class="mb-4 mt-0 d-inline-block mx-auto"
                        style="width: 60px; background-color: #7c4dff; height: 2px" />
                    <p>
                        <a href="#" class="text-white">About</a>
                    </p>
                    <p>
                        <a href="#" class="text-white">Contact Us</a>
                    </p>
                    <p>
                        <a href="#" class="text-white">Terms and Conditions</a>
                    </p>
                    <p>
                        <a href="#" class="text-white">FAQ</a>
                    </p>
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold">Contact</h6>
                    <hr class="mb-4 mt-0 d-inline-block mx-auto"
                        style="width: 60px; background-color: #7c4dff; height: 2px" />
                    <p><i class="fas fa-home"></i><span class="m-3">123, D S Jayasinghe Mawatha</span><br><span style="margin-left: 35px;">Nugegoda, Sri Lanka</span></p>
                    <p><i class="fas fa-envelope"></i><span class="m-3">info@bumblebee.com</span></p>
                    <p><i class="fas fa-phone"></i><span class="m-3">+94 77 712 3456</span></p>
                </div>
                <!-- Grid column -->
            </div>
            <!-- Grid row -->
        </div>
    </section>
    <!-- Section: Links  -->

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
        © 2023 Copyright:
        <a class="text-white" href="#">Bumble Bee</a>
    </div>
    <!-- Copyright -->
</footer>
<!-- Footer -->

<script>
    let userId = Cookies.get('userId');
    let userRole = Cookies.get('role');
    let loginBtn;

    if (userId === undefined) {
        loginBtn = `<a href="login.jsp" type="button" class="btn btn-outline-light rounded-pill btn-lg px-4">Login</a>`;
        $(".nav-btn").append(loginBtn);
    } else {
        loginBtn = `<a href="admin/dashboard.jsp" type="button" class="btn btn-outline-light rounded-pill btn-lg px-4">Admin Panel</a>`;
        $(".nav-btn").append(loginBtn);
    }
</script>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
crossorigin="anonymous"></script>
</body>

</html>