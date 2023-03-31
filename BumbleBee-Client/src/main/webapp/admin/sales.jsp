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
                            <th scope="col">Loan ID</th> 
                            <th scope="col text-center">Status</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td scope="row">1</td>
                            <td>2023/02/15</td>                           
                            <td>
                                PS4 x Rs 3,500.00
                            </td>
                            <td>LKR 3,500.00</td>
                            <td>Jane Doe</td>
                            <td>2</td>
                            <td>
                                <span class="badge bg-success">Success</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

</main><!-- End #main -->

<script>
    $(document).ready(function () {
        $('#salesTable').DataTable();
    });
</script>

<%@ include file="../includes/admin-footer.jsp" %>
