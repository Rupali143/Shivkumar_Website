<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <h4 class="box-title"><a href="<?php echo base_url();?>Modeling/add_Modeling" class="btn btn-primary">Add Modeling</a></h4>
                <div class="ml-auto text-right">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Modeling</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Add Modeling Photo</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <?php
        $geteditid = $this->uri->segment(3);
        if ($this->session->flashdata('success')) {
            ?>
            <div class="alert alert-success">      
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-check"></i> Success! <?php echo $this->session->flashdata('success') ?>
            </div>
            <?php
        }
        if ($this->session->flashdata('error')) {
            ?>
            <div class="alert alert-error">      
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-check"></i> Error!<?php echo $this->session->flashdata('error') ?>
            </div>
        <?php }
        ?>
    </div>
    <div class="container-fluid">
        <!-- ============================================================== -->
        <!-- Start Page Content -->
        <!-- ============================================================== -->
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <?php
                    if (empty($geteditid))
                        echo form_open_multipart('Modeling/saveMain');
                    else
                        echo form_open_multipart('Modeling/editsaveadvertisement/' . $geteditid);
                    ?>                  
                    <?= $form; ?>
                    <div class="box-footer">
                        <button type="submit" class="btn btn-success">Submit</button>
                    </div>
                    <?php echo form_close(); ?>

                </div>
            </div>

        </div>
        <!-- editor -->
    </div>
</div>
