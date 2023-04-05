<%-- 
    Document   : dashboard
    Created on : Mar 20, 2023, 11:03:43 PM
    Author     : SANDUNI FERNANDO
--%>

<%@ include file="../includes/admin-header.jsp" %>
<%@ include file="../includes/admin-sidebar.jsp" %>


<main id="main" class="main">

    <div class="pagetitle">
        <h1 class="fs-1">Dashboard</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="admin/dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Dashboard</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <!-- Sales Card -->
            <div class="col-xxl-4 col-md-4">
                <div class="card info-card sales-card">
                    <div class="card-body">
                        <h5 class="card-title fs-4">Total Products</h5>

                        <div class="d-flex align-items-center">
                            <div class="d-flex align-items-center justify-content-center" 
                                 style="font-size: 32px; line-height: 0; height: 64px; width: 64px; border-radius: 50%!important; background: #e0f8e9;">
                                <i class="bi bi-cart"></i>
                            </div>
                            <div class="ps-3">
                                <h6 class="fs-2 fw-bolder" style="color: #012970;" id="totalProducts">00</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- End Sales Card -->

            <!-- Sales Card -->
            <div class="col-xxl-4 col-md-4">
                <div class="card info-card sales-card">
                    <div class="card-body">
                        <h5 class="card-title fs-4">Total Earnings</h5>

                        <div class="d-flex align-items-center">
                            <div class="d-flex align-items-center justify-content-center" 
                                 style="font-size: 32px; line-height: 0; height: 64px; width: 64px; border-radius: 50%!important; background: #e0f8e9;">
                                <i class="bi bi-currency-dollar"></i>
                            </div>
                            <div class="ps-3">
                                <h6 class="fs-2 fw-bolder" style="color: #012970;" id="totalEarnings"></h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- End Sales Card -->

            <!-- Sales Card -->
            <div class="col-xxl-4 col-md-4">
                <div class="card info-card sales-card">
                    <div class="card-body">
                        <h5 class="card-title fs-4">Registered Customers</h5>

                        <div class="d-flex align-items-center">
                            <div class="d-flex align-items-center justify-content-center" 
                                 style="font-size: 32px; line-height: 0; height: 64px; width: 64px; border-radius: 50%!important; background: #e0f8e9;">
                                <i class="bi bi-people"></i>
                            </div>
                            <div class="ps-3">
                                <h6 class="fs-2 fw-bolder" style="color: #012970;" id="regCustomers">00</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- End Sales Card -->


            <div class="col-6">
                <div class="card recent-sales p-4">
                    <div class="card-body">
                        <h5 class="card-title fs-4">Recent Orders</h5>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Customer Name</th>
                                    <th scope="col">Mobile</th>
                                    <th scope="col">Amount</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody class="order-row">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div><!-- End Recent Sales -->

            <!-- Recent Sales -->
            <div class="col-6">
                <div class="card recent-sales p-4">
                    <div class="card-body">
                        <h5 class="card-title fs-4">New Users</h5>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Mobile</th>
                                    <th scope="col">Date</th>
                                </tr>
                            </thead>
                            <tbody class="customer-row">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div><!-- End Recent Sales -->


        </div>
    </section>

</main><!-- End #main -->

<script>
    const _dashboard_data_url = "http://localhost:8080/BumbleBee-WebServices/api/dashboard/data";
    const _recent_orders_url = "http://localhost:8080/BumbleBee-WebServices/api/dashboard/recent-orders";
    const _new_users_url = "http://localhost:8080/BumbleBee-WebServices/api/dashboard/new-customers";


    $.ajax({
        type: "GET",
        url: _dashboard_data_url,
        dataType: "json",
        success: function (response) {
            let formattedNum = response.totalEarnings.toLocaleString('en-US', {style: 'currency', currency: 'LKR'});

            $("#totalEarnings").append(formattedNum);
            $("#totalProducts").append(response.totalProducts);
            $("#regCustomers").append(response.regCustomers);
        }
    });

    $.ajax({
        type: "GET",
        url: _recent_orders_url,
        dataType: "json",
        success: function (response) {
            $.each(response, function (key, value) {

                let status;
                if (value.orderStatus === "pending") {
                    status = `<span class="badge bg-info">Pending</span>`;
                } else if (value.orderStatus === "purchased") {
                    status = `<span class="badge bg-success">Purchased</span>`;
                } else {
                    status = `<span class="badge bg-danger">Canceled</span>`;
                }

                var order = `
                        <tr>
                            <th scope="row"><a href="#">` + value.orderId + `</a></th>
                            <td>` + value.orderDate + `</td>
                            <td>` + value.customerName + `</td>
                            <td>` + value.mobile + `</td>
                            <td>LKR ` + value.amount + `</td>
                            <td>` + status + `</td>
                        </tr>
                `;

                $(".order-row").append(order);
            });
        }
    });


    $.ajax({
        type: "GET",
        url: _new_users_url,
        dataType: "json",
        success: function (response) {
            $.each(response, function (key, value) {
                var customer = `
                        <tr>
                            <th scope="row">` + value.customerId + `</th>
                            <td>` + value.firstName + ` ` + value.lastName + `</td>
                            <td>` + value.email + `</td>
                            <td>` + value.mobile + `</td>
                            <td>` + value.createdAt + `</td>
                        </tr>
                `;

                $(".customer-row").append(customer);
            });
        }
    });
</script>
<%@ include file="../includes/admin-footer.jsp" %>
