<?php
use yii\widgets\ListView;
use yii\widgets\Pjax;
?>
<div class="ht__bradcaump__area">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="bradcaump__title text-center">
					<h2 class="bradcaump-title">Treatment Services We Offer</h2>
				</div>
			</div>
		</div>
	</div>
	<div></div>
</div>

<!--How it work section start-->
<div class="how_it_work_section ptb--100">
	<div class="container">

		<div class="row">
		
    				
    				<?= ListView::widget ( [ 'dataProvider' => $dataProvider,'layout' => "{pager}\n{items}",'itemView' => '_features' ] );?>	
    				
    			
					
				
			
		</div>
	</div>
</div>