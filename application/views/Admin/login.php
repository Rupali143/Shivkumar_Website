<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>LoadXone | Log in</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="<?= base_url() ?>public/css/bootstrap.min.css">
        <link rel="stylesheet" href="<?= base_url() ?>public/css/AdminLTE.min.css">
    </head>
    <body class="hold-transition login-page">
        <div class="login-box">
            <div class="login-logo">
                <a href="<?= base_url() ?>"><b>WeddingShreya Studio</b></a>
            </div>
            <!-- /.login-logo -->
            <!--<div class="login-box-body">-->

            <div class="panel panel-primary">                 
                <!-- <div class="panel-heading">Sign In</div> -->
                <div class="panel-body">
                    <?php echo form_open('login/user_loginadmin'); ?>
                    <div class="col-md-12">
                        <?php
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
                                <i class="icon fa fa-check"></i> Error! <?php echo $this->session->flashdata('error') ?>
                            </div>
                        <?php }
                        ?>
                    </div>
                    <div class="clearfix"></div>

                    <div class="form-group has-feedback">
                        <input type="text" name="txtuname" id="txtuname" class="form-control" required="" placeholder="Username">
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" name="txtupswd" id="txtupswd" class="form-control" required="" placeholder="Password">
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                         <input type="checkbox" name="remember" value="1" id="remember" />
                        <label for="remember"> Remember me</label>                       
                    </div>
                    <div class="row">
                        <div class="col-xs-4">
                            <input type="submit" value="Sign In" name="submit" class="btn btn-primary btn-block btn-flat pull-right"/>
                        </div>
                    </div>
                    <?php echo form_close(); ?>
                </div>
            </div>
            <!--</div>-->
            <!-- /.login-box-body -->
        </div>
        <!-- /.login-box -->
    </body>
</html>
