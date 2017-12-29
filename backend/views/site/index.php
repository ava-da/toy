<?php

/* @var $this yii\web\View */
use yii\helpers\Url;
$this->title = 'Orders Management System (OMS)';
$urlCustomer = Url::to(['customer/customer']);
$urlOrder = Url::to(['order/order']);
$urlStatus = Url::to(['order/product-status']);
?>
<div class="site-index">

    <div class="jumbotron">
        <h1></h1>

       
    </div>

    <div class="body-content">

        <div class="row">
            <div class="col-lg-4">
                <a class="btn btn-lg btn-success" href="<?php echo $urlCustomer; ?>">Customers List</a>
            </div>
            <div class="col-lg-4">
                <a class="btn btn-lg btn-success" href="<?php echo $urlOrder; ?>">Orders List</a>
            </div>
            <div class="col-lg-4">
                <a class="btn btn-lg btn-success" href="<?php echo $urlStatus; ?>">Products - Status</a>
            </div>
            
        </div>

    </div>
</div>
