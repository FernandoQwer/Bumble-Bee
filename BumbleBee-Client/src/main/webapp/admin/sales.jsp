<%-- 
    Document   : sales
    Created on : Mar 29, 2023, 12:27:36 AM
    Author     : SANDUNI FERNANDO
--%>

<%@ include file="../includes/admin-header.jsp" %>
<%@ include file="../includes/admin-sidebar.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
        <h1 class="fs-1">Sales Report</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="admin/dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Sales Report</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row my-5">
            <div class="col-12 bg-white p-3 rounded shadow mx-2">
                <table id="salesTable" class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th scope="col">Order ID</th>
                            <th scope="col">Date</th>
                            <th scope="col">Products</th>
                            <th scope="col">Amount</th>                             
                            <th scope="col">Customer Name</th>  
                            <th scope="col text-center">Status</th>                            
                        </tr>
                    </thead>
                    <tbody class="sales-row">

                    </tbody>
                </table>
            </div>
        </div>
    </section>

</main><!-- End #main -->

<script>
    const _url = "http://localhost:8080/BumbleBee-WebServices/api/order/sales";
    
    // Get All Products
    $.ajax({
        type: "GET",
        url: _url,
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

                var order = `
                        <tr>
                            <td scope="row">` + val.orderId + `</td>
                            <td>` + val.orderDate + `</td>                           
                            <td>
                                ` + orderItems + `
                            </td>
                            <td>LKR ` + val.amount + `</td>
                            <td>` + val.customerName + `</td>
                            <td class="text-center">
                                 ` + status + `
                            </td>
                        </tr>`;

                $(".sales-row").append(order);
            });
        }
    });

    $(document).ready(function () {
        setTimeout(function () {
            $('#salesTable').DataTable();
        }, 500);
    });
</script>

<%@ include file="../includes/admin-footer.jsp" %>
