<%-- 
    Document   : categories
    Created on : Mar 26, 2023, 11:56:13 PM
    Author     : SANDUNI FERNANDO
--%>

<%@ include file="../includes/admin-header.jsp" %>
<%@ include file="../includes/admin-sidebar.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Product Categories</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="admin/dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Categories</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <h2>Categories</h2>

        <div class="row my-4 d-flex justify-content-evenly">
            <div class="col-md-7 col-12 bg-white p-3 rounded shadow mx-2">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Category</th>
                            <th scope="col text-center">Total Products</th>                            
                            <th scope="col"></th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Laptop</td>                           
                            <td class="text-center">02</td>
                            <td class="text-center">
                                <a href="#"><i class="bi bi-pencil-square text-info"></i></a>                                
                                <a href="#"><i class="bi bi-trash text-danger"></i></a>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row">2</th>
                            <td>Mobile Devices</td>                          
                            <td class="text-center">12</td>
                            <td class="text-center">
                                <a href="#"><i class="bi bi-pencil-square text-info"></i></a>                                
                                <a href="#"><i class="bi bi-trash text-danger"></i></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-4 col-12 bg-white p-4 rounded shadow mx-2">
                <h3 class="fw-bold">Add New Category</h3>

                <form class="mt-3">
                    <div class="mb-3">
                        <label for="brandName" class="form-label">Category</label>
                        <input type="text" class="form-control" id="brandName">
                    </div>
                    <button type="submit" class="btn btn-primary">Add New Category</button>
                </form>
            </div>
        </div>
    </section>

</main><!-- End #main -->


<%@ include file="../includes/admin-footer.jsp" %>
