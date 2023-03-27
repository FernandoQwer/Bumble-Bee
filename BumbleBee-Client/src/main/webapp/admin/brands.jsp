<%-- 
    Document   : brands
    Created on : Mar 26, 2023, 11:56:00 PM
    Author     : SANDUNI FERNANDO
--%>


<%@ include file="../includes/admin-header.jsp" %>
<%@ include file="../includes/admin-sidebar.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Product Brands</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="admin/dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Brands</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <h2>Brands</h2>

        <div class="row my-4 d-flex justify-content-evenly">
            <div class="col-md-7 col-12 bg-white p-3 rounded shadow mx-2">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Brand Name</th>
                            <th scope="col"></th>                           
                            <th scope="col">Supplier</th>
                            <th scope="col">Products</th>                            
                            <th scope="col"></th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>ASUS</td>
                            <td>
                                <img src="../assets/images/brands/asus.png" width="120px" alt="Asus Logo">
                            </td>
                            <td>ABC Imports PVT Ltd</td>                            
                            <td class="text-center">02</td>
                            <td class="text-center">
                                <a href="#"><i class="bi bi-pencil-square text-info"></i></a>                                
                                <a href="#"><i class="bi bi-trash text-danger"></i></a>

                            </td>
                        </tr>

                        <tr>
                            <th scope="row">2</th>
                            <td>Apple</td>
                            <td>USA</td>
                            <td>GenNxt PVT Ltd</td>                            
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
                <h3 class="fw-bold">Add New Brand</h3>

                <form class="mt-3">
                    <div class="mb-3">
                        <label for="brandName" class="form-label">Brand Name</label>
                        <input type="text" class="form-control" id="brandName">
                    </div>
                    <div class="mb-3">
                        <label for="formFile" class="form-label">Logo</label>
                        <input class="form-control" type="file" id="formFile">
                    </div>
                    <div class="mb-3">
                        <label for="brandName" class="form-label">Supplier</label>
                        <input type="text" class="form-control" id="brandName">
                    </div>
                    <button type="submit" class="btn btn-primary">Add New Brand</button>
                </form>
            </div>
        </div>
    </section>

</main><!-- End #main -->


<%@ include file="../includes/admin-footer.jsp" %>
