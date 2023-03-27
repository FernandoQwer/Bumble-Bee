<%-- 
    Document   : index
    Created on : Mar 16, 2023, 11:42:57 PM
    Author     : SANDUNI FERNANDO
--%>

<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Google Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <!-- Poppins -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="assets/css/main.css">

        <title>BumbleBee</title>
    </head>

    <body>

        <div class="hero">
            <div class="container pt-4">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand h1 fs-2 text-uppercase text-white" href="#"><strong>Bumble Bee</strong></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse nav justify-content-center" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active text-white fs-5" aria-current="page" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white fs-5" href="about.jsp">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white fs-5" href="#">Store</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white fs-5" href="#">Contact</a>
                            </li>
                        </ul>
                    </div>
                    <button type="button" class="btn btn-outline-light rounded-pill btn-lg px-4">Login</button>
                    <!-- <button type="button" class="btn btn-outline-info rounded-pill">Login</button> -->
                </nav>

                <div class="hero-section row">
                    <div class="col-6">
                        <p class="text-white fw-bold hero-text mb-5">Buy First<br>& Pay Later</p>
                        <button type="button" class="btn btn-outline-light rounded-pill btn-lg px-4 py-2">Sign Up</button>
                    </div>
                    <div class="col-6">
                        <img src="assets/images/Cover_Image2-01.png" alt="Bumble Bee Home" width="550px">
                    </div>
                </div>
            </div>
        </div>


        <!--Content Starts-->
        <div class="steps">
            <div class="container content">
                <div class="row">
                    <div class="col-12">
                        <h2 class="text-right fs-1 fw-bolder">How Bumble Bee works</h2>
                    </div>  
                </div> 
                <div class="row mt-4">
                    <div class="col">
                        <h2 class="fw-bolder">Step 01</h2>
                    </div>
                    <div class="col">
                        <h2 class="fw-bolder">Step 02</h2>
                    </div>
                    <div class="col">
                        <h2 class="fw-bolder">Step 03</h2>
                    </div>
                </div> 
            </div>        
        </div>

        <div class="container content">
            <div class="row mb-5">
                <div class="col-12">
                    <h2 class="text-right fs-1 fw-bolder">New Arrivals</h2>
                </div>  
            </div> 

            <div class="row">
                <div class="col-3">
                    <div class="card" style="width: 18rem;">
                        <img src="assets/images/product-img-000.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title text-center">Sony</h5> 
                            <h4 class="card-title text-center">Playstation Portable</h4>                            
                            <h4 class="text-uppercase text-center fw-bold">LKR 80,000.00</h4>
                        </div>
                    </div>
                </div>  
                <div class="col-3">
                    <div class="card" style="width: 18rem;">
                        <img src="assets/images/product-img-0001.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title text-center">JBL</h5> 
                            <h4 class="card-title text-center">Gaming Headset</h4>                            
                            <h4 class="text-uppercase text-center fw-bold">LKR 65,000.00</h4>
                        </div>
                    </div>
                </div>  
                <div class="col-3">
                    <div class="card" style="width: 18rem;">
                        <img src="assets/images/product-img-002.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title text-center">Sennheiser</h5> 
                            <h4 class="card-title text-center">MOMENTUM True Wireless 3 Earbuds</h4>                            
                            <h4 class="text-uppercase text-center fw-bold">LKR 80,000.00</h4>
                        </div>
                    </div>
                </div>  
                <div class="col-3">
                    <div class="card" style="width: 18rem;">
                        <img src="assets/images/MSI-Laptop-i7.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title text-center">MSI</h5>                              
                            <h4 class="card-title text-center">Core i7 Gaming Laptop</h4>                            
                          
                            <h4 class="text-uppercase text-center fw-bold">LKR 80,000.00</h4>
                        </div>
                    </div>
                </div>  
            </div>
        </div>        
        <!--Content Ends-->


        <%@ include file="includes/footer.jsp" %>