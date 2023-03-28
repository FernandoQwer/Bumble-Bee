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
                <table class="table table-hover">
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
                    <tbody>
                        <tr>
                            <td scope="row">1</td>
                            <td>2023/03/14</td>
                            <td>MSI Laptop x1 Rs 80,000.00</td>                           
                            <td>Rs. 80,000.00</td>
                            <td>Ashani Fernando</td>
                            <td>ashani@gmail.com</td>
                            <td>077 712 3456</td>
                            <td>
                                <span class="badge bg-success">In-Stock</span>
                            </td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-primary">view</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

</main><!-- End #main -->


<%@ include file="../includes/admin-footer.jsp" %>
