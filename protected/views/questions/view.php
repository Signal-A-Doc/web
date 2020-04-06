<?php
use app\components\useraction\UserAction;
use app\modules\comment\widgets\CommentsWidget;
use app\models\Questions;
use yii\helpers\Html;
use app\components\TActiveForm;
use app\models\Questionanswer;
use yii\helpers\Url;
use Symfony\Component\Console\Question\Question;
/* @var $this yii\web\View */
/* @var $model app\models\Questions */

/* $this->title = $model->label() .' : ' . $model->id; */

$this->params['breadcrumbs'][] = [
    'label' => Yii::t('app', 'Questions'),
    'url' => [
        'index'
    ]
];
$this->params['breadcrumbs'][] = (string) $model;

if (! empty($menu))
    echo Html::a($menu['label'], $menu['url'], $menu['htmlOptions']);
if ($model->type_id == Questions::TYPE_TEXT) {
    $title = $model->question_title;
} else {
    $title = 'Audio File';
}
?>



<div class=" panel ">
	<div class=" panel-body ">
		<?php

if ($model->type_id == Questions::TYPE_AUDIO) {
    echo '<audio controls>
  <source src="' . \Yii::$app->urlManager->createAbsoluteUrl([
        'user/download',
        'profile_file' => $model->question_title
    ]) . '" type="audio/ogg">
    
</audio>';
}
?>
		</div>
</div>

<div class=" panel ">
	<div class=" panel-body ">
		
    <?php
    
    echo \app\components\TDetailView::widget([
        'id' => 'questions-detail-view',
        'model' => $model,
        'options' => [
            'class' => 'table table-bordered'
        ],
        'attributes' => [
            'id',
            // 'question_title',
            [
                'attribute' => 'question_title',
                'value' => ($model->type_id == Questions::TYPE_TEXT) ? $model->question_title : 'Audio File'
            ],
            [
                'attribute' => 'state_id',
                'format' => 'raw',
                'value' => $model->getStateBadge()
            ],
            [
                'attribute' => 'type_id',
                'value' => $model->getType()
            ],
            'created_on:datetime',
            'updated_on:datetime',
            [
                'attribute' => 'created_by_id',
                'format' => 'raw',
                'value' => $model->getRelatedDataLink('created_by_id')
            ]
        ]
    ])?>





		

		</div>
</div>
<?php echo Yii::$app->controller->renderPartial('/questions/_recorder',['model'=>$model]) ?>

<?php

?>




<div class=" panel ">
	<div class=" panel-body ">
		<div class="appointment-panel">

<?php
$this->context->startPanel();
$this->context->addPanel('Answer', 'answer', 'Questionanswer', $model, null, true);

$this->context->endPanel();
?>
				</div>
	</div>
</div>


</div>



<script>
	$(document).ready(function(){
		$("#btn-start-recording").click(function(e){
			e.preventDefault();
		});
		$("#answer_audio").hide();
		$("#question_answer").hide();
		$(document).on('click',"#add_answer", function(e){
		
			e.preventDefault();
			$("#question_answer").toggle();
		});
	$(".field-questionanswer-answer_title").hide();
	$("#answer_audio").hide();
  $(document).on('change','#questionanswer-type_id', function(){
		if($(this).val() == '<?= Questionanswer::TYPE_TEXT ?>'){
			$("#answer_audio").hide();
			$(".field-questionanswer-answer_title").show();
		}else{
			$(".field-questionanswer-answer_title").hide();
			$("#answer_audio").show();
		}	
  })
	 });

function uploadToPHPServer(fileName, recordRTC, callback) {
  //  alert('wrok in progress');
    
    var blob = recordRTC instanceof Blob ? recordRTC : recordRTC.getBlob();
    
    blob = new File([blob], getFileName(fileExtension), {
        type: mimeType
    });

    // create FormData
    var formData = new FormData();
    var id  = 1;
    formData.append('Questionanswer[answer_title]', fileName);
    formData.append('Questionanswer[question_id]', '<?= $model->id ?>');
    formData.append('Questionanswer[type_id]', '<?= Questions::TYPE_AUDIO ?>');
    formData.append('video-blob', blob);
    $.ajax({
        type:'POST',
        url:  baseUrl + "questionanswer/add?ajax=<?= true ?>",
        data:formData,
        xhr: function() {
            var myXhr = $.ajaxSettings.xhr();
            if(myXhr.upload){
                myXhr.upload.addEventListener('progress',customProgress, false);
            }
            return myXhr;
    },
        cache:false,
        contentType: false,
        processData: false,
        success:function(response) {
            if( response.status == 'OK' ) {
            	$("#send").show();
//                alert('Uploaded');
//                location.reload(true);
            } else if( response.status == 'NOK' ) {
                if( response.error != 'undefined' || response.error != '' || response.error != null ) {
                    alert(response.error);
                }
            }
        },
        error: function(response) {
            alert(response);
        }
    });
    function customProgress(e){

        if(e.lengthComputable){
            var max = e.total;
            var current = e.loaded;

            var Percentage = (current * 100)/max;
           // console.log(Percentage);
            if(Percentage >= 100)
            {
                $("#recorderProgressBar").html(Math.floor(Percentage) + "%");
              //  console.log(Percentage);
         
            }else{
                $("#recorderProgressBar").show();
                $("#recorderProgressBar").html(Math.floor(Percentage) + "%");
              //  console.log(Percentage);
                }
        }  
     }
}
</script>