<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Bakery</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <link href="assets/others/img/favicon.png" rel="icon">

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

<body class="index-page">

  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

      <a href="accueil.jsp" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1 class="sitename">Bakery </h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="accueil.jsp" class="active">Home</a></li>
          <li><a href="product">Products</a></li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

    </div>
  </header>

  <main class="main">

    <!-- Hero Section -->
    <section id="hero" class="hero section dark-background">

      <!-- <img src="assets/img/hero-bg.jpg" alt="" data-aos="fade-in"> -->

      <div id="hero-carousel" class="carousel carousel-fade" data-bs-ride="carousel" data-bs-interval="5000">

        <div class="container position-relative">

          <div class="carousel-item active">
            <div class="carousel-container">
              <h2>WELCOME</h2>
              <p>Welcome to our Bakery, where every bite tells a story! </p>
              <a href="#about" class="btn-get-started">Read More</a>
            </div>
          </div><!-- End Carousel Item -->

          <div class="carousel-item">
            <div class="carousel-container">
              <h2>Our Freshly Baked Creations</h2>
              <p>Discover our artisanal breads, delicate pastries, and sweet treats made fresh every day.</p>
              <a href="#about" class="btn-get-started">Read More</a>
            </div>
          </div><!-- End Carousel Item -->

          <div class="carousel-item">
            <div class="carousel-container">
              <h2>Thank You for Visiting Us!</h2>
              <p>Until next time, may your days be as sweet as our pastries.</p>
              <a href="#about" class="btn-get-started">Read More</a>
            </div>
          </div><!-- End Carousel Item -->

          <a class="carousel-control-prev" href="#hero-carousel" role="button" data-bs-slide="prev">
            <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
          </a>

          <a class="carousel-control-next" href="#hero-carousel" role="button" data-bs-slide="next">
            <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
          </a>

          <ol class="carousel-indicators"></ol>

        </div>

      </div>

    </section><!-- /Hero Section -->

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