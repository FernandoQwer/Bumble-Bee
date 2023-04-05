<%-- 
    Document   : orders
    Created on : Mar 26, 2023, 11:58:18 PM
    Author     : SANDUNI FERNANDO
--%>

<%@ include file="../includes/admin-header.jsp" %>
<%@ include file="../includes/admin-sidebar.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
        <h1 class="fs-1">Orders</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="admin/dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Orders</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row my-5">
            <div class="col-12 bg-white p-3 rounded shadow mx-2">
                <table id="ordersTable" class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th scope="col">#Order ID</th>
                            <th scope="col">Date</th> 
                            <th scope="col">Product</th>                            
                            <th scope="col">Amount</th> 
                            <th scope="col">Customer Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Mobile</th> 
                            <th scope="col text-center">Status</th>                            
                            <th scope="col">Actions</th> 
                        </tr>
                    </thead>
                    <tbody class="order-row">
                    </tbody>
                </table>
            </div>
        </div>
    </section>

</main><!-- End #main -->

<script>
    const orders_url = "http://localhost:8080/BumbleBee-WebServices/api/order/all";
    const cancel_order_url = "http://localhost:8080/BumbleBee-WebServices/api/order/update-status?id=";

    function cancelOrder(orderId) {
        $.ajax({
            type: "PATCH",
            url: cancel_order_url + orderId,
        }).done(function () {
            location.reload();
        });
    }


    // Get All Products
    $.ajax({
        type: "GET",
        url: orders_url,
        dataType: "json",
        success: function (response) {
            $.each(response, function (key, val) {

                let orderItems = "";
                $.each(val.orderItems, function (index, item) {
                    orderItems += "<strong>" + item.productName + "</strong> x" + item.qty + " LKR " + item.price + "<br>";
                });

                let status;
                let action = "";
                if (val.orderStatus === "pending") {
                    status = `<span class="badge bg-info">Pending</span>`;
                    action = `<button class="btn btn-sm btn-danger" onclick="cancelOrder(` + val.orderId + `)">Cancel</button>`;
                } else if (val.orderStatus === "purchased") {
                    status = `<span class="badge bg-success">Purchased</span>`;
                    action = `<button class="btn btn-sm btn-danger" onclick="cancelOrder(` + val.orderId + `)">Cancel</button>`;
                } else {
                    status = `<span class="badge bg-danger">Canceled</span>`;
                }

                var orderRow = `
                        <tr>
                            <td scope="row">` + val.orderId + `</td>
                            <td>` + val.orderDate + `</td>
                            <td>` + orderItems + `</td>                           
                            <td>LKR ` + val.amount + `</td>
                            <td>` + val.customerName + `</td>
                            <td>` + val.email + `</td>
                            <td>` + val.mobile + `</td>
                            <td>
                                ` + status + `
                            </td>
                            <td class="text-center">
                                ` + action + `
                            </td>
                        </tr>`;

                $(".order-row").append(orderRow);
            });
        }
    });

    $(document).ready(function () {
        setTimeout(function () {
            $('#ordersTable').DataTable();
        }, 500);
    });

</script>

<%@ include file="../includes/admin-footer.jsp" %>
