<?php
/**
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author	 : Shiv Charan Panjeta < shiv@toxsl.com >
 */
use app\components\PageHeader;
use app\components\TDetailView;
use app\components\useraction\UserAction;
use app\models\Appointment;
use app\models\PatientMedicalInformation;
use app\models\User;
use app\models\Workprofile;
use miloschuman\highcharts\Highcharts;
use yii\helpers\Html;
/* @var $this yii\web\View */
/* @var $model app\models\User */

if ($model->role_id == User::ROLE_DOCTOR) {

    $this->params['breadcrumbs'][] = [
        'label' => 'Doctor',
        'url' => [
            'doctor-index'
        ]
    ];
} else {
    $this->params['breadcrumbs'][] = [
        'label' => 'Patient',
        'url' => [
            'index'
        ]
    ];
}

$this->params['breadcrumbs'][] = [
    'label' => $model->full_name
];

?>
<div class="wrapper">

	<div class=" panel ">
		<?php

echo PageHeader::widget([
    'model' => $model
]);
?>
	</div>
	<div class="panel">
		<div class=" panel-body">
			<div class="col-md-2">
		<?php

if (! empty($model->profile_file)) {
    ?>
				<?=$model->displayImage($model->profile_file, ['height' => '50px','weight' => '50px'])?><br />
				<br />
				<p>
    			<?=Html::a('Download image file', ['download','profile_file' => $model->profile_file], ['class' => 'btn btn-success','name' => 'download-button'])?>
   			 	</p>   			 	
   			 	<?php
}
?>
			</div>
			<div class="col-md-10">
				<h3><?=Yii::t('app', 'Profile')?></h3>
			
			<?php
echo TDetailView::widget([
    'model' => $model,
    'attributes' => [
        'id',
        [
            'attribute' => 'full_name',
            'format' => 'raw',
            'value' => $model->getFullName()
        ],
        'email:email',

        'contact_no',
        [
            'attribute' => 'role_id',
            'format' => 'raw',
            'value' => $model->getRoleOptions($model->role_id)
        ],

        'created_on:datetime'
    ]
])?>
	<?php

if ($model->role_id == User::ROLE_DOCTOR) {
    ?>
<h3><?=Yii::t('app', 'Work Profile')?></h3>
<?php
    $workProfile = Workprofile::find()->where([
        'created_by_id' => $model->id
    ])->one();

    ?>
    
    <?php
    echo TDetailView::widget([
        'model' => $workProfile,
        'attributes' => [
            'professional_indemnity',
            [
                'attribute' => 'professional_status',
                'format' => 'raw',
                'value' => $workProfile->getProfessionalState($workProfile->professional_status)
            ],
            'MDCN_folio_number',
            'registeration_number',
            'issued_date',
            'expiry_date',
            'profile_summary'
        ]
    ])?>
    <?php
} elseif ($model->role_id == User::ROLE_PATIENT) {
    $medicatInformation = PatientMedicalInformation::find()->where([
        'created_by_id' => $model->id
    ])->one();
    ?>
    <h3><?=Yii::t('app', 'Patient Medical History')?></h3>
    
    <?php
    echo TDetailView::widget([
        'model' => $medicatInformation,
        'attributes' => [
            [
                'attribute' => 'blood_group',
                'format' => 'raw',
                'value' => $medicatInformation->getBloodGroup($medicatInformation->blood_group)
            ],
            'weight',
            'height',
            'allergies'
        ]
    ]);
}
?>
			</div>
		</div>
		<div class="panel-body">
				<?php
    if ((User::isAdmin()) && (\Yii::$app->user->id != $model->id)) {
        echo UserAction::widget([
            'model' => $model,
            'attribute' => 'state_id',
            'states' => $model->getStateOptions()
        ]);
    }
    ?>
			</div>



	</div>
	<?php

if ($model->role_id == User::ROLE_DOCTOR) {
    ?>
	<div class="panel">

		<div class="panel-body">
			<div class="panel-heading">
				<span class="tools pull-right"> </span>
			</div>

			<div class="col-md-6">
						<?php
    $data = Appointment::MonthlyEarning($model->id);

    echo Highcharts::widget([
        'options' => [
            'credits' => array(
                'enabled' => false
            ),

            'title' => [
                'text' => 'Monthly Earning'
            ],
            'chart' => [
                'type' => 'column'
            ],
            'xAxis' => [
                'categories' => array_keys($data)
            ],
            'yAxis' => [
                'title' => [
                    'text' => 'Count'
                ]
            ],
            'series' => [
                [
                    'name' => 'Total Income',
                    'data' => array_values($data)
                ]
            ]
        ]
    ]);
    ?>
	</div>
			<div class="col-md-6">
						<?php
    $data = Appointment::DailyEarning($model->id);

    echo Highcharts::widget([
        'options' => [
            'credits' => array(
                'enabled' => false
            ),

            'title' => [
                'text' => 'Daily Earning'
            ],
            'chart' => [
                'type' => 'column'
            ],
            'xAxis' => [
                'categories' => array_keys($data)
            ],
            'yAxis' => [
                'title' => [
                    'text' => 'Count'
                ]
            ],
            'series' => [
                [
                    'name' => 'Total Income',
                    'data' => array_values($data)
                ]
            ]
        ]
    ]);
    ?>
	</div>
		</div>
	</div>
	
	<?php
}
?>
	<div class=" panel ">
		<div class=" panel-body ">
			<div class="classes-panel">

<?php
if ($model->role_id == User::ROLE_DOCTOR) {
    
    $this->context->startPanel();
    $this->context->addPanel('Appointments', 'doctorAppointment', 'Appointment', $model /* ,null,true */);
    $this->context->addPanel('Timmings ', 'availabilityTime', 'AvailabilityTime', $model /* ,null,true */);
    
    $this->context->endPanel();
    
   
    
    
}



?>
<?php
if ($model->role_id == User::ROLE_PATIENT) {
    $this->context->startPanel();
    $this->context->addPanel('Appointments', 'patientAppointment', 'Appointment', $model /* ,null,true */);
    $this->context->endPanel();
}
?>
				</div>
		</div>
	</div>




</div>