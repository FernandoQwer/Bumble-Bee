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


<script>
    const brands_url = "http://localhost:8080/BumbleBee-WebServices/api/brands/all";
    const add_new_brand_url = "http://localhost:8080/BumbleBee-WebServices/api/brands/add-new-brand";


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
                                <img src="../` + val.imagePath + `" width="120px" alt="` + val.name + ` Logo">
                            </td>
                            <td>` + val.supplier + `</td>                            
                            <td class="text-center">02</td>
                            <td class="text-center">
                                <a href="#"><i class="bi bi-pencil-square text-info"></i></a>                                
                                <a href="#"><i class="bi bi-trash text-danger"></i></a>
                            </td>
                        </tr>`;

                $(".brandsRow").append(brandsRow);
            });
        }
    });


//    $(document).ready(function () {
//        // Add New Brand
//        $("#addNewBrand").submit(function (event) {
//
//            var formData = {
//                name: $("#brandName").val(),
//                supplier: $("#supplier").val(),
//                logo: $('#logo')[0].files[0];
//            };
//
//            var formData = new FormData();
//            formData.append('name', name);
//            formData.append('supplier', price);
//            formData.append('image', logo);
//
//            // Create New Brand
//            $.ajax({
//                url: add_new_brand_url,
//                type: 'POST',
//                data: formData,
//                processData: false,
//                contentType: false,
//                success: function (response) {
//                    alert(response);
//                },
//                error: function (xhr, status, error) {
//                    alert("Error: " + error);
//                }
//            });
//        });
//    });

</script>

<%@ include file="../includes/admin-footer.jsp" %>
