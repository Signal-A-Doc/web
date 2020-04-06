<?php
use yii\helpers\Html;
use app\components\TActiveForm;
use app\models\Questionanswer;
use yii\helpers\Url;

$url = $this->theme->getUrl('/');
?>
<!--Google Font-->
<link
	href="../../fonts.googleapis.com/css0b81.css?family=Lato:300,400,400i,700,700i"
	rel="stylesheet">
<link
	href="<?=$this->theme->getUrl('emojis/css/jquery.emojipicker.css')?>"
	rel="stylesheet">

<link
	href="<?=$this->theme->getUrl('emojis/css/jquery.emojipicker.tw.css')?>"
	rel="stylesheet">



<script
	src="<?=$this->theme->getUrl('emojis/js/jquery.emojipicker.js')?>"></script>
<script src="<?=$this->theme->getUrl('emojis/js/jquery.emojis.js')?>"></script>


<!-- Header
    ================================================= -->

<!--Header End-->
<style>
input[type="file"] {
	display: none;
}

.emojiPicker {
	top: 400px !important;
}
</style>
<div class=""></div>
<script src="<?=$url?>js/RecordRTC.js"></script>
<!-- for Edge/FF/Chrome/Opera/etc. getUserMedia support -->
<script src="<?=$url?>js/adapter-latest.js"></script>
<script src="<?=$url?>js/DetectRTC.js"> </script>

<!-- video element -->
<link href="<?=$url?>css/getHTMLMediaElement.css" rel="stylesheet">
<script src="<?=$url?>js/getHTMLMediaElement.js"></script>
<!-- recorderModal -->
<div class=" panel ">
	<div class=" panel-body ">
		<div class="appointment-panel">
			<a class="btn btn-primary" id="add_answer">Add Answer</a>
			<div class="row" id="question_answer">
					 <?php
    $form = TActiveForm::begin([
        'layout' => 'horizontal',
        'id' => 'questions-ans-form',
        'action' => Url::toRoute([
            '/questionanswer/add'
        ]),
        'enableAjaxValidation' => true
    ]);
    $newModel = new Questionanswer();
    
    echo $form->field($newModel, 'type_id')->dropDownList($newModel->getTypeOptions(), [
        'prompt' => 'Select Type'
    ]);
    ?>
    
    <div id="answer_title col-md-offset-3 col-md-6">
    
   <?php

echo $form->field($newModel, 'answer_title')->textInput([
    'maxlength' => 256
]);
?>
    </div>
				<div id="answer_audio" class="col-md-offset-3 col-md-6">
					<span class="badge" id="recorderProgressBar"><div
							id='recorderProgressBar'>0</div></span>
					<section class="experiment recordrtc">
						<select class="recording-media">
							<option value="record-audio-plus-video">Microphone+Camera</option>
							<option value="record-audio">Microphone</option>
						</select> <span style="font-size: 15px; display: none;">into</span>
						<select class="media-container-format" style="display: none;">
							<option>default</option>

						</select> <input type="checkbox" id="chk-timeSlice"
							style="margin: 0; width: auto; display: none;"
							title="Use intervals based recording"> <label for="chk-timeSlice"
							style="font-size: 15px; display: none; margin: 0; width: auto; cursor: pointer; -webkit-user-select: none; user-select: none;"
							title="Use intervals based recording">Use timeSlice?</label>

						<button id="btn-start-recording">Start Recording</button>
						<button id="btn-pause-recording"
							style="display: none; font-size: 15px;">Pause</button>

						<select class="media-resolutions" style="display: none;">
							<option value="default">Default resolutions</option>

						</select> <select class="media-framerates" style="display: none;">
							<option value="default">Default framerates</option>

						</select> <select class="media-bitrates" style="display: none;">
							<option value="default">Default bitrates</option>

						</select>

						<div style="text-align: center; display: none;">
							<button id="save-to-disk">Save To Disk</button>
							<button id="upload-to-php">Upload as Status</button>
							<button id="open-new-tab">Open New Tab</button>
						</div>

						<div style="margin-top: 10px;" id="recording-player"></div>
					</section>
				</div>
    <?php
    echo $form->field($newModel, 'question_id')
        ->hiddenInput([
        'value' => $model->id,
        'maxlength' => 256
    ])
        ->label(false);
    ?>
   
					
					<div
					class="col-md-6 col-md-offset-3 bottom-admin-button btn-space-bottom text-right">		
 <?php
echo Html::submitButton(Yii::t('app', 'Save'), [
    'id' => 'questions-ans-form-submit upload-to-php',
    'class' => 'btn btn-success'

]);
?>
					</div>
					<?php TActiveForm::end(); ?>
			</div>

		</div>




	</div>
</div>



<script type="text/javascript" src="<?=$url?>js/customRecorder.js"></script>

