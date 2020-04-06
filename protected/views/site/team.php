<?php
use yii\widgets\ListView;
use yii\widgets\Pjax;
?>
<div class="ht__bradcaump__area">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="bradcaump__title text-center">
					<h2 class="bradcaump-title">Meet Our Team</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Bradcaump area -->

<!--Special doctor section 2 start-->
<div class="special_doctor_section_2 ptb--100">
	<div class="container">
		<div class="row">
			<div class="col-xl-6 offset-xl-3 col-lg-8 offset-lg-2 col-12 ">
				<div class="section_title--2 pb--60 text-center">
					<h2>Meet Our Team</h2>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting.</p>
				</div>
			</div>
		</div>
		<div class="row">
			<?php
Pjax::begin([
    'id' => 'item-list-view',
    'enablePushState' => true, // to disable push state
    'enableReplaceState' => true,
    'options' => [
        'style' => 'width:100%'
    ]
]);
?>
    				
    				<?= ListView::widget ( [ 'dataProvider' => $dataProvider,'layout' => "{pager}\n{items}",'itemView' => '_team' ] );?>	
    				
    			
					
				<?php Pjax::end();?>



		</div>
	</div>
</div>