<?php
use yii\helpers\Url;
?>
<style type="text/css">
.timer {
	padding: 10px;
	background: #ccc;
	font-size: 24px;
	letter-spacing: 2px;
	text-align: right;
}
</style>
<section>
	<div class="container clearfix">
		<div class="col-md-12">
			<div class="chat-timer text-center">

				<div class="timer" id="time">
					<strong>Time Left : </strong> 20:00
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="chat">
				<div class="chat-header clearfix">
      <?php echo $doctor->image?>
       
        
        <div class="chat-about">
						<div class="chat-with">Chat with <?php echo $doctor->fullName?></div>
						<div class="chat-num-messages"></div>
					</div>
					<i class="fa fa-star"></i>
				</div>
				<!-- end chat-header -->

				<div class="chat-history">
					<ul class="chat-ul">
         
          <?php
										echo \yii\widgets\ListView::widget ( [ 
												'dataProvider' => $dataProvider,
												'summary' => false,
												'itemView' => function ($model, $Index, $key) {
													return $this->render ( '_msg', [ 
															'model' => $model 
													] );
												} 
										] );
										?>
            
          
        </ul>

				</div>
				<!-- end chat-history -->

				<div class="chat-message clearfix">
					<form id="message-form">
						<textarea name="message-to-send" id="message-to-send"
							placeholder="Type your message" rows="3"></textarea>

						<!--    <input type="file" name=""> -->

						<button class="chat-send-btn">Send</button>
					</form>
				</div>
				<!-- end chat-message -->

			</div>
			<!-- end chat -->

		</div>
		<!-- end container -->

	</div>
</section>
<script>
$(document).ready(function(){
var data = {
		to_id:'<?php echo $doctor->id?>',
};

setInterval(refreshChat, 2000);

$canSendMessage = true;
function sendMessage(message){
if($canSendMessage){
	$canSendMessage = false;
	$.ajax({
		url:'<?= Url::toRoute(['message/send','apid'=>\Yii::$app->request->get('id')]) ?>',
		data:{
			type_id:1,
			to_id:'<?php echo $doctor->create_user_id ?>',
			message:message,
			_csrf:'<?= \yii::$app->request->csrfToken ?>'
			},
		method:'post',	
		success:function(response){
			if(response.status == "OK")
			{	
				var msg = '<li><div class="message-data align-left">'+
		              '<span class="message-data-time" >'+response.detail.create_time+'</span> &nbsp; &nbsp;'+
		              '<span class="message-data-name" >'+'<?php \Yii::$app->user->identity->username?>'+'</span> <i class="fa fa-circle me"></i>'+
		              
		            '</div>'+
		            '<div class="message my-message float-left">'+
		              response.detail.message+
		            '</div></li>';
		            
	     $('.chat-ul').append(msg); 
	     $("#message-to-send").val('');
				goDown();
				
			}
			else{
					console.log("Message sending failed");
					console.log(response);
				}
			$canSendMessage = true;
			}
	});}
}

function goDown(){
	$(".chat-ul").animate(
	  {scrollTop: $('.chat-ul')[0].scrollHeight-$('.chat-ul').height()});
}

$('.chat-send-btn').on('click', function(e) {
  
    	e.preventDefault();
    	var message = $("#message-to-send").val();
    	if(message != ''){
    		sendMessage(message);
       }
 
});


function appendMessages(msgs){
	var msg='';
	$.each(msgs.list,function(index,value){
		
		if(value.from_id=='<?php \Yii::$app->user->id?>')
		{
			
			 msg = '<li><div class="message-data align-left">'+
            '<span class="message-data-time" >'+value.detail.create_time+'</span> &nbsp; &nbsp;'+
            '<span class="message-data-name" >'+'<?php \Yii::$app->user->identity->username?>'+'</span> <i class="fa fa-circle me"></i>'+
            
          '</div>'+
          '<div class="message my-message float-left">'+
             value.detail.message+
          '</div></li>';
			
		}
		else
		{
			msg = '<li class = "clearfix"><div class="message-data align-right">'+
            '<span class="message-data-time" >'+value.detail.create_time+'</span> &nbsp; &nbsp;'+
            '<span class="message-data-name" >'+'<?php \Yii::$app->user->identity->username?>'+'</span> <i class="fa fa-circle me"></i>'+
            
          '</div>'+
          '<div class="message other-message float-right">'+
             value.detail.message+
          '</div></li>';
		}
		
	});
	 $(".chat-ul").append(msg);
	
}


function refreshChat(){

	$.ajax({
		url:'<?php echo Url::toRoute(['message/last-msg'])?>'+'?id='+'<?php echo $doctor->create_user_id?>',
		data:{
				
				_csrf:'<?= \yii::$app->request->csrfToken ?>'
			//	last_id :lastMessageId,
			}	,
		method:'post',
		success:function(response){
		if(response.status == 'OK'){
			appendMessages(response);
			goDown();
		}else{
				
	}
		}
		});
	
}


	
});
</script>
<script type="text/javascript">

    //Stuff

var timeoutHandle;
function countdown(minutes) {
    var seconds = 60;
    var mins = minutes
    function tick() {
        var counter = document.getElementById("time");
        var current_minutes = mins-1
        seconds--;
        counter.innerHTML =
        "Time Left :"+current_minutes.toString() + ":" + (seconds < 10 ? "0" : "") + String(seconds);
        if( seconds > 0 ) {
            timeoutHandle=setTimeout(tick, 1000);
        } else {

            if(mins > 1){

               
               setTimeout(function () { countdown(mins - 1); }, 1000);

            }
        }
    }
    tick();
}

countdown(20);

</script>
