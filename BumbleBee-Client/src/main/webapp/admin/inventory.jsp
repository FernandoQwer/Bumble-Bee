<%-- 
    Document   : inventory
    Created on : Mar 28, 2023, 8:10:58 PM
    Author     : SANDUNI FERNANDO
--%>

<%@ include file="../includes/admin-header.jsp" %>
<%@ include file="../includes/admin-sidebar.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
        <h1 class="fs-1">Inventory</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="admin/dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Inventory</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row my-5">
            <div class="col-12 bg-white p-3 rounded shadow mx-2">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#Product ID</th>
                            <th scope="col">Product Name</th>
                            <th scope="col text-center">Available Qty</th>
                            <th scope="col text-center">Sale Qty</th>                             
                            <th scope="col">Created At</th> 
                            <th scope="col">Updated At</th> 
                            <th scope="col text-center">Status</th>                            
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td scope="row">1</td>
                            <td>MSI Laptop</td>                           
                            <td class="text-center">02</td>
                            <td class="text-center">01</td>
                            <td>2023/03/14 12.00</td>
                            <td>2023/03/14 12.00</td>
                            <td>
                                <span class="badge bg-success">In-Stock</span>
                            </td>
                            <td class="text-center">
                                <a href="#"><i class="bi bi-pencil-square text-info"></i></a>                                
                                <a href="#"><i class="bi bi-trash text-danger"></i></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

</main><!-- End #main -->


<%@ include file="../includes/admin-footer.jsp" %>