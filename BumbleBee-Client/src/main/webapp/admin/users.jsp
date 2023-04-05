<%-- 
    Document   : users
    Created on : Mar 26, 2023, 11:58:05 PM
    Author     : SANDUNI FERNANDO
--%>


<%@ include file="../includes/admin-header.jsp" %>
<%@ include file="../includes/admin-sidebar.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
        <h1 class="fs-1">Registered Users</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="admin/dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Registered Users</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row my-5">
            <div class="col-12 bg-white p-3 rounded shadow mx-2">
                <table id="usersTable" class="display nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th scope="col">Customer ID</th>
                            <th scope="col">Customer Name</th>
                            <th scope="col text-center">Email</th>
                            <th scope="col text-center">Mobile</th>                             
                            <th scope="col">DOB</th> 
                            <th scope="col">NIC</th> 
                            <th scope="col">Registered At</th> 
                            <th scope="col">Credit Balance</th> 
                            <th scope="col text-center">Status</th>                            
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="customer-row">

                    </tbody>
                </table>
            </div>
        </div>
    </section>

</main><!-- End #main -->

<script>
    const get_customers_url = "http://localhost:8080/BumbleBee-WebServices/api/user/registered-customers";
    const update_status_url = "http://localhost:8080/BumbleBee-WebServices/api/user/change-status?user=";

    function changeStatus(userId, status) {
        $.ajax({
            type: "PATCH",
            url: update_status_url + userId + "&status=" + status
        }).done(function () {
            location.reload();
        });
    }


    // Get All Customers
    $.ajax({
        type: "GET",
        url: get_customers_url,
        dataType: "json",
        success: function (response) {
            $.each(response, function (key, value) {
                let status;
                let changeStatusBtn;

                if (value.status === "active") {
                    status = `<span class="badge bg-success">Active</span>`;
                    changeStatusBtn = `<button class="btn btn-sm btn-danger" onclick="changeStatus(` + value.id + `, 'blocked')">Block</button>`;
                } else {
                    status = `<span class="badge bg-danger">Blocked</span>`;
                    changeStatusBtn = `<button class="btn btn-sm btn-success" onclick="changeStatus(` + value.id + `, 'active')">Activate</button>`;
                }

                var customerRow = `
                <tr>
                    <td scope="row">` + value.customerId + `</td>
                    <td>` + value.firstName + ` ` + value.lastName + `</td>                           
                    <td>` + value.email + `</td>
                    <td>` + value.mobile + `</td>
                    <td>` + value.dob + `</td>
                    <td>` + value.nic + `</td>
                    <td>` + value.createdAt + `</td>
                    <td>LKR ` + value.creditBalance + `</td>
                    <td>` + status + `</td>
                    <td class="text-center">` + changeStatusBtn + `</td>
                </tr>`;

                $(".customer-row").append(customerRow);
            });
        }
    });

    $(document).ready(function () {
        setTimeout(function () {
            $('#usersTable').DataTable();
        }, 500);
    });
</script>

<%@ include file="../includes/admin-footer.jsp" %>