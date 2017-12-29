<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-backend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log'],
    'modules' => [
    	'customer' => [
            'class' => 'app\modules\customer\Module',
        ],
        'order' => [
            'class' => 'app\modules\order\Module',
        ],
    ],
    'components' => [
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'enableStrictParsing' => false,
            'rules' => [
                    'posts' => 'post/index', 
                    'post/<id:\d+>' => 'post/view',
                    'order/order-product/create/<orderId:\d+>' => 'order/order-product/create/',
                    'order/order-product/list/<orderId:\d+>' => 'order/order-product/list/',
                    'order/order-product/view/<id:\d+>' => 'order/order-product/view/',
                    'order/order-product/update/<id:\d+>' => 'order/order-product/update/',
                    'order/product-status/list/<id:\d+>' => 'order/product-status/list/',
                    'order/product-status/change/<productId:\d+>' => 'order/product-status/change/',
                    'order/product-status/history/<productId:\d+>' => 'order/product-status/history/',
            ],
            
            /*'rules' => [
                '<_m>/<_c>/<_a>/<id>' =>'<_m>/<_c>/<_a>'
            ],*/
        ],
        'formatter' => [
            'class' => 'yii\i18n\Formatter',
            'thousandSeparator' => '،',
            'currencyCode' => 'تومان',
       ],
       'view' => [
        'theme' => [
            'basePath' => 'app\template\adminLTE',
            /*'pathMap' => [
                '@app/views' => '@themes/adminLTE/views',
                '@aca' => '@themes/adminLTE/views/modules',
            ],*/
        ],
    ],
        
    ],
    'params' => $params,
];

