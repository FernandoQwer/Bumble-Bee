<%-- 
    Document   : admin-sidebar
    Created on : Mar 20, 2023, 11:29:48 PM
    Author     : SANDUNI FERNANDO
--%>

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar" style="background-color: #012970;">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link collapsed" href="dashboard.jsp">
                <i class="bi bi-grid"></i>
                <span>Dashboard</span>
            </a>
        </li><!-- End Dashboard Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="brands.jsp">
                <i class="bi bi-rainbow"></i>
                <span>Product Brands</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="categories.jsp">
                <i class="bi bi-tag"></i>
                <span>Product Categories</span>
            </a>
        </li>

         <li class="nav-item">
            <a class="nav-link collapsed" href="products.jsp">
                <i class="bi bi-box-seam"></i>
                <span>Products</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="categories.jsp">
                <i class="bi bi-box-seam"></i>
                <span>Inventory</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="categories.jsp">
                <i class="bi bi-box-seam"></i>
                <span>Orders</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="categories.jsp">
                <i class="bi bi-cash-coin"></i>
                <span>Loans</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-files"></i><span>Reports</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="add-new-product.jsp">
                        <i class="bi bi-circle"></i><span>Sales</span>
                    </a>
                </li>
                <li>
                    <a href="products.jsp">
                        <i class="bi bi-circle"></i><span>Products</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Tables Nav -->

        <li class="nav-heading">My Account</li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="profile.jsp">
                <i class="bi bi-person"></i>
                <span>Profile</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="../index.jsp">
                <i class="bi bi-arrow-up-left-square"></i>
                <span>Visit Website</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="logout.jsp">
                <i class="bi bi-box-arrow-left"></i>
                <span>Logout</span>
            </a>
        </li><!-- End Login Out Nav -->
    </ul>


</aside><!-- End Sidebar-->
