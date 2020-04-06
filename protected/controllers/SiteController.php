<?php

/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
namespace app\controllers;

use app\components\TActiveForm;
use app\components\TController;
use app\models\ContactForm;
use app\models\EmailQueue;
use app\models\User;
use Yii;
use yii\filters\AccessControl;
use yii\web\Response;
use yii\data\ActiveDataProvider;
use app\models\Category;
use app\modules\blog\models\Post;
use app\models\Team;
use app\models\Testimonials;
use app\models\Banner;
use app\models\Page;
use app\models\SubscribedUsers;
use app\modules\notification\models\Notification;
use app\modules\payment\models\Transaction;
use yii\helpers\VarDumper;

class SiteController extends TController
{

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => [
                            'index',
                            'contact',
                            'about',
                            'policy',
                            'terms',
                            'error',
                            'features',
                            'blogs',
                            'blog-detail',
                            'how-it-works',
                            'our-team',
                            'payment-complete',
                            'test'
                        ],
                        'allow' => true,
                        'roles' => [
                            '*',
                            '@',
                            '?'
                        ]
                    ]
                ]
            ]
        ];
    }

    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction'
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null
            ]
        ];
    }

    public function actionPaymentComplete()
    {
        $this->layout = 'guest-main';
        $workingKey = '90B0B176F5239A99ED2E1E42F1A2D002'; // Working Key should be provided here.
                                                          // $encResponseIOS = '07007ccbbed00cc0639e8f347a045bc16cb8e9d98c2af45b0907291c41a563480d258f9f1ede3db15f919233d1bec362b5c9084d1f62943e4b1b0e709cc60540b5dd0a6c2c7510599acdd5a7de054f652ccf46e9ef9fa1d08576520ff9a6c82776cb894782a1fc6f8b181cfea29745dc331e05133bbd876050477f78a3418a2ef756ab2dcfde736cc1783abbe7ebde1c2aa72a8cf1f8a50ceb88f49c16ec94a77fad13d72bb3bc77ff5f65afd5c582b544cb54bb0258416350fc51dd36ab79433c3c37244930fbd9281af082d6e9e215fbac0a8bce1d1a6277bfddc6b82cdab12feae73b4787194823b171b89eadb31db8758d2d5cb27b7c1efa301f184cf73ce11a855429a570c26a5ceb003f08fe3a381da957d206b744eda37b4670562841a44719dfb06db2dd034a5c3bbba687a5cadfe65775c1bbd1930c7c1d7da5f99a1964c968fd8749c71ee57133c4d5f44921b8fd8f7c98583b53c5dc31c6b72bb23fddb1be1aca1b73b11e42d68cc7b7f88555eaea47c76103e8a4d63a6331600d32cf4a65092e71a460d268ab6fc7502c190879294c7f252e1da4fec90ef0cfa49046a7addcdf321154d53cf3cc99704f817cb39e4229d4af57608a68030094c6107c0ea7632dc564aef73832bf86df4308cac94b62db4a41e317131fbc794f81492079ed73997ce85dcf82856167629289242de5174362b34a211ee5e0c40666f6ab3cf9a0c3313769522eb24656bff1a47ab31e930c9118f528a4a5dcc5cb43a74ec85f066796c5cb5d39530b00cc53f432c258f85e7ebae7d488e2ff8f6750590e89db7ecada7ef40804501a8c9c1854b729a0b8bd1bc53939d8a9855c04c61f43b99dd65338530975ea9fe134a3d1b869634142412a0ccf9788bdf158cd6f74eafd39309686fee6838042fbff94244e0ad5d2e75c95bd8b2bfeefc7d0437214af9a3fb6ef961f645e65e6cdf854d4b817da97ff7dfc4a1fc2846bb284eeb06646fd3466c11f2add032862ef84c14b2db1d6469318a8ee3256583b59cfad7ab24e37cafe37d5c88b0af2403a08858423e25e9b9e01d782bdfa495bbaabdb5e580549a8c12454d2c05103ed8b9c6cc519bce7196b03844c5c32c7fdbc49951b72539c48eb4989aa456a3cee6ff1fd1052284c8d90d3e132ff73a1dc5977934f';

        // $encResponse = 'df0df918965bcf63927f5bc7dbef23c07e171ed4328e3df7a73201c660b00c8262e3c62d997f1119a3a1b47f1f21900dbb2ab42c1255a89f02d7cc6615aa752b6c0197ad97201022f1522333e0e85eaaf4f87af1fce0fb675b099ff4fc0331131f5153c894a1cdaad6d11fd3d1c73ef5689cb80533b5231fb39ca7cfdb7cee34023b55247700815906f205b03808c9ac950967030955873752b5233a66c49baba9e965d8ef4a8a24bf4b4b549a6dce2a583d17923a0fa0ba4fff39ec193926e2f336cd3f01a8f031482deec2d25452bd76d88cafd058b2a55dd50aa6a2b1643a9f534fb208148cc99c612fd5b8cf2f8094b1c786af6b14ed7c1eaa01f14f7d7494640f4208747b783bce15197141b5dfcc76fcabea924b40918425ccc8c9f46f295793270031de9635f950c8da0e57439b40c1674d56c4498dc65807e7bae01c5b106fe1c49ece90d95d3b8053ce3d0501045efb69dd5683675021167ce2a1f97d4ed56e1fc2da06c1b260c9372a6daf7def8c9c28dbda098c3d66beed215faecbe86d4fd50a961a852086e2d4efbd3f8108e17f4f8d26330aa7448ec1c9ee7762d37c91e3137c12132f4652be493c2ccaa91487acef491abb5a8f85d8172bda959c0194ec30399ae8667f59bbfe3bf048e682768056b862f18b71430a87c24df070fd7c1a9f6f56c88265faf1384d8e46a69132fb207359250f4fc00e37c8dd741fecd512337409ea8f94cdd3c3e378c767373b0ef57043988bdf55c4a60d52ffe7bcdab5d4fe71a243c2945cfe2d3cbbe4c9a881770cd8f26f2e734f693f4602ef24d066e751198a0fc45754e006f8368fc527f69a3d8510010baedad366baa1cbcb408a24413df3729c242a96537f0b7168500af7fcbf3ec736b2296065fef8b2a218a63f47ee8916cd88c85c9007abd59de63913b70c4ec9ec4e30f20da823529a1d6ba4315cf0e5c86cae8cadc2b5bd9fe0c5d3cb195c88cc217152c24a21fdb01449d63ba4512172f2f0bfd9474f2fbcc18d840bba8d20bb7ed6108acd725b2119507371352ac734ae9b1236bfda0f0f2915213e2ba5fee9ab1dc3e8de8c6cc9c4e3f4e5a6a0946a3bf57f9d91869bbd673027f696e29abfca1cec26bf593f8a3ae53b3da267cb15594b8503da16926d27728e8a083e9ad696f5f4937ffcbc92246e4fdd87a34db9beac379ded0ca5696f38bba1feeab2136fa7cadbe5';
        $encResponse = $_POST["encResp"];
        // This is the response sent by the CCAvenue Server
        $rcvdString = User::decrypt($encResponse, $workingKey); // Crypto Decryption used as per the specified working key.

        // $rcvdStringIOS = User::decryptIOS($encResponseIOS, $workingKey); // Crypto Decryption used as per the specified working key.

        $decryptValues = explode('&', $rcvdString);

        // $decryptValuesIOS = explode('&', $rcvdStringIOS);

        // var_dump(($decryptValuesIOS));
        // var_dump(($decryptValues));
        // exit();
        $order_status = "";
        $dataSize = sizeof($decryptValues);
        echo "<center>";
        for ($i = 0; $i < $dataSize; $i ++) {

            $information = explode('=', $decryptValues[$i]);

            if ($i == 3)
                $order_status = $information[1];
            if ($i == 2)
                $transaction = $information[1];
        }

        $model = SubscribedUsers::find()->where([
            'id' => $_POST["orderNo"]
        ])->one();

        if (! empty($model)) {
            $payment = new Transaction();
            $payment->model_id = $model->id;
            $payment->model_type = get_class($model);
            $payment->currency = 'INR';
            $payment->amount = $model->price;
            $payment->transaction_id = $transaction;
            $payment->value = $rcvdString;
            $payment->created_by_id = $model->created_by_id;

            if ($payment->save()) {
                $message = $model->createdBy->full_name . \Yii::t('app', " has sent you an appointment request");
                if (Notification::create($param = [
                    'to_user_id' => $model->doctor_id,
                    'created_by_id' => $model->created_by_id,
                    'title' => $message,
                    'model' => $model
                ])) {
                    \Yii::$app->getSession()->setFlash('success', Yii::t('app', 'Congrats!! Now you are a subscribed user'));
                }
            } else {
                \Yii::$app->getSession()->setFlash('error', $payment->getErrorsString());
            }

            if ($order_status === "Success") {
                $payment->payment_status = SubscribedUsers::PAYMENT_STATUS_PAID;
                $payment->updateAttributes([
                    'payment_status'
                ]);
                $model->payment_status = SubscribedUsers::PAYMENT_STATUS_PAID;
                $model->updateAttributes([
                    'payment_status'
                ]);
                echo "<br>Thank you for shopping with us. Your credit card has been charged and your transaction is successful. We will be shipping your order to you soon.";
            } else if ($order_status === "Aborted") {
                echo "<br>Thank you for shopping with us.We will keep you posted regarding the status of your order through e-mail";
            } else if ($order_status === "Failure") {
                echo "<br>Thank you for shopping with us.However,the transaction has been declined.";
            } else {
                echo "<br>Security Error. Illegal access detected";
            }
            echo $order_status;
            die();
        }
    }

    public function actionTest($to_email)
    {
        $mailer = \Yii::$app->mailer;
        $mail = $mailer->compose();
        $mail->setHtmlBody('Hello')
            ->setTo($to_email)
            ->setFrom('info@callvydya.com')
            ->setSubject('Test');

        $mail_sent = $mail->send();

        VarDumper::dump($mail_sent);
        exit();
    }

    public function actionPaymentCancel()
    {
        echo 'Booking Cancelled';
        echo "<br>Your Booking has been cancelled";
        die();
    }

    public function actionError()
    {
        $exception = \Yii::$app->errorHandler->exception;
        return $this->render('error', [
            'message' => $exception->getMessage(),
            'name' => 'Error'
        ]);
    }

    public function actionIndex()
    {
        $features = Category::find()->orderBy('id DESC')
            ->limit(6)
            ->all();

        $teams = Team::find()->orderBy('id DESC')
            ->limit(3)
            ->all();
        $testimonials = Testimonials::find()->orderBy('id DESC')
            ->limit(5)
            ->all();
        $banners = Banner::find()->orderBy('id DESC')
            ->limit(5)
            ->all();
        if (! \Yii::$app->user->isGuest) {
            if (User::isAdmin()) {
                return $this->render('/dashboard/index');
            } else {
                return $this->render('index', [
                    'features' => $features,
                    'teams' => $teams,
                    'testimonials' => $testimonials,
                    'banners' => $banners
                ]);
            }
        } else {
            return $this->render('index', [
                'features' => $features,
                'teams' => $teams,
                'testimonials' => $testimonials,
                'banners' => $banners
            ]);
        }
    }

    public function actionFeatures()
    {
        $query = Category::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'id' => SORT_DESC
                ]
            ]
        ]);
        return $this->render('features', [
            'dataProvider' => $dataProvider
        ]);
    }

    public function actionOurTeam()
    {
        $query = Team::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'id' => SORT_DESC
                ]
            ]
        ]);
        return $this->render('team', [
            'dataProvider' => $dataProvider
        ]);
    }

    public function actionBlogs()
    {
        $query = Post::findActive();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'id' => SORT_DESC
                ]
            ]
        ]);
        return $this->render('blogs', [
            'dataProvider' => $dataProvider
        ]);
    }

    public function actionHowItWorks()
    {
        $model = Page::find()->where([
            'type_id' => Page::TYPE_HOW_IT_WORKS
        ])->one();

        if (! empty($model)) {
            return $this->render('how-it-works', [
                'model' => $model
            ]);
        }
        \Yii::$app->getSession()->setFlash('error', 'No Page Found');
        return $this->redirect([
            'index'
        ]);
    }

    public function actionContact()
    {
        $model = new ContactForm();
        $this->layout = 'guest-main';
        if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post())) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return TActiveForm::validate($model);
        }
        if ($model->load(Yii::$app->request->post())) {

            $sub = 'New Contact: ' . $model->subject;
            $from = $model->email;
            $message = \yii::$app->view->renderFile('@app/mail/contact.php', [
                'user' => $model
            ]);
            EmailQueue::sendEmailToAdmins([
                'from' => $from,
                'subject' => $sub,
                'html' => $message
            ], true);

            \Yii::$app->getSession()->setFlash('success', \Yii::t('app', 'Warm Greetings!! Thank you for contacting us. We have received your request. Our representative will contact you soon.'));

            return $this->render('contact', [
                'model' => $model
            ]);
        }

        return $this->render('contact', [
            'model' => $model
        ]);
    }

    /**
     *
     * @return string
     */
    public function actionAbout()
    {
        $this->layout = 'guest-main';
        return $this->render('about');
    }

    public function actionBlogDetail($id)
    {
        $this->layout = 'guest-main';
        $model = Post::findOne($id);

        if (! empty($model)) {
            return $this->render('blog-detail', [
                'model' => $model
            ]);
        }
        \Yii::$app->getSession()->setFlash('error', 'No Blog Found');
        return $this->redirect(\Yii::$app->request->referrer);
    }

    public function actionPolicy()
    {
        $this->layout = 'guest-main';
        return $this->render('policy');
    }

    public function actionTerms()
    {
        $this->layout = 'guest-main';
        return $this->render('term');
    }
}