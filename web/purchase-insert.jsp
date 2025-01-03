<%@ page import="java.util.List" %>
<%@ page import="model.ProductCategory" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
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
</head>

<body class="portfolio-details-page">

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
          <li><a href="product">Products</a></li>
          <li><a href="sale">Sales</a></li>
          <li><a href="purchase" class="active">Purchases</a></li>
          <li><a href="fabrication">Manufacturing</a></li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

    </div>
  </header>

  <main class="main">

    <!-- Page Title -->
    <div class="page-title dark-background">
      <div class="container position-relative">
        <h1>Insert Purchase</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="index.html">Home</a></li>
            <li class="current">Insert Purchase</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->

    <!-- Portfolio Details Section -->
    <section id="portfolio-details" class="portfolio-details section">
      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <% if (request.getAttribute("message") != null) { %>
          <div class="alert alert-success" role="alert">
              <%= request.getAttribute("message") %>
          </div>
        <% } %>
        
        <% if (request.getAttribute("error_message") != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= request.getAttribute("error_message") %>
            </div>
        <% } %>
      
        <center><h2>Purchase</h2></center>

        <!-- Formulaire de modification du produit -->
        <form action="insert-purchase" method="post">
          <!-- ID du produit -->
          <label for="name">Name</label>
          <select id="idProduct" name="idProduct" class="form-control" required>
              <% 
                  // Récupérer la liste des catégories depuis l'attribut de la requête
                  List<ProductCategory> pc = (List<ProductCategory>) request.getAttribute("pc");
                  if (pc != null) {
                      for (ProductCategory productCategory : pc) {
              %>
                          <option value="<%= productCategory.getIdProduct() %>">
                              <%= productCategory.getProductName() + " - " + productCategory.getCategoryName() %>
                          </option>
              <% 
                      }
                  }
              %>
          </select><br>

          <!-- Quantité achetée -->
          <div class="form-group">
            <label for="purchase_qtt">Quantité achetée :</label>
            <input type="number" id="purchase_qtt" name="purchase_qtt" required><br><br>
          </div>
          <!-- Montant unitaire d'achat -->
          <div class="form-group">
            <label for="unitary_purchase_amount">Montant unitaire d'achat :</label>
            <input type="number" id="unitary_purchase_amount" name="unitary_purchase_amount" step="0.01" required><br><br>
          </div>
          
          <!-- Date d'inventaire -->
          <div class="form-group">
            <label for="date_inventory">Date :</label>
            <input type="datetime-local" id="date_inventory" name="date_inventory" required><br><br>
          </div>
          
          <center><button id="search-btn" class="btn btn-primary" style="background-color:#1e4356 ; margin-top: 2rem;" >Submit</button></center>
        </form>

      </div>
    </section><!-- /Portfolio Details Section -->
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