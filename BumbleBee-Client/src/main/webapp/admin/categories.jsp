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
                    <tbody class="categoryRow">

                    </tbody>
                </table>
            </div>
            <div class="col-md-4 col-12 bg-white p-4 rounded shadow mx-2">
                <h3 class="fw-bold">Add New Category</h3>

                <form class="mt-3" id="addNewCategory">
                    <div class="mb-3">
                        <label for="brandName" class="form-label">Category</label>
                        <input type="text" class="form-control" id="category">
                    </div>
                    <button type="submit" class="btn btn-primary">Add New Category</button>
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
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Update Category</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body update-modal">
                    <div class="mb-3">
                        <label for="category" class="form-label">Category Name</label>
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
    const categories_url = "http://localhost:8080/BumbleBee-WebServices/api/category/all";
    const category_add_new_url = "http://localhost:8080/BumbleBee-WebServices/api/category/add-new-category";

    // Delete Category
    function deleteCategory(id) {
        $.ajax({
            type: "DELETE",
            url: "http://localhost:8080/BumbleBee-WebServices/api/category/delete-category?id=" + id,
            dataType: "json",
            success: function (response) {
                location.reload();
            }
        });
    }

    // Update Category
    function updateCategory(id, category) {
        $(".update-input").empty();

        $('#updateModal').modal('show');

        var modelInputs = `
                <input type="text" class="form-control" id="updateCategory" name="updateCategory" value="` + category + `">
                <input type="hidden" id="id" value="` + id + `">`;

        $(".update-input").append(modelInputs);

        $("#updateCategory").val(category);
        $("#id").val(id);
    }


    // Get All Brands
    $.ajax({
        type: "GET",
        url: categories_url,
        dataType: "json",
        success: function (response) {
            console.log(response);
            $.each(response, function (key, val) {
                var categoryRow = `
                
                        <tr>
                            <th scope="row">` + val.id + `</th>
                            <td>` + val.category + `</td>                           
                            <td class="text-center">02</td>
                            <td class="text-center">
                                <a href="#" onclick="updateCategory(` + val.id + `, '` + val.category + `')">
                                    <i class="bi bi-pencil-square text-info"></i>
                                </a>                                
                                <a href="#" onclick="deleteCategory(` + val.id + `)">
                                    <i class="bi bi-trash text-danger"></i>
                                </a>
                            </td>
                        </tr>`;

                $(".categoryRow").append(categoryRow);
            });
        }
    });


    $(document).ready(function () {
        // Add New Category
        $("#addNewCategory").submit(function (event) {
            event.preventDefault();
            var formData = {
                category: $("#category").val()
            };

            $.ajax({
                type: "POST",
                url: category_add_new_url,
                contentType: 'application/json',
                data: JSON.stringify(formData),
                dataType: "json",
                encode: true
            }).done(function (data) {
                location.reload();
            });
        });

        // Update Category
        $("#updateCategoryForm").submit(function (event) {
            event.preventDefault();
            var categoryId = $("#id").val();

            var formData = {
                category: $("#updateCategory").val()
            };

            $.ajax({
                type: "PUT",
                url: "http://localhost:8080/BumbleBee-WebServices/api/category/update-category?id=" + categoryId,
                contentType: 'application/json',
                data: JSON.stringify(formData),
                dataType: "json",
                encode: true
            }).done(function (data) {
                location.reload();
            });
        });
    });
</script>

<%@ include file="../includes/admin-footer.jsp" %>
