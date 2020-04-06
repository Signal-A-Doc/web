<?php
use yii\widgets\ListView;
use yii\widgets\Pjax;
?>

<div class="ht__bradcaump__area">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="bradcaump__title text-center">
					<h2 class="bradcaump-title">Blog</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Bradcaump area -->

<!--Our blob page-->
<div class="our_blog_area ptb--70">
	<div class="container">
		<div class="row blog-masonry">

			
    				
    				<?= ListView::widget ( [ 'dataProvider' => $dataProvider,'layout' => "{pager}\n{items}",'itemView' => '_blogs' ] );?>	
    				
    			
					
				
		
		</div>

	</div>
</div>


<script>

    $(function() {
    	$('.item-same-address').matchHeight();
    });

  
    </script>
