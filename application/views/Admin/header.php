<?php // echo 'hiii';die;  ?>
<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
        <title>Shiv</title>
        <!-- Custom CSS -->
        <link href="<?php echo base_url(); ?>assets/libs/flot/css/float-chart.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="<?php echo base_url(); ?>dist/css/style.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>assets/extra-libs/DataTables/DataTables-1.10.16/css/jquery.datatables.min.css">
        <!-- scripts -->
    </head>

    <body>
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper">
            <!-- ============================================================== -->
            <!-- Topbar header - style you can find in pages.scss -->
            <!-- ============================================================== -->
            <header class="topbar" data-navbarbg="skin5">
                <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                    <div class="navbar-header" data-logobg="skin5">
                        <!-- This is for the sidebar toggle which is visible on mobile only -->
                        <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                        <!-- ============================================================== -->
                        <!-- Logo -->
                        <!-- ============================================================== -->
                        <a class="navbar-brand" href="<?php echo base_url();?>Admin/dashboard">
                            <!-- Logo icon -->
                            <b class="logo-icon">
                                <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                                <!-- Dark Logo icon -->
                                <!--<img src="<?php // echo base_url();  ?>public/img/WeddingShreya_Logo.jpg" alt="homepage" class="img img-responsive" />-->

                            </b>
                            <!--End Logo icon -->
                            <!-- Logo text -->
                            <span class="logo-text">
                                <!-- dark Logo text -->
                                <img src="<?php echo base_url(); ?>public/img/logoShreya.jpg" alt="homepage" class="light-logo" />

                            </span>
                        </a>
                        <!-- ============================================================== -->
                        <!-- End Logo -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- Toggle which is visible on mobile only -->
                        <!-- ============================================================== -->
                        <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="ti-more"></i></a>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                        <!--                     ============================================================== 
                                             toggle and nav items 
                                             ============================================================== -->
                        <ul class="navbar-nav float-left mr-auto">
                            <li class="nav-item d-none d-md-block"><a class="nav-link sidebartoggler waves-effect waves-light" href="javascript:void(0)" data-sidebartype="mini-sidebar"><i class="mdi mdi-menu font-24"></i></a></li>
                            <!--                         ============================================================== 
                                                     create new 
                                                     ============================================================== -->
<!--                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="d-none d-md-block">Create New <i class="fa fa-angle-down"></i></span>
                                    <span class="d-block d-md-none"><i class="fa fa-plus"></i></span>   
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </li>-->
                            <!--                         ============================================================== 
                                                     Search 
                                                     ============================================================== -->
<!--                            <li class="nav-item search-box"> <a class="nav-link waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
                                <form class="app-search position-absolute">
                                    <input type="text" class="form-control" placeholder="Search &amp; enter"> <a class="srh-btn"><i class="ti-close"></i></a>
                                </form>
                            </li>-->
                        </ul>
                        <!--                     ============================================================== 
                                             Right side toggle and nav items 
                                             ============================================================== -->
                        <ul class="navbar-nav float-right">
                            <!--                         ============================================================== 
                                                     Comment 
                                                     ============================================================== -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-bell font-24"></i>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </li>
                            <!--                         ============================================================== 
                                                     End Comment 
                                                     ============================================================== 
                                                     ============================================================== 
                                                     Messages 
                                                     ============================================================== -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle waves-effect waves-dark" href="" id="2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="font-24 mdi mdi-comment-processing"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right mailbox animated bounceInDown" aria-labelledby="2">
                                    <ul class="list-style-none">
                                        <li>
                                            <div class="">
                                                Message 
                                                <a href="javascript:void(0)" class="link border-top">
                                                    <div class="d-flex no-block align-items-center p-10">
                                                        <span class="btn btn-success btn-circle"><i class="ti-calendar"></i></span>
                                                        <div class="m-l-10">
                                                            <h5 class="m-b-0">Event today</h5> 
                                                            <span class="mail-desc">Just a reminder that event</span> 
                                                        </div>
                                                    </div>
                                                </a>
                                                Message 
                                                <a href="javascript:void(0)" class="link border-top">
                                                    <div class="d-flex no-block align-items-center p-10">
                                                        <span class="btn btn-info btn-circle"><i class="ti-settings"></i></span>
                                                        <div class="m-l-10">
                                                            <h5 class="m-b-0">Settings</h5> 
                                                            <span class="mail-desc">You can customize this template</span> 
                                                        </div>
                                                    </div>
                                                </a>
                                                Message 
                                                <a href="javascript:void(0)" class="link border-top">
                                                    <div class="d-flex no-block align-items-center p-10">
                                                        <span class="btn btn-primary btn-circle"><i class="ti-user"></i></span>
                                                        <div class="m-l-10">
                                                            <h5 class="m-b-0">Pavan kumar</h5> 
                                                            <span class="mail-desc">Just see the my admin!</span> 
                                                        </div>
                                                    </div>
                                                </a>
                                                Message 
                                                <a href="javascript:void(0)" class="link border-top">
                                                    <div class="d-flex no-block align-items-center p-10">
                                                        <span class="btn btn-danger btn-circle"><i class="fa fa-link"></i></span>
                                                        <div class="m-l-10">
                                                            <h5 class="m-b-0">Luanch Admin</h5> 
                                                            <span class="mail-desc">Just see the my new admin!</span> 
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <!--                         ============================================================== 
                                                     End Messages 
                                                     ============================================================== 
                            
                                                     ============================================================== 
                                                     User profile and search 
                                                     ============================================================== -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="<?php echo base_url();?>/assets/images/users/1.jpg" alt="user" class="rounded-circle" width="31"></a>
                                <div class="dropdown-menu dropdown-menu-right user-dd animated">
                                    <a class="dropdown-item" href="javascript:void(0)"><i class="ti-user m-r-5 m-l-5"></i> My Profile</a>
                                    <a class="dropdown-item" href="javascript:void(0)"><i class="ti-wallet m-r-5 m-l-5"></i> My Balance</a>
                                    <a class="dropdown-item" href="javascript:void(0)"><i class="ti-email m-r-5 m-l-5"></i> Inbox</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="javascript:void(0)"><i class="ti-settings m-r-5 m-l-5"></i> Account Setting</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="<?php echo base_url();?>Login/user_logout"><i class="fa fa-power-off m-r-5 m-l-5"></i> Logout</a>
                                    <div class="dropdown-divider"></div>
                                    <div class="p-l-30 p-10"><a href="javascript:void(0)" class="btn btn-sm btn-success btn-rounded">View Profile</a></div>
                                </div>
                            </li>
                            <!--                         ============================================================== 
                                                     User profile and search 
                                                     ============================================================== -->
                        </ul>
                    </div>
                </nav>
            </header>
            <aside class="left-sidebar" data-sidebarbg="skin5">
                <!-- Sidebar scroll-->
                <div class="scroll-sidebar">
                    <!-- Sidebar navigation-->
                    <nav class="sidebar-nav">
                        <ul id="sidebarnav" class="p-t-30">
                            <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-dark waves-effect sidebar-link" href="#" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">MainCourosel</span></a>
                                <ul aria-expanded="false" class="collapse  first-level">
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>MainCarou/add_MainCorousel" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">Add Main_img </span></a></li>
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>MainCarou/show_MainCorousel" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> View Main_img </span></a></li>
                                </ul>
                            </li>

                            <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-dark waves-effect" href="#" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">Modeling Photo</span></a>
                                <ul aria-expanded="false" class="collapse  first-level">
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>Modeling/add_Modeling" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">Add Modeling Photo </span></a></li>
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>Modeling/show_Modeling" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> View Modeling Photo </span></a></li>
                                </ul>
                            </li>

                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">Maternity</span></a>
                                 <ul aria-expanded="false" class="collapse  first-level">
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>Maternity/add_Maternity" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">Add Maternity Photo </span></a></li>
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>Maternity/show_Maternity" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> View Maternity Photo </span></a></li>
                                </ul>
                           </li>

                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">Engagement</span></a>
                                 <ul aria-expanded="false" class="collapse  first-level">
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>Engagement/add_Engagement" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">Add Engagement Photo </span></a></li>
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>Engagement/show_Engagement" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> View Engagement Photo </span></a></li>
                                </ul>
                           </li>

                           <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">Gif</span></a>
                                 <ul aria-expanded="false" class="collapse  first-level">
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>GifController/add_Gif" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">Add Gif </span></a></li>
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>GifController/show_Gif" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> View Gif </span></a></li>
                                </ul>
                           </li>

                           <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">Team</span></a>
                                 <ul aria-expanded="false" class="collapse  first-level">
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>TeamController/add_Team" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">Add Team </span></a></li>
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>TeamController/show_Team" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> View Team </span></a></li>
                                </ul>
                           </li>

                           <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">Wedding</span></a>
                                 <ul aria-expanded="false" class="collapse  first-level">
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>WeddingController/add_Wedding" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">Add Wedding </span></a></li>
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>WeddingController/show_Wedding" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> View Wedding </span></a></li>
                                </ul>
                           </li>

                           <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">Destination Wedding</span></a>
                                 <ul aria-expanded="false" class="collapse  first-level">
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>DestWeddingController/add_destWedding" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">Add Destination Wedding </span></a></li>
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>DestWeddingController/show_destWedding" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> View Destination Wedding </span></a></li>
                                </ul>
                           </li>

                           <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">Bridal</span></a>
                                 <ul aria-expanded="false" class="collapse  first-level">
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>BridalController/add_Bridal" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">Add Bridal</span></a></li>
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>BridalController/show_Bridal" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> View Bridal</span></a></li>
                                </ul>
                           </li>
                           <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">Makeup</span></a>
                                 <ul aria-expanded="false" class="collapse  first-level">
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>MakeupController/add_Makeup" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">Add Makeup</span></a></li>
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>MakeupController/show_Makeup" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> View Makeup</span></a></li>
                                </ul>
                           </li>

                           <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">Pre-Wedding</span></a>
                                 <ul aria-expanded="false" class="collapse  first-level">
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>PreWeddingController/add_PreWedding" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">Add Pre-Wedding</span></a></li>
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>PreWeddingController/show_PreWedding" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> View Pre-Wedding</span></a></li>
                                </ul>
                           </li>

                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">Post-Wedding</span></a>
                                 <ul aria-expanded="false" class="collapse  first-level">
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>PostWeddingController/add_PostWedding" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">Add Post-Wedding</span></a></li>
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>PostWeddingController/show_PostWedding" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> View Post-Wedding</span></a></li>
                                </ul>
                           </li>

                            <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark has-arrow" href="#" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">Future-Wedding</span></a>
                                 <ul aria-expanded="false" class="collapse  first-level">
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>FutureWeddingController/add_FutureWedding" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">Add Future-Wedding</span></a></li>
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>FutureWeddingController/show_FutureWedding" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> View Future-Wedding</span></a></li>
                                </ul>
                           </li>

                            <li class="sidebar-item"> <a class="sidebar-link has-arrow waves-dark waves-effect" href="#" aria-expanded="false"><i class="mdi mdi-chart-bar"></i><span class="hide-menu">Advertisement</span></a>
                                <ul aria-expanded="false" class="collapse  first-level">
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>Advertisement/add_advertisement" class="sidebar-link"><i class="mdi mdi-note-outline"></i><span class="hide-menu">Add Advertisement Photo </span></a></li>
                                    <li class="sidebar-item"><a href="<?php echo base_url();?>Advertisement/show_advertisement" class="sidebar-link"><i class="mdi mdi-note-plus"></i><span class="hide-menu"> View Advertisement Photo </span></a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                    <!-- End Sidebar navigation -->
                </div>
                <!-- End Sidebar scroll-->
            </aside>
             <!-- <script src="<?php echo base_url();?>public/js/jquery-min.js"></script> -->
        <script type="text/javascript" src="<?php echo base_url();?>assets/extra-libs/DataTables/DataTables-1.10.16/js/jquery.datatables.min.js"></script>
            <script>
                $(document).ready(function () {
                $.noConflict();
                var table = $('#carousel_table').DataTable();
                });
            </script>