<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>


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
          <li><a href="product" class="active">Products</a></li>
          <li><a href="sale">Sales</a></li>
          <li><a href="purchase">Purchases</a></li>
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
        <h1>Insert Product</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="index.html">Home</a></li>
            <li class="current">Insert Product</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->

    <!-- Portfolio Details Section -->
    <section id="portfolio-details" class="portfolio-details section">
      <div class="container" data-aos="fade-up" data-aos-delay="100">
      
        <center><h2>Product</h2></center>

        <!-- Formulaire de modification du produit -->
        <form action="insert-product" method="post" enctype="multipart/form-data">

          <!-- Champ pour le nom du produit -->
          <div class="form-group">
            <label for="productName">Name</label>
            <input type="text" id="productName" name="productName" class="form-control" required />
          </div>

          <!-- Champ pour la description du produit -->
          <div class="form-group">
            <label for="productDescription">Description</label>
            <textarea id="productDescription" name="productDescription" class="form-control" required></textarea>
          </div>

          <!-- Champ pour l'image du produit -->
          <div class="form-group">
            <label for="productImage">Image</label>
            <input type="file" id="productImage" name="productImage" class="form-control" />
          </div>          

          <!-- Liste déroulante pour la sélection de la catégorie -->
          <div class="form-group">
            <label for="category">Category</label>
            <select id="category" name="category" class="form-control" required>
              <% 
                // Récupérer la liste des catégories depuis l'attribut de la requête
                List<Category> categories = (List<Category>) request.getAttribute("categories");
                if (categories != null) {
                    // Parcourir et afficher chaque catégorie
                    for (Category category : categories) {
              %>
                      <option value="<%= category.getId() %>">
                        <%= category.getName() %>
                      </option>
              <% 
                    }
                } else { 
              %>
                  <option disabled>Aucune catégorie disponible</option>
              <% 
                } 
              %>
            </select>            
          </div>

          <!-- Bouton de soumission -->
           <br>
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