<%-- 
    Document   : loans
    Created on : Mar 28, 2023, 8:11:13 PM
    Author     : SANDUNI FERNANDO
--%>


<%@ include file="../includes/admin-header.jsp" %>
<%@ include file="../includes/admin-sidebar.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
        <h1 class="fs-1">Loans</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="admin/dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Loans</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row my-4">
            <div class="col-12 bg-white p-3 rounded shadow mx-2">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Loan ID</th>
                            <th scope="col">Order ID</th>
                            <th scope="col">Loan Amount</th>
                            <th scope="col" class="text-center">Loan Installments</th>
                            <th scope="col">Customer Details</th>
                            <th scope="col">Loan Date</th>                            
                            <th scope="col" class="text-center">Loan Status</th>

                        </tr>
                    </thead>
                    <tbody class="loan-row">
                    </tbody>
                </table>
            </div>
        </div>
    </section>

</main><!-- End #main -->

<script>
    const loans_url = "http://localhost:8080/BumbleBee-WebServices/api/loan/all";


    // Get All Loans
    $.ajax({
        type: "GET",
        url: loans_url,
        dataType: "json",
        success: function (response) {
            $.each(response, function (key, value) {

                // Loan Installments
                let loanInstallments = "";
                $.each(value.loanInstallments, function (index, loanInstallment) {
                    let installmentStatus;

                    if (loanInstallment.installmentStatus === "paid") {
                        installmentStatus = `<span class="badge bg-success">Paid</span>`;
                    } else {
                        installmentStatus = `<span class="badge bg-secondary">Pending</span>`;

                    }

                    loanInstallments += `<tr>
                                            <td>` + loanInstallment.installmentNo + `</td>
                                            <td>LKR ` + value.monthlyInstallment + `</td>
                                            <td>` + loanInstallment.dueDate + `</td>
                                            <td>` + installmentStatus + `</td>
                                        <tr>`;
                });

                let status;

                if (value.loanstatus === "pending") {
                    status = `<span class="badge bg-info">Pending</span>`;
                } else if (value.loanstatus === "paid") {
                    status = `<span class="badge bg-success">paid</span>`;
                } else {
                    status = `<span class="badge bg-danger">Canceled</span>`;
                }

                var loanRow = `<tr>
                                    <th scope="row">`+ value.loanId +`</th>
                                    <td>`+ value.orderId +`</td>                           
                                    <td>LKR `+ value.loanAmount +`</td>
                                    <td>
                                        <table class="table table-borderless">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Installment</th>
                                                    <th scope="col">Amount</th>
                                                    <th scope="col">Due date</th>
                                                    <th scope="col">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>`+ loanInstallments +`</tbody>
                                        </table>
                                    </td>
                                    <td>
                                        `+ value.customerName +`<br>`+ value.customerMobile +`<br>`+ value.customerNIC +`
                                    </td>
                                    <td>`+ value.loanDate +`</td>
                                    <td class="text-center">
                                        <span class="badge bg-warning">Active</span>
                                    </td>
                                </tr>`;

                $(".loan-row").append(loanRow);
            });
        }
    });
</script>

<%@ include file="../includes/admin-footer.jsp" %>
