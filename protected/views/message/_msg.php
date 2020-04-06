<?php $me = ($model->from_id == \Yii::$app->user->id); ?>
  <li class= "<?php echo ($me)?'':'clearfix'?>">
            <div class="message-data <?php echo ($me)?'align-left':'align-right'?>">
              <span class="message-data-time" ><?php echo $model->time_elapsed_string($model->create_time)?></span> &nbsp; &nbsp;
              <span class="message-data-name" ><?php echo $model->from->username?></span> <i class="fa fa-circle me"></i>
              
            </div>
            <div class="message <?php echo ($me)?'my-message float-left':'other-message float-right'?> ">
              <?= $model->message ?>
            </div>
          </li>