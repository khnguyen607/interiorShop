<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dekor</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/fonts/awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="http://fonts.googleapis.com/css?family=Raleway:400,700,600,500,300,100,200,800" rel="stylesheet" />
    <link href="assets/css/owl.carousel.css" rel="stylesheet" />
    <link href="assets/css/owl.theme.css" rel="stylesheet" />
    <link rel='stylesheet' href='assets/rs-plugin/css/settings.css' />
    <link href="assets/style.css" rel="stylesheet" />

    <script src="shared/scripts/app.js"></script>
    <!-- <script src="shared/scripts/init.js"></script> -->
</head>

<body>
    <div class="loading-page">
        <img src="assets/demos/loading.gif" alt="loading">
    </div>
    <header class="tz-header">
        <div class="container">
            <h3 class="tz-logo pull-left">
                <a href="./">
                    <img src="assets/images/logo.png" alt="dekor">
                </a>
            </h3>
            <button data-target=".nav-collapse" class="btn-navbar tz_icon_menu pull-right" type="button">
                <i class="fa fa-bars"></i>
            </button>
            <button class="pull-right tz-search" onclick="window.location.href='?page=checkout'"> <i class="fa fa-shopping-cart"></i></button>
            <button class="pull-right tz-search"> <i class="fa fa-search"></i></button>
            <nav class="pull-right">
                <ul class="nav-collapse">
                    <li><a href="./">Trang chủ</a></li>
                    <li><a href="./?page=products">Cửa hàng</a></li>
                    <li><a href="./?page=about">Về chúng tôi</a></li>
                    <li><a href="./?page=contact">Liên hệ</a></li>
                </ul>
            </nav>
        </div><!--end class container-->
        <div class="tz-form-search">
            <div class="container">
                <form method="get" action="./">
                    <input type="text" placeholder="Tìm kiếm..." name="q" id="tz-search-input" class="tz-search-input">
                    <input type="text" name="page" value="products" class="hidden">
                    <input class="hidden" type="submit" value="Search">
                    <i class="fa fa-times tz-form-close"></i>
                </form>
            </div>
        </div>
    </header>

    <!-- main body start -->
    <?php
    $page = isset($_GET['page']) ? $_GET['page'] : 'home';
    $page_path = "pages/$page/$page";
    if (file_exists("$page_path.html")) {
        include_once("$page_path.html");
    } else {
        header("Location: shared/components/404.html");
    }
    echo "<script src='pages/$page/$page.js'></script>";
    ?>
    <!-- main body end -->

    <footer>
        <div class="tz-footer-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 footer-item">
                        <h3 class="module-title">
                            <span>
                                GIỚI THIỆU
                            </span>
                        </h3>
                        <div class="textwidget">
                            Dekor là một công ty hàng đầu về lĩnh vực nội thất, chuyên cung cấp các sản phẩm nội thất đẹp mắt, tốt nhất, chất lượng cao, và mang đậm đen hương vị thiên nhiên. Công ty được thành lập năm 2010 và đã có nhiều năm kinh nghiệm trong lĩnh vực này. Chúng tôi tự hào với sự phát triển của mình trong suốt năm qua và chắc chắn sẽ tiếp tục phát triển trong tương lai.
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 footer-item">
                        <h3 class="module-title">
                            <span>
                                LIÊN HỆ
                            </span>
                        </h3>
                        <div class="tzwidget-contact">
                            <address>
                                Số 79 đường Hồ Tùng Mậu, Hà Nội
                            </address>
                            <span>
                                +44 (0) 800 765 4321
                            </span>
                            <a href="#">info@templaza.com</a>
                            <span class="tzwidget-social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-google-plus"></i></a>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 footer-item">
                        <h3 class="module-title">
                            <span>
                                DỰ ÁN GẦN ĐÂY
                            </span>
                        </h3>
                        <ul class="tz-recent-porjects">
                            <li>
                                <a href="single-portfolio-gallery.html">
                                    <img src="assets/demos/pro1.jpg" alt="dự án gần đây">
                                </a>
                            </li>
                            <li>
                                <a href="single-portfolio-gallery.html">
                                    <img src="assets/demos/pro2.jpg" alt="dự án gần đây 2">
                                </a>
                            </li>
                            <li>
                                <a href="single-portfolio-gallery.html">
                                    <img src="assets/demos/pro3.jpg" alt="dự án gần đây 3">
                                </a>
                            </li>
                            <li>
                                <a href="single-portfolio-gallery.html">
                                    <img src="assets/demos/pro4.jpg" alt="dự án gần đây 4">
                                </a>
                            </li>
                            <li>
                                <a href="single-portfolio-gallery.html">
                                    <img src="assets/demos/pro5.jpg" alt="dự án gần đây 5">
                                </a>
                            </li>
                            <li>
                                <a href="single-portfolio-gallery.html">
                                    <img src="assets/demos/pro6.jpg" alt="dự án gần đây 6">
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="tz-copyright theme-white">
            <p>bản quyền 2014 Dekor Design, INC. Tất cả các quyền được bảo lưu.</p>
        </div>
    </footer>

    <script src="assets/js/jquery.min.js"></script>
    <script>
        jQuery.noConflict();
    </script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.parallax-1.1.3.js"></script>
    <script src="assets/js/owl.carousel.js"></script>
    <script src="assets/js/resize.js"></script>
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/jquery.isotope.min.js"></script>
    <script src="assets/js/custom-portfolio.js"></script>
    <script src="assets/js/jquery.easypiechart.min.js"></script>

    <script type='text/javascript' src='assets/rs-plugin/js/jquery.themepunch.tools.min.js'></script>
    <script type='text/javascript' src='assets/rs-plugin/js/jquery.themepunch.revolution.min.js'></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
            jQuery('#rev_slider_2_1').show().revolution({
                dottedOverlay: "none",
                delay: 6000,
                startwidth: 960,
                startheight: 350,
                hideThumbs: 200,

                thumbWidth: 100,
                thumbHeight: 50,
                thumbAmount: 4,

                navigationType: "none",
                navigationArrows: "solo",
                navigationStyle: "round",

                touchenabled: "on",
                onHoverStop: "on",

                swipe_velocity: 0.7,
                swipe_min_touches: 1,
                swipe_max_touches: 1,
                drag_block_vertical: false,


                keyboardNavigation: "off",

                navigationHAlign: "center",
                navigationVAlign: "bottom",
                navigationHOffset: 0,
                navigationVOffset: 20,

                soloArrowLeftHalign: "left",
                soloArrowLeftValign: "center",
                soloArrowLeftHOffset: 20,
                soloArrowLeftVOffset: 0,

                soloArrowRightHalign: "right",
                soloArrowRightValign: "center",
                soloArrowRightHOffset: 20,
                soloArrowRightVOffset: 0,

                shadow: 0,
                fullWidth: "off",
                fullScreen: "on",

                spinner: "spinner0",

                stopLoop: "off",
                stopAfterLoops: -1,
                stopAtSlide: -1,

                shuffle: "off",


                forceFullWidth: "off",
                fullScreenAlignForce: "off",
                minFullScreenHeight: "",
                hideTimerBar: "on",
                hideThumbsOnMobile: "off",
                hideNavDelayOnMobile: 1500,
                hideBulletsOnMobile: "off",
                hideArrowsOnMobile: "off",
                hideThumbsUnderResolution: 0,

                fullScreenOffsetContainer: "",
                fullScreenOffset: "",
                hideSliderAtLimit: 0,
                hideCaptionAtLimit: 0,
                hideAllCaptionAtLilmit: 0,
                startWithSlide: 0
            });
        }); /*ready*/


        var Desktop = 4,
            tabletportrait = 2,
            mobilelandscape = 2,
            mobileportrait = 1,
            resizeTimer = null;

        jQuery(window).load(function() {
            jQuery('div.slotholder').prepend('<div class="bk-responsive-slide"></div>');
        })
    </script>
    <script src="assets/js/custom.js"></script>
</body>

</html>