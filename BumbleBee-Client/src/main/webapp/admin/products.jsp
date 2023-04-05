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
            <tbody class="productRow">
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
                        <input type="text" class="form-control" id="productName" required>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="category" class="form-label">Category</label>
                        <select id="category" class="form-select categoryOptions" required>

                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="brand" class="form-label">Brand</label>
                        <select id="brand" class="form-select brandsOptions" required>
                        </select>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-md-8 col-12">
                            <label for="price" class="form-label">Price</label>
                            <input type="text" class="form-control" id="price" required>
                        </div>
                        <div class="col-md-4 col-12">
                            <label for="qty" class="form-label">Qty</label>
                            <input type="text" class="form-control" id="qty" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="productImage" class="form-label">Product Image</label>
                        <input class="form-control" type="file" id="productImage" required>
                    </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            </form>
        </div>
    </div>
</div>


<script>
    const all_products_url = "http://localhost:8080/BumbleBee-WebServices/api/product/all";
    const delete_product_url = "http://localhost:8080/BumbleBee-WebServices/api/product/delete?product=";
    const categories_url = "http://localhost:8080/BumbleBee-WebServices/api/category/all";
    const brands_url = "http://localhost:8080/BumbleBee-WebServices/api/brands/all";
    const add_new_product_url = "http://localhost:8080/BumbleBee-WebServices/api/product/add-new-product";
    // Delete Product
    function deleteProduct(productId) {
        $.ajax({
            type: "PATCH",
            url: delete_product_url + productId
        }).done(function () {
            location.reload();
        });
    }


    // Get All Products
    $.ajax({
        type: "GET",
        url: all_products_url,
        dataType: "json",
        success: function (response) {
            $.each(response, function (key, val) {
                let stockStatus;
                if (val.qty === 0) {
                    stockStatus = `<span class="badge bg-danger">Out of Stock</span>`;
                } else if (val.qty <= 5 && val.qty >= 1) {
                    stockStatus = `<span class="badge bg-warning">Low Stock</span>`;
                } else {
                    stockStatus = `<span class="badge bg-success">In-Stock</span>`;
                }

                var productRow = `
                <tr>
                    <th scope="row">` + val.id + `</th>
                    <td>
                        <img src="` + val.imagePath + `" width="120px">
                    </td>
                    <td>` + val.name + `</td>
                    <td>` + val.description + `</td>
                    <td>` + val.brand + `</td>                     
                    <td>` + val.category + `</td>
                    <td>LKR ` + val.price + `</td>
                    <td>` + val.qty + `</td>
                    <td>
                        ` + stockStatus + `
                    </td>
                    <td>
                    <a href="#"><i class="bi bi-pencil-square text-info"></i></a>                                
                    <a href="#" onclick="deleteProduct(` + val.id + `)"><i class="bi bi-trash text-danger"></i></a>
                    </td>
                </tr>`;

                $(".productRow").append(productRow);
            });
        }
    });


    $(document).ready(function () {

        const form = $('#addNewProductForm');
        const inputElement = $('#productImage');

        inputElement.on('change', (event) => {
            const file = event.target.files[0];
            const reader = new FileReader();

            reader.onloadend = () => {
                let imageData = reader.result;

                form.on('submit', (event) => {
                    event.preventDefault();

                    var formData = {
                        name: $("#productName").val(),
                        description: $("#description").val(),
                        price: $("#price").val(),
                        qty: $("#qty").val(),
                        brand: $("#brand").val(),
                        category: $("#category").val(),
                        imagePath: imageData
                    };
                    
                    console.log(formData);

                    $.ajax({
                        url: add_new_product_url,
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(formData),
                        dataType: "json",
                        encode: true,
                        success: function (response) {
                            location.reload();
                        },
                        error: function (xhr, status, error) {
                            console.log('Form submission error: ' + error);
                        }
                    });
                });
            };

            reader.readAsDataURL(file);
        });
    });



    $.ajax({
        type: "GET",
        url: categories_url,
        dataType: "json",
        success: function (response) {
            $.each(response, function (key, val) {
                var category = `<option selected value="` + val.id + `">` + val.category + `</option>`;

                $(".categoryOptions").append(category);
            });
        }
    });

    $.ajax({
        type: "GET",
        url: brands_url,
        dataType: "json",
        success: function (response) {
            $.each(response, function (key, val) {
                var brand = `<option selected value="` + val.id + `">` + val.name + `</option>`;
                $(".brandsOptions").append(brand);
            });
        }
    });

</script>

<%@ include file="../includes/admin-footer.jsp" %>