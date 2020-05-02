
<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>public/css/style.css">
<script type="text/javascript" src="<?php echo base_url();?>public/js/owl.carousel.min.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>public/css/owl.carousel.css">


      <!-- sliders -->
      <div id="sliders">
        <div class="full-width">
          <!-- light slider -->
          <div id="light-slider" class="carousel slide">
            <div id="carousel-area">
              <div id="carousel-slider" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
                  <li data-target="#carousel-slider" data-slide-to="1"></li>
                  <li data-target="#carousel-slider" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                  <div class="carousel-item active">
                    <img src="<?php //echo base_url();?>public/img/slider/Web_4.jpg" alt="">
                  </div>                    
                  <?php foreach ($imgCarouse as $image) { ?>
                  <div class="carousel-item">
                    <img src="<?php echo base_url();?>/<?php echo $image['carous_image']?>" alt="">
                  </div>
                  <?php }?>
                 
                </div>
                  <a class="carousel-control-prev" href="#carousel-slider" role="button" data-slide="prev">
                    <i class="fa fa-chevron-left"></i>
                  </a>
                  <a class="carousel-control-next" href="#carousel-slider" role="button" data-slide="next">
                    <i class="fa fa-chevron-right"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- End sliders -->
      
      <br>

      <!-- Portfolio Section -->
      <section id="portfolio" class="section-padding">
        <!-- Container Starts -->
        <div class="container">
          <div class="row">
            <div class="col-md-12">
            <h2 class="section-title wow fadeInDown animated" data-wow-delay="0.3s">Real Weddings</h2>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12 col-md-12">
              <!-- Portfolio Controller/Buttons -->
              <div class="controls text-center wow fadeInUpQuick" data-wow-delay=".6s">
                <a class="filter active btn btn-common" data-filter="all">
                  All 
                </a>
                <a class="filter btn btn-common" data-filter=".wedding">
                  Wedding 
                </a>
                <a class="filter btn btn-common" data-filter=".destination">
                  Destination Wedding
                </a>
                <a class="filter btn btn-common" data-filter=".bridal">
                  Bridal & Grooms
                </a>
                <a class="filter btn btn-common" data-filter=".makeup">
                  Makeup
                </a>
                <a class="filter btn btn-common" data-filter=".preWedding">
                  Pre-Wedding
                </a>
                <a class="filter btn btn-common" data-filter=".postWedding">
                  Post-Wedding
                </a>
                <a class="filter btn btn-common" data-filter=".engagement">
                  Engagement 
                </a>
                <a class="filter btn btn-common" data-filter=".futureWedding" style="
                 margin-top: 10px;">
                  Future Wedding Vendors
                </a>
              </div>
              <!-- Portfolio Controller/Buttons Ends-->
            </div>

            <!-- Portfolio Recent Projects -->
            <div id="portfolio" class="row wow fadeInUpQuick" data-wow-delay="0.8s">
              <?php foreach ($wedding as $Wedding){?>
              <div class="col-lg-4 col-md-6 col-xs-12 mix wedding">
                <div class="portfolio-item">
                  <div class="portfolio-img">
                    <img src="<?php echo base_url();?>/<?php echo $Wedding['wedding_image']?>" alt=""/>
                    <h4><?php echo $Wedding['image_caption']?></h4>
                  </div>
                </div>        
              </div>
              <?php }?>

              <?php foreach($DestinationWedding as $dest) {?>
              <div class="col-lg-4 col-md-6 col-xs-12 mix destination">
                <div class="portfolio-item">
                 <div class="portfolio-img">
                   <img src="<?php echo base_url();?>/<?php echo $dest['destination_image']?>" alt="" />
                   <h4><?php echo $dest['image_caption']?></h4>
                  </div>
                </div>
              </div>
              <?php }?>

              <?php foreach($Bridal as $bridal) {?>
              <div class="col-lg-4 col-md-6 col-xs-12 mix bridal">
                <div class="portfolio-item">
                  <div class="portfolio-img">
                    <img src="<?php echo base_url();?>/<?php echo $bridal['bridal_image']?>" alt="" />
                    <h4><?php echo $bridal['bridal_caption']?></h4>
                  </div>
               </div>
              </div>
               <?php }?>
              <?php foreach($Makeup as $makeup){?>
              <div class="col-lg-4 col-md-6 col-xs-12 mix makeup">
                <div class="portfolio-item">
                  <div class="portfolio-img">
                    <img src="<?php echo base_url();?>/<?php echo 
                     $makeup['makeup_image']?>" alt="" />
                    <h4><?php echo $makeup['makeup_caption']?></h4>
                  </div>
                </div>
              </div>
              <?php }?>

              <?php foreach($PreWedding as $preWedding){?>
              <div class="col-lg-4 col-md-6 col-xs-12 mix preWedding">
                <div class="portfolio-item">
                  <div class="portfolio-img">
                    <img src="<?php echo base_url();?>/<?php echo 
                     $preWedding['preWedding_image']?>" alt="" />
                    <h4><?php echo $preWedding['preWedding_caption']?></h4>
                  </div>
                </div>
              </div>
              <?php }?>

              <?php foreach($PostWedding as $postWedding){?>
              <div class="col-lg-4 col-md-6 col-xs-12 mix postWedding">
                <div class="portfolio-item">
                  <div class="portfolio-img">
                    <img src="<?php echo base_url();?>/<?php echo 
                     $postWedding['postWedding_image']?>" alt="" />
                    <h4><?php echo $postWedding['postWedding_caption']?></h4>
                  </div>
                </div>
              </div>
              <?php }?>


              <?php foreach($imgEngagement as $engagement){?>
              <div class="col-lg-4 col-md-6 col-xs-12 mix engagement">
                <div class="portfolio-item">
                  <div class="portfolio-img">
                    <img src="<?php echo base_url();?>/<?php echo 
                     $engagement['engagement_image']?>" alt="" />
                    <h4><?php echo $engagement['image_caption']?></h4>
                  </div>
                </div>
              </div>
              <?php }?>

              <?php foreach($FutureWedding as $futureWedding){?>
              <div class="col-lg-4 col-md-6 col-xs-12 mix futureWedding">
                <div class="portfolio-item">
                  <div class="portfolio-img">
                    <img src="<?php echo base_url();?>/<?php echo 
                     $futureWedding['futureWedding_image']?>" alt="" />
                    <h4><?php echo $futureWedding['futureWedding_caption']?></h4>
                  </div>
                </div>
              </div>
              <?php }?>
          </div>
        </div>
        <!-- Container Ends -->
      </section>
      <!-- Portfolio Section Ends -->

      <!-- Video slider start -->
      <section>
        <div id="owl-demo" class="owl-carousel">
          <div class="item">
            <img class="lazyOwl" data-src="<?php echo base_url();?>folder/engagement/eng.jpg" alt="Lazy Owl Image">
            <div class="">
              <h3><a>hello</a></h3>
            </div>
          </div>
          <div class="item">
            <img class="lazyOwl" data-src="<?php echo base_url();?>folder/engagement/eng.jpg" alt="Lazy Owl Image">
            <div class="">
              <h3><a>hello</a></h3>
            </div>
          </div>
          <div class="item">
            <img class="lazyOwl" data-src="<?php echo base_url();?>folder/engagement/eng.jpg" alt="Lazy Owl Image">
          </div>
          <div class="item">
            <img class="lazyOwl" data-src="<?php echo base_url();?>folder/engagement/eng.jpg" alt="Lazy Owl Image">
          </div>
          <div class="item">
            <img class="lazyOwl" data-src="<?php echo base_url();?>folder/engagement/eng.jpg" alt="Lazy Owl Image">
          </div>
        </div>
      </section>
      <!-- Video slider end -->

      <!-- Gallery start(modeling,maternity etc) -->
      <section class="section-padding">
        <div class="container">
            <div class="row">
            <div class="gallery col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 class="gallery-title">Gallery</h1>
            </div>

            <div class="controls text-center wow fadeInUpQuick">
                <button class="btn btn-default filter-button" data-filter="all1">All</button>
                <button class="btn btn-default filter-button" data-filter="modeling">Modeling</button>
                <button class="btn btn-default filter-button" data-filter="maternity">Maternity </button>
                <button class="btn btn-default filter-button" data-filter="spray">Spray Nozzle</button>
                <button class="btn btn-default filter-button" data-filter="irrigation">Irrigation Pipes</button>
            </div>
            <br/>
            <div class="row">
              <?php foreach ($imgModel as $modelImg){?>
                <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter1 modeling">
                    <img src="<?php echo base_url();?>/<?php echo $modelImg['model_image']?>" class="img-responsive">
                </div>
              <?php }?>

              <?php foreach($imgMaternity as $maternityImg) {?>
                <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter1 maternity">
                    <img src="<?php echo base_url();?>/<?php echo $maternityImg['maternity_image']?>" class="img-responsive">
                </div>
               <?php }?>
                <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter1 irrigation">
                    <img src="http://fakeimg.pl/365x365/" class="img-responsive">
                </div>

                <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter1 spray">
                    <img src="http://fakeimg.pl/365x365/" class="img-responsive">
                </div>
                <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter1 spray">
                    <img src="http://fakeimg.pl/365x365/" class="img-responsive">
                </div>
              </div>
            </div>
        </div>
      </section>
      <!-- Gallery end(modeling,maternity etc) -->


      <!-- Feature Section Start -->
      <div id="feature" class="section-padding">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <h2 class="section-title wow fadeInDown animated" data-wow-delay="0.3s">Features</h2>
            </div>
          </div>
          <div class="row">
            <!-- Start featured -->
            <div class="col-lg-4 col-md-6 col-xs-12">
              <div class="featured-box-item">
                <div class="featured-icon">
                  <i class="fa fa-bolt"></i>
                </div>
                <div class="featured-content">
                  <h4>Bootstrap 4</h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et magna aliqua.</p>
                </div>
              </div>
            </div>
            <!-- End featured -->
            
            <!-- Start featured -->
            <div class="col-lg-4 col-md-6 col-xs-12">
              <div class="featured-box-item">
                <div class="featured-icon">
                  <i class="fa fa-diamond"></i>
                </div>
                <div class="featured-content">
                  <h4>Clean Design</h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et magna aliqua.</p>
                </div>
              </div>
            </div>
            <!-- End featured -->

            <!-- Start featured -->
            <div class="col-lg-4 col-md-6 col-xs-12">
              <div class="featured-box-item">
                <div class="featured-icon">
                  <i class="fa fa-cubes"></i>
                </div>
                <div class="featured-content">
                  <h4>100+ Components</h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et magna aliqua.</p>
                </div>
              </div>
            </div>
            <!-- End featured -->

            <!-- Start featured -->
            <div class="col-lg-4 col-md-6 col-xs-12">
              <div class="featured-box-item">
                <div class="featured-icon">
                  <i class="fa fa-cogs"></i>
                </div>
                <div class="featured-content">
                  <h4>Easy to Customize</h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et magna aliqua.</p>
                </div>
              </div>
            </div>
            <!-- End featured -->

            <!-- Start featured -->
            <div class="col-lg-4 col-md-6 col-xs-12">
              <div class="featured-box-item">
                <div class="featured-icon">
                  <i class="fa fa-check"></i>
                </div>
                <div class="featured-content">
                  <h4>Pixel Perfect</h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et magna aliqua.</p>
                </div>
              </div>
            </div>
            <!-- End featured -->

            <!-- Start featured -->
            <div class="col-lg-4 col-md-6 col-xs-12">
              <div class="featured-box-item">
                <div class="featured-icon">
                  <i class="fa fa-cloud"></i>
                </div>
                <div class="featured-content">
                  <h4>Cloud Backup</h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et magna aliqua.</p>
                </div>
              </div>
            </div>
            <!-- End featured -->
          </div>
        </div>
      </div>
      <!-- Feature Section End -->

      <!-- About Section Start -->
      <div id="about" class="section-padding">
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-md-6 col-xs-12">
              <div class="about block text-center">
                <img src="<?php echo base_url();?>public/img/about/img1.png" alt="">
                <h5><a href="#">OUR IDEAS</a></h5>
                <p>We deliver INSPIRATIONAL IDEAS, real world advice and visually gorgeous fashion, beauty and lifestyle features to appeal to a range of BUDGETS AND STYLES.</p>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-xs-12">
              <div class="about block text-center">
                <img src="<?php echo base_url();?>public/img/about/img2.png" alt="">
                <h5><a href="#">OUR AUDIENCE</a></h5>
                <p>Our audience includes engaged couples and families. Billions of rupees are spent on fashion, jewelry, beauty, travel, gifts, wedding services and others as millennial couples plan for their future.</p>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-xs-12">
              <div class="about block text-center">
                <img src="<?php echo base_url();?>public/img/about/img3.png" alt="">
                <h5><a href="#">About Title</a></h5>
                <p>Quisque sit amet libero purus. Nulla a dignissim quam. In hac habitasse platea dictumst.</p>
              </div>
            </div>
            <div class="col-lg-3 col-md-6 col-xs-12">
              <div class="about block text-center">
                <img src="<?php echo base_url();?>public/img/about/img4.png" alt="">
                <h5><a href="#">About Title</a></h5>
                <p>Quisque sit amet libero purus. Nulla a dignissim quam. In hac habitasse platea dictumst.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- About Section end -->

      <section>
        <div id="owl-demo1" class="owl-carousel owl-theme">
          <div class="zoomin item"><img src="<?php echo base_url();?>folder/engagement/eng21.jpg" alt="" /></div>
          <div class="item"><img src="<?php echo base_url();?>folder/engagement/eng.jpg" alt="" /></div>
          <div class="item"><img src="<?php echo base_url();?>folder/engagement/eng21.jpg" alt="" /></div>
          <div class="item"><img src="<?php echo base_url();?>folder/engagement/eng.jpg" alt="" /></div>
          <div class="item"><img src="<?php echo base_url();?>folder/engagement/eng21.jpg" alt="" /></div>
           <div class="item"><img src="<?php echo base_url();?>folder/engagement/eng.jpg" alt="" /></div>
          <div class="item"><img src="<?php echo base_url();?>folder/engagement/eng21.jpg" alt="" /></div>
           <div class="item"><img src="<?php echo base_url();?>folder/engagement/eng.jpg" alt="" /></div>
          <div class="item"><img src="<?php echo base_url();?>folder/engagement/eng21.jpg" alt="" /></div>
          <div class="item"><img class="item" src="<?php echo base_url();?>folder/engagement/eng.jpg" alt="" /></div>
        </div>
   
        <div class="customNavigation">
          <a class="btn prev">Previous</a>
          <a class="btn next">Next</a>
          <a class="btn play">Autoplay</a>
          <a class="btn stop">Stop</a>
        </div>
      </section>

      <!-- facts Section Start -->
      <div id="counter">
        <div class="container">
          <div class="row count-to-sec">
            <div class="col-lg-3 col-md-6 col-xs-12 count-one">
              <span class="icon"><i class="fa fa-download"> </i></span>
              <h3 class="timer count-value" data-to="561" data-speed="1000">561</h3>
              <hr class="width25-divider">
              <small class="count-title">Downloads</small>
            </div>

            <div class="col-lg-3 col-md-6 col-xs-12 count-one">
              <span class="icon"><i class="fa fa-user"> </i></span>
              <h3 class="timer count-value" data-to="950" data-speed="1000">950</h3>
              <hr class="width25-divider">
              <small class="count-title">Developers</small>
            </div>

            <div class="col-lg-3 col-md-6 col-xs-12 count-one">
              <span class="icon"><i class="fa fa-desktop"> </i></span>
              <h3 class="timer count-value" data-to="978" data-speed="1000">978</h3>
              <hr class="width25-divider">
              <small class="count-title">Lines of code written</small>
            </div>

            <div class="col-lg-3 col-md-6 col-xs-12 count-one">
              <span class="icon"><i class="fa fa-coffee"> </i></span>
              <h3 class="timer count-value" data-to="1700" data-speed="1000">1700</h3>
              <hr class="width25-divider">
              <small class="count-title">Cups of coffee consumed</small>
            </div>
          </div>
        </div>
      </div>
      <!-- facts Section End -->
    
      <!-- Team Section Start -->
      <div id="team" class="team-members-tow section-padding">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <h2 class="section-title wow fadeInDown animated" data-wow-delay="0.3s">Our Team</h2>
            </div>
          </div>
          <div class="row">
            <?php foreach($team as $t){?>
               <div class="col-lg-3 col-md-6 col-xs-12">
              <!-- Team Item Starts -->
              <figure>
                <img src="<?php echo base_url() ?>/<?php echo $t['team_image']?>" alt="" style="width:80%;height: 80%;">
                <div class="image-overlay">
                  <div class="overlay-text text-center">
                    <div class="info-text">
                      <strong><?php echo $t['member_name']?></strong>
                      <span>Photographer</span>
                    </div>
                    <hr class="small-divider">
                    <!-- <ul class="social-icons">
                      <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                      <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                      <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                    </ul> -->
                  </div>
                </div>
              </figure>
              <!-- Team Item Ends -->
            </div> 
            <?php }?>     
          </div>
        </div>
      </div>
      <!-- Team Section End -->
      <hr>
      <div class="team-members-tow section-padding">
        <div class="container">
          <div class="row">
            <div class="row col-md-9">
               <?php foreach ($gif as $Gif){?>
                <div class="col-md-4">
                  <img src="<?php echo base_url();?>/<?php echo $Gif['gif_image'] ?>">
                </div>     
               <?php }?> 
            </div>
            <div class="col-md-3">
              <img src="<?php echo base_url();?>public/img/offer.png" style="background: radial-gradient(black, transparent);"> 
            </div>
          </div>
        </div>
      </div>


      <!-- Single testimonial Start -->
      <div class="single-testimonial-area">
        <div class="container">
          <div id="single-testimonial-item" class="owl-carousel">
            <!-- Single testimonial Item -->
            <div class="item">
              <div class="row justify-content-md-center">
                <div class="col-lg-8 col-md-12 col-xs-12 col-md-auto">
                  <div class="testimonial-inner text-md-center">
                    <blockquote>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Id ipsam, non ut molestiae rerum praesentium repellat debitis iure reiciendis, eius culpa beatae commodi facere ad numquam. Quisquam dignissimos similique sunt iure fugit, omnis vel cupiditate repellendus magni nihil molestiae quam, delectus
                    </blockquote>
                    <div class="testimonial-images">
                      <img class="img-circle text-md-center" src="<?php echo base_url();?>public/img/testimonial/img1.jpg" alt="">
                    </div>
                    <div class="testimonial-footer">
                      <i class="fa fa-user"></i> Arman
                      <a href="#"> UIdeck</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Single testimonial Item -->
            <div class="item">
              <div class="row justify-content-md-center">
                <div class="col-lg-8 col-md-12 col-xs-12 col-md-auto">
                  <div class="testimonial-inner text-md-center">
                    <blockquote>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Id ipsam, non ut molestiae rerum praesentium repellat debitis iure reiciendis, eius culpa beatae commodi facere ad numquam. Quisquam dignissimos similique sunt iure fugit, omnis vel cupiditate repellendus magni nihil molestiae quam, delectus
                    </blockquote>
                    <div class="testimonial-images">
                      <img class="img-circle text-md-center" src="<?php echo base_url();?>public/img/testimonial/img2.jpg" alt="">
                    </div>
                    <div class="testimonial-footer">
                      <i class="fa fa-user"></i> Jeniffer
                      <a href="#"> GrayGrids</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Single testimonial Item -->
            <div class="item">
              <div class="row justify-content-md-center">
                <div class="col-lg-8 col-md-12 col-xs-12 col-md-auto">
                  <div class="testimonial-inner text-md-center">
                    <blockquote>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Id ipsam, non ut molestiae rerum praesentium repellat debitis iure reiciendis, eius culpa beatae commodi facere ad numquam. Quisquam dignissimos similique sunt iure fugit, omnis vel cupiditate repellendus magni nihil molestiae quam, delectus
                    </blockquote>
                    <div class="testimonial-images">
                      <img class="img-circle text-md-center" src="<?php echo base_url();?>public/img/testimonial/img3.jpg" alt="">
                    </div>
                    <div class="testimonial-footer">
                      <i class="fa fa-user"></i> Elon Musk<a href="#"> Tesla</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- end -->

      <!-- Contact Form Section Start -->
      <section id="contact" class="contact-form section-padding">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <h2 class="section-title wow fadeInDown animated" data-wow-delay="0.3s">Contact Us</h2>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-8 col-md-6 col-xs-12">
              <h3 class="title-head text-left">Get in touch</h3>
              <form action="<?php echo base_url();?>Home/contact" method="post" data-toggle="validator">
                <div class="row">
                  <div class="col-lg-4 col-md-12 col-xs-12">
                    <div class="form-group">
                      <i class="contact-icon fa fa-user"></i>
                      <input type="text" class="form-control" name="name" id="name" placeholder="Full Name" required data-error="Please enter your name">
                      <div class="help-block with-errors"></div>
                    </div>
                  </div>
                  <div class="col-lg-4 col-md-12 col-xs-12">
                    <div class="form-group">
                      <i class="contact-icon fa fa-envelope-o"></i>
                      <input type="email" class="form-control" name="email" id="email" placeholder="Email" required data-error="Please enter your email">
                      <div class="help-block with-errors"></div>
                    </div>
                  </div>
                  <div class="col-lg-4 col-md-12 col-xs-12">
                    <div class="form-group">
                      <i class="contact-icon fa fa-pencil-square-o"></i>
                      <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required data-error="Please enter your Subject">
                      <div class="help-block with-errors"></div>
                    </div>
                  </div>
                  
                  <div class="col-lg-12 col-md-12 col-xs-12">
                    <textarea class="form-control" id="message"  name="message" rows="4" placeholder="Message" required data-error="Please enter your message"></textarea>
                    
                     <div class="col-lg-4 col-md-12 col-xs-12">
                    <div class="form-group">
                  
              <input type="checkbox"><a data-toggle="modal" data-target="#myModal">Terms & Condition</a>
                    </div>
                    </div> <div class="clearfix"></div>
                    <div class="help-block with-errors"></div>
                    <input type="submit" id="form-submit" class="btn btn-common btn-form-submit" value="Send Message">
                    <div id="msgSubmit" class="h3 text-center hidden"></div>
                    <div class="clearfix"></div>
                  </div>
                 
                </div>
              </form>
            </div>

            <div class="col-lg-4 col-md-6 col-xs-12">
              <h4 class="contact-info-title text-left">Contact Information</h4>
              <div class="contact-info">
                <address>
                <i class="lni-map-marker icons cyan-color contact-info-icon"></i>
                  A/P-PALUS,DIST-SANGLI,TEL-PALUS,NEAR KASARWADA,VITTHAL TEMPLE,PALUS
              </address>
                <div class="tel-info">
                  <a href="tel:9823249523"><i class="lni-mobile icons cyan-color contact-info-icon"></i>+91-9823249523</a>
                  <a href="tel:8623882323"><i class="lni-phone icons cyan-color contact-info-icon"></i>+91-8623882323</a>
                </div>
                <a href="mailto:SHREYAPHOTOSPALUS@GMAIL.COM"><i class="lni-envelope icons cyan-color contact-info-icon"></i>shreyaphotospalus@gmail.com</a>
                <!-- <a href="#"><i class="lni-tab icons cyan-color contact-info-icon"></i></a> -->
                <ul class="social-links">
                  <li>
                    <a href="https://m.facebook.com" class="fa fa-facebook"></a>
                  </li>
                  <!-- <li>
                    <a href="#" class="fa fa-twitter"></a>
                  </li> -->
                  <li>
                    <a href="https://www.instagram.com/shivkumar_kharkande" class="fa fa-instagram"></a>
                  </li>
                  <li>
                    <!-- <a href="#" class="fa fa-linkedin"></a> -->
                    <a href="https://m.youtube.com/channel/UCPZX5xxwURFu4T66KaN4kSg"><i class="fa fa-youtube"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- Contact Form Section End -->
    
      <!-- terms &condition model start-->
      <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
        
          <!-- Modal content-->
          <div class="modal-content" style="margin-top: 65px;">
            <div class="modal-header">
              <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
              <h4 class="modal-title">Terms & Condition</h4>
            </div>
            <div class="modal-body">
              TERMINATION You agree that .com may terminate your use of this website if it believes that you have violated or acted inconsistently with the letter or spirit of these Terms and Conditions, violated the rights of .com or any third party, or for any reason with or without notice to you. You agree that .com may modify or discontinue this website, with or without notice to you. You agree that .com will not be liable to you or any third party as a result of such modification or discontinuation
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
          
        </div>
      </div>
      <!-- terms &condition model end-->
	

<!-- Sripts strat -->
<script type="text/javascript">
  $(document).ready(function(){
    $(".filter-button").click(function(){
        var value = $(this).attr('data-filter');
        if(value == "all1")
        {
            //$('.filter').removeClass('hidden');
            $('.filter1').show('1000');
        }
        else
        {
//            $('.filter[filter-item="'+value+'"]').removeClass('hidden');
//            $(".filter").not('.filter[filter-item="'+value+'"]').addClass('hidden');
            $(".filter1").not('.'+value).hide('3000');
            $('.filter1').filter('.'+value).show('3000');
            
        }
    });
      $(this).addClass("active");
    });
</script>

<!-- Owl carousel start -->
<script type="text/javascript">
 $(document).ready(function() {
  $("#owl-demo").owlCarousel({
    items : 4,
    lazyLoad : true,
    navigation : true,
    autoPlay: 3000,
  }); 
});


 $(document).ready(function() {
  var owl = $("#owl-demo1");
  owl.owlCarousel({
      items : 7,
      itemsDesktop : [1000,5],
      itemsDesktopSmall : [900,3], 
      itemsTablet: [600,2], 
      itemsMobile : false 
  });
 
  // Custom Navigation Events
  $(".next").click(function(){
    owl.trigger('owl.next');
  })
  $(".prev").click(function(){
    owl.trigger('owl.prev');
  })
  $(".play").click(function(){
    owl.trigger('owl.play',1000);
  })
  $(".stop").click(function(){
    owl.trigger('owl.stop');
  })
 
});
</script>