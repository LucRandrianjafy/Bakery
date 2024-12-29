<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ page import="model.ProductCategory" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Bakery</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
  <link href="assets/others/img/favicon.png" rel="icon">
  <link href="assets/others/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/others/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/others/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/others/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/others/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/others/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/others/css/main.css" rel="stylesheet">
  <style>
    .circle-button {
        width: 3rem;
        height: 3rem;
        border-radius: 50%;
        background-color: white;
        color: rgb(21, 122, 37);
        border: none;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        text-decoration: none;
        transition: background-color 0.5s, color 0.5s;
    }

    .circle-button:hover {
        background-color: #1e4356;
        color: white;
    }


    .circle-button i {
        font-size: 50px;
    }
  </style>
</head>

<body class="portfolio-page">

  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

      <a href="accueil.jsp" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/others/img/logo.png" alt=""> -->
        <h1 class="sitename">Bakery</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="accueil.jsp">Home</a></li>
          <li><a href="product" class="active">Products</a></li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

    </div>
  </header>

  <main class="main">

    <!-- Page Title -->
    <div class="page-title dark-background">
      <div class="container position-relative">
        <h1>Products</h1>
        <p>You can see the list of all products below.</p>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="index.html">Home</a></li>
            <li class="current">Products</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->

    <!-- Portfolio Section -->
    <section id="portfolio" class="portfolio section">

      <!-- INSERT -->
      <div class="container">
        <div style="display: flex; justify-content: center; align-items: center; height: 3rem;">
          <a href="insert-product" class="circle-button">
              <strong><i class="bi bi-plus"></i></strong>
          </a>
        </div><br>
      
        <div class="row mb-4">
          <input type="text" id="search-input" placeholder="Search an product" class="form-control"/>
          <button id="search-btn" class="btn btn-primary" style="background-color:#1e4356 ; margin-top: 2rem;" >Search</button>
        </div><br><br>

        <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order">
            <!-- Portfolio Filters -->
            <ul class="portfolio-filters isotope-filters" data-aos="fade-up" data-aos-delay="100">
                <li data-filter="*" class="filter-active">All</li>
                <%
                    List<Category> categories = (List<Category>) request.getAttribute("categories");
                    for (Category category : categories) {
                %>
                    <li data-filter=".filter-<%= category.getName().toLowerCase().replaceAll("\\s+", "-") %>">
                        <%= category.getName() %>
                    </li>
                <%
                    }
                %>
            </ul><!-- End Portfolio Filters -->

            <!-- Portfolio Items -->
            <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200">
                <%
                    String searchQuery = request.getParameter("search");
                    List<ProductCategory> pc = (List<ProductCategory>) request.getAttribute("pc");

                    for (ProductCategory productCategory : pc) {
                        if (searchQuery != null && !productCategory.getProductName().toLowerCase().contains(searchQuery.toLowerCase())) {
                            continue; // Si le nom du produit ne correspond pas à la recherche, on l'ignore
                        }

                        String categoryClass = productCategory.getCategoryName().toLowerCase().replaceAll("\\s+", "-");
                        String productName = productCategory.getProductName();
                        String productDescription = productCategory.getProductDescription();
                        String productImage = "assets/others/img/portfolio/" + productCategory.getProductImage();
                %>

                <!-- Portfolio Item -->
                <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-<%= categoryClass %>">
                  <div class="portfolio-content h-100">
                      <img src="<%= productImage %>" class="img-fluid" alt="<%= productName %>">
                      <div class="portfolio-info">
                          <h4 class="product-name"><%= productName %></h4> <!-- Ajout d'une classe pour cibler le nom du produit -->
                          <p><%= productDescription %></p>
                          <a href="<%= productImage %>" title="<%= productName %> : <%= productDescription %>" data-gallery="portfolio-gallery-<%= categoryClass %>" class="glightbox preview-link">
                              <i class="bi bi-eye"></i>
                          </a>
                          <a href="modify-product?idProduct=<%= productCategory.getIdProduct() %>" title="More Details" class="details-link">
                              <i class="bi bi-pencil"></i>
                          </a>
                      </div>
                  </div>
                </div><!-- End Portfolio Item -->


                <%
                    }
                %>
            </div><!-- End Portfolio Items -->
          </div>
      </div>
    </section><!-- End Portfolio Section -->


  </main>

  <footer id="footer" class="footer dark-background">

    <div class="container copyright text-center mt-4">
      <p>© <span>Copyright</span> <strong class="px-1 sitename"></strong></p>
      <div class="credits">
        Designed by <a href="#">ETU 2587</a>
      </div>
    </div>

  </footer>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/others/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/others/vendor/php-email-form/validate.js"></script>
  <script src="assets/others/vendor/aos/aos.js"></script>
  <script src="assets/others/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/others/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/others/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/others/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="assets/others/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="assets/others/vendor/isotope-layout/isotope.pkgd.min.js"></script>

  <!-- Main JS File -->
  <script src="assets/others/js/main.js"></script>
</body>

</html>