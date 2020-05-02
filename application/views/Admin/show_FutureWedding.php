<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb">
        <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
                <!--<h4 class="page-title">Form Basic</h4>-->
                <h4 class="box-title"><a href="<?= base_url() ?>FutureWeddingController/add_FutureWedding" class="btn btn-primary">Add Future-Wedding</a></h4>
                <div class="ml-auto text-right">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Future-Wedding</a></li>
                            <li class="breadcrumb-item active" aria-current="page">View Future-Wedding</li>
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

                    <div class="col-md-12"> 
                        <table id="adverTbl" class="table table-bordered ">
                            <thead>
                                <tr>

                                    <th>Caption</th>
                                    <th>Image</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                foreach ($mainlist as $value) {


                                    if ($value['status_id'] == 1) {
                                        $iconcls = "btn-success";
                                        $status = "Active";
                                    } else {
                                        $iconcls = "btn-danger";
                                        $status = "Inactive";
                                    }
                                    ?>


                                    <tr>
                                        <td><?php echo $value['futureWedding_caption']; ?></td>
                                        <td><img src="<?php echo base_url() . $value['futureWedding_image']; ?>" width="75px" height="75px"/></td>
                                        <td><?php echo $value['date']; ?></td>
                                        <td><span class="<?= $iconcls ?>"><?php echo $status; ?></span></td>
                                        <td><div style="text-align:center; width:150px;">
                                                <a href="<?= base_url() ?>FutureWeddingController/adminchange_status/<?= $value['futureWedding_id'] ?>" data-toggle="tooltip" title="status"><button type="button" class="btn btn-primary <?= $iconcls ?>">Status</button></a>
                                                <!--<a href="<?= base_url() ?>Advertisementpackage/edit_view/<?= $value['carous_id'] ?>" data-toggle="tooltip" title="edit"><button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-pencil edit-icon"></span></button></a>-->
                                                &nbsp;<button type="button" data-toggle="tooltip" title="delete" class="btn btn-primary" onclick="deleteConfirm('<?= $value['futureWedding_id'] ?>')">Delete</button>
                                            </div></td>
                                    </tr>
                                <?php } ?>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <!-- editor -->
    </div>
</div>
<script type="text/javascript">
var url = "<?= base_url()?>";
function deleteConfirm($id){
    var r = confirm("Do you want to delete this?");
    if(r ==true){
        window.location = url +"FutureWeddingController/deleteFutureWedding/"+$id;
    }else{
        return false;
    }
}
</script>