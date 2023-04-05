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
                            <th scope="col text-center">Total Qty</th>
                            <th scope="col text-center">Sale Qty</th>
                            <th scope="col text-center">Available Qty</th>
                            <th scope="col">Created At</th> 
                            <th scope="col">Updated At</th> 
                            <th scope="col text-center">Status</th>                            
                            <th scope="col" class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="product-row">
                    </tbody>
                </table>
            </div>
        </div>
    </section>

</main><!-- End #main -->

<!-- Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="inventoryUpdateForm">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Inventory Update</h1>
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
    const _url = "http://localhost:8080/BumbleBee-WebServices/api/product/inventory";
    const _update_url = "http://localhost:8080/BumbleBee-WebServices/api/product/update/qty?product=";


    function update(productId, productName, availableQty, totalQty) {
        $(".update-input").empty();

        $('#updateModal').modal('show');

        var modelInputs = `
                <label for="category" class="form-label">` + productName + `</label>
                <input type="text" class="form-control" id="newQty" name="newQty" value="` + availableQty + `">
                <input type="hidden" id="id" value="` + productId + `">
                <input type="hidden" id="avbQty" value="` + availableQty + `">
                <input type="hidden" id="totalQty" value="` + totalQty + `">`;

        $(".update-input").append(modelInputs);

        $("#newQty").val(availableQty);
        $("#id").val(productId);
    }

    function calculateQty(totalQty, avbQty, newQty) {
        var quanitity = totalQty;

        if (newQty === 0) {
            quanitity = totalQty - avbQty;
        } else if (avbQty < newQty) {
            quanitity = totalQty + (newQty - avbQty);
        } else if (avbQty > newQty) {
            quanitity = totalQty - (avbQty - newQty);
        }

        return quanitity;
    }


    // Inventory Data
    $.ajax({
        type: "GET",
        url: _url,
        dataType: "json",
        success: function (response) {
            $.each(response, function (key, value) {
                let avbQty = value.qty - value.saleQty;

                let stockStatus;
                let updateButton = `<button class="btn btn-sm btn-warning" onclick="update(` + value.id + `, '` + value.brand + ` ` + value.name + `', ` + avbQty + `,` + value.qty + `)">update</button>`;
                if (avbQty === 0) {
                    stockStatus = `<span class="badge bg-danger">Out of Stock</span>`;
                } else if (avbQty <= 5 && avbQty >= 1) {
                    stockStatus = `<span class="badge bg-warning">Low Stock</span>`;
                } else if (value.status === 'deleted') {
                    stockStatus = `<span class="badge bg-secondary">Deleted</span>`;
                    updateButton = "";
                } else {
                    stockStatus = `<span class="badge bg-success">In-Stock</span>`;
                }

                var product = `
                        <tr>
                            <td scope="row">` + value.id + `</td>
                            <td>` + value.brand + ` ` + value.name + `</td>  
                            <td class="text-center">` + value.qty + `</td>
                            <td class="text-center">` + value.saleQty + `</td>
                            <td class="text-center">` + avbQty + `</td>
                            <td>` + value.createdAt + `</td>
                            <td>` + value.updateAt + `</td>
                            <td>` + stockStatus + `</td>
                            <td class="text-center">` + updateButton + `</td>
                        </tr>
                `;

                $(".product-row").append(product);
            });
        }
    });



    // Update Category
    $("#inventoryUpdateForm").submit(function (event) {
        event.preventDefault();
        var productId = $("#id").val();
        var newQty = parseInt($("#newQty").val());
        var avbQty = parseInt($("#avbQty").val());
        var totalQty = parseInt($("#totalQty").val());

        $.ajax({
            type: "PATCH",
            url: _update_url + productId + "&qty=" + calculateQty(totalQty, avbQty, newQty)
        }).done(function () {
            location.reload();
        });
    });


</script>
<%@ include file="../includes/admin-footer.jsp" %>