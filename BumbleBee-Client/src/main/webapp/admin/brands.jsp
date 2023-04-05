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
                    <tbody class="brandsRow">
                    </tbody>

                </table>
            </div>
            <div class="col-md-4 col-12 bg-white p-4 rounded shadow mx-2">
                <h3 class="fw-bold">Add New Brand</h3>

                <form class="mt-3" id="addNewBrand">
                    <div class="mb-3">
                        <label for="brandName" class="form-label">Brand Name</label>
                        <input type="text" class="form-control" id="brandName">
                    </div>
                    <div class="mb-3">
                        <label for="formFile" class="form-label">Logo</label>
                        <input class="form-control" type="file" id="logo">
                    </div>
                    <div class="mb-3">
                        <label for="brandName" class="form-label">Supplier</label>
                        <input type="text" class="form-control" id="supplier">
                    </div>
                    <button type="submit" class="btn btn-primary">Add New Brand</button>
                </form>
            </div>
        </div>
    </section>

</main><!-- End #main -->

<!-- Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="updateCategoryForm">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Update Brand</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body update-modal">
                    <div class="mb-3">
                        <div class="update-input"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    const brands_url = "http://localhost:8080/BumbleBee-WebServices/api/brands/all";
    const add_new_brand_url = "http://localhost:8080/BumbleBee-WebServices/api/brands/add-new-brand";
    const delete_brand_url = "http://localhost:8080/BumbleBee-WebServices/api/brands/delete-brand?id=";

    // Delete Category
    function deleteBrand(id) {
        $.ajax({
            type: "DELETE",
            url: delete_brand_url + id,
            success: function (response) {
                location.reload();
            }
        });
    }

    // Update Category
    function updateBrand(id, brand, image) {
        $(".update-input").empty();

        $('#updateModal').modal('show');

        var modelInputs = `
                <img src="` + image + `" width="150px" class="mb-5">
                <br>
                <label for="brandName" class="form-label">Brand Name</label>
                <input type="text" class="form-control" id="updateBrand" name="updateBrand" value="` + brand + `">
                <label for="formFile" class="form-label mt-2">Logo</label>
                <input class="form-control" type="file" id="updateLogo">
                <input type="hidden" id="id" value="` + id + `">`;

        $(".update-input").append(modelInputs);

        $("#updateCategory").val(category);
        $("#id").val(id);
    }


    // Get All Brands
    $.ajax({
        type: "GET",
        url: brands_url,
        dataType: "json",
        success: function (response) {
            console.log(response);
            $.each(response, function (key, val) {
                var brandsRow = `
                        <tr>
                            <th scope="row">` + val.id + `</th>
                            <td>` + val.name + `</td>
                            <td>
                                <img src="` + val.imagePath + `" width="120px" alt="` + val.name + ` Logo">
                            </td>
                            <td>` + val.supplier + `</td>                            
                            <td class="text-center">02</td>
                            <td class="text-center">
                                <a href="#"><i class="bi bi-pencil-square text-info" onclick="updateBrand(` + val.id + `, '` + val.name + `', '` + val.imagePath + `')"></i></a>                                
                                <a href="#"><i class="bi bi-trash text-danger" onclick="deleteBrand(` + val.id + `)"></i></a>
                            </td>
                        </tr>`;

                $(".brandsRow").append(brandsRow);
            });
        }
    });


    $(document).ready(function () {

        const form = $('#addNewBrand');
        const inputElement = $('#logo');

        inputElement.on('change', (event) => {
            const file = event.target.files[0];
            const reader = new FileReader();

            reader.onloadend = () => {
                let imageData = reader.result;

                form.on('submit', (event) => {
                    event.preventDefault();

                    var formData = {
                        name: $("#brandName").val(),
                        supplier: $("#supplier").val(),
                        imagePath: imageData
                    };

                    console.log(formData);

                    $.ajax({
                        url: add_new_brand_url,
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(formData),
                        dataType: "json",
                        encode: true,
                        success: function (response) {
                            location.reload();
                        }
                    });
                });
            };

            reader.readAsDataURL(file);
        });


    });

</script>

<%@ include file="../includes/admin-footer.jsp" %>
