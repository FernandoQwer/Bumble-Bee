<%-- 
    Document   : users
    Created on : Mar 26, 2023, 11:58:05 PM
    Author     : SANDUNI FERNANDO
--%>


<%@ include file="../includes/admin-header.jsp" %>
<%@ include file="../includes/admin-sidebar.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
        <h1 class="fs-1">Registered Users</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="admin/dashboard.jsp">Home</a></li>
                <li class="breadcrumb-item active">Registered Users</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row my-5">
            <div class="col-12 bg-white p-3 rounded shadow mx-2">
                <table id="usersTable" class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th scope="col">Customer ID</th>
                            <th scope="col">Customer Name</th>
                            <th scope="col text-center">Email</th>
                            <th scope="col text-center">Mobile</th>                             
                            <th scope="col">DOB</th> 
                            <th scope="col">NIC</th> 
                            <th scope="col">Registered At</th> 
                            <th scope="col">Credit Balance</th> 
                            <th scope="col text-center">Status</th>                            
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td scope="row">1</td>
                            <td>Jane Doe</td>                           
                            <td>jane@gmail.com</td>
                            <td>0771234567</td>
                            <td>1999/01/01</td>
                            <td>99000000V</td>
                            <td>2023/02/14</td>
                            <td>Rs. 7,000.00</td>
                            <td>
                                <span class="badge bg-success">Active</span>
                            </td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-danger">Block</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

</main><!-- End #main -->

<script>
    $(document).ready(function () {
        $('#usersTable').DataTable();
    });
</script>

<%@ include file="../includes/admin-footer.jsp" %>