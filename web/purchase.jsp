<%@ page import="java.util.List" %>
<%@ page import="model.Purchase" %>
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
  <style>
    h1 {
      text-align: center;
      color: white;
    }

    table {
        width: 95%;
        border-collapse: collapse;
        margin: 20px auto;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #1e4356; /* Couleur pour les en-têtes */
        color: white; /* Texte en blanc */
    }

    tr:hover {
        background-color: #68a4c4; /* Fond lors du survol */
        color: white; /* Texte en blanc lors du survol */
    }

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

<body class="about-page">

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
      <h1>List of Purchases</h1>
    </div><!-- End Page Title -->

    <section id="portfolio" class="portfolio section">

      <div style="display: flex; justify-content: center; align-items: center; height: 3rem;">
        <a href="#" class="circle-button">
            <strong><i class="bi bi-plus"></i></strong>
        </a>
      </div><br>

      <table>
        <thead>
            <tr>
                <th>ID Stock</th>
                <th>ID Produit</th>
                <th>Nom Produit</th>
                <th>Quantité</th>
                <th>Prix Unitaire</th>
                <th>Montant Total</th>
                <th>Description</th>
                <th>Catégorie</th>
                <th>Date Inventaire</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Purchase> purchases = (List<Purchase>) request.getAttribute("purchases");
                if (purchases != null && !purchases.isEmpty()) {
                    for (Purchase purchase : purchases) {
            %>
                        <tr>
                            <td><%= purchase.getIdStock() %></td>
                            <td><%= purchase.getIdProduct() %></td>
                            <td><%= purchase.getProductName() %></td>
                            <td><%= purchase.getPurchaseQuantity() %></td>
                            <td><%= purchase.getUnitaryPurchasePrice() %></td>
                            <td><%= purchase.getTotalAmount() %></td>
                            <td><%= purchase.getProductDescription() %></td>
                            <td><%= purchase.getIdCategory() %></td>
                            <td><%= purchase.getDateInventory() %></td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="9">Aucun achat trouvé.</td>
                    </tr>
            <%
                }
            %>
          </tbody>
      </table>
    </section>
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