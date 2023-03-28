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
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>1</td>                           
                            <td>Rs. 12,000.00</td>
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
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Rs. 4,000.00</td>
                                            <td>2023/03/15</td>
                                            <td>
                                                <span class="badge bg-success">Paid</span>
                                            </td>
                                        <tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Rs. 4,000.00</td>
                                            <td>2023/03/15</td>
                                            <td>
                                                <span class="badge bg-secondary">Pending</span>
                                            </td>
                                        <tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Rs. 4,000.00</td>
                                            <td>2023/03/15</td>
                                            <td>
                                                <span class="badge bg-secondary">Pending</span>
                                            </td>
                                        <tr>
                                    </tbody>
                                </table>
                            </td>
                            <td>
                                Jane Doe<br>077 123 4567<br>2000000000X
                            </td>
                            <td>2022/04/15</td>
                            <td class="text-center">
                                <span class="badge bg-warning">Active</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

</main><!-- End #main -->


<%@ include file="../includes/admin-footer.jsp" %>
