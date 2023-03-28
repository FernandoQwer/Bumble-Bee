<%-- 
    Document   : products
    Created on : Mar 20, 2023, 11:28:56 PM
    Author     : SANDUNI FERNANDO
--%>

<%@ include file="../includes/admin-header.jsp" %>
<%@ include file="../includes/admin-sidebar.jsp" %>


<main id="main" class="main">

    <div class="pagetitle">
        <h1>Products</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="admin/dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Products</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <div class="bg-white rounded p-4 shadow my-4">
        <div class="row">
            <div class="col-6">
                <h2 class="mb-3">Products</h2>
            </div>
            <div class="col-6">
                <a type="button" class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#addNewProduct">Add New Product</a>
            </div>
        </div>


        <!-- Table with hoverable rows -->
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Image</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Brand</th>
                    <th scope="col">Category</th>
                    <th scope="col">Price</th>
                    <th scope="col">Qty</th>                    
                    <th scope="col">Status</th>
                    <th scope="col"></th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>
                        <img src="../assets/images/MSI-Laptop-i7.jpg" width="200px" alt="MSI Laptop">
                    </td>
                    <td>MSI Laptop</td>
                    <td>GeForce GTX 1050 TI <br>
                        GAMING X 4G, 4GB </td>
                    <td>MSI</td>                     
                    <td>Laptop</td>
                    <td>$175.89</td>
                    <td>17</td>
                    <td>
                        <span class="badge bg-success">In-Stock</span>
                    </td>
                    <td>
                        <a href="#"><i class="bi bi-pencil-square text-info"></i></a>                                
                        <a href="#"><i class="bi bi-trash text-danger"></i></a>
                    </td>

                </tr>
            </tbody>
        </table>
        <!-- End Table with hoverable rows -->
    </div>

</main><!-- End #main -->


<!-- Modal -->
<div class="modal fade" id="addNewProduct" tabindex="-1" aria-labelledby="addNewProductLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Add New Product</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addNewProductForm">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="productName">
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="category" class="form-label">Category</label>
                        <select id="category" class="form-select">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="brand" class="form-label">Brand</label>
                        <select id="brand" class="form-select">
                            <option selected>Choose...</option>
                            <option>...</option>
                        </select>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-md-8 col-12">
                            <label for="price" class="form-label">Price</label>
                            <input type="text" class="form-control" id="price">
                        </div>
                        <div class="col-md-4 col-12">
                            <label for="qty" class="form-label">Qty</label>
                            <input type="text" class="form-control" id="qty">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="productImage" class="form-label">Product Image</label>
                        <input class="form-control" type="file" id="productImage">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </div>
</div>


<%@ include file="../includes/admin-footer.jsp" %>