<?php
use yii\helpers\Url;
use app\components\TActiveForm;
use yii\bootstrap\Modal;
use app\models\Chat;
use app\models\User;
use yii\helpers\Html;
use app\models\Message;

?>
<!--  <div class="page-head">-->
<?php  $this->registerCssFile($this->theme->getUrl('/css/chat.css'),[],'CHATCSS'); ?>
<?php  $this->registerJsFile($this->theme->getUrl('/js/chat.js')); ?>
<!--  </div>-->
<div class="outer-chat-container">

<div class="chat-wrapper">
<div class="chat-container">
		<div class="left">
			<div class="top">
			<form id='search-chat-user' action="<?= Url::toRoute(['/message/inbox'])?>" method="get">
			<input type="text" class="form-control" id ="search-bar" name="name">
			</form>
			<a class="search-icon" href="#"><i class="fa fa-search"></i></a>
				<!-- <button id="new-chat" class="btn btn-default chat-btn">New Chat </button> -->
			</div>

			<ul class="people">
           
            </ul>
		</div>
		<div id='chat-box' class="right">
			<div class="top">
				<span>To: <span class="name"></span>
			</div>
			<div class="chat" data-chat="person1">
				<div class="conversation-start">
					<span>Today, 6:48 AM</span>
				</div>
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
            
            </div>
			<div class="chat" data-chat="person2"></div>
			<div class="chat" data-chat="person3"></div>
			<div class="chat" data-chat="person4"></div>
			<div class="chat" data-chat="person5"></div>
			<div class="chat" data-chat="person6"></div>
			<div class="write">
              
                <?php
																
																$msg = new Message();
																$form = TActiveForm::begin ( [ 
																		'id' => 'send-msg-form' 
																] );
																?>
                <?=$form->field ( $msg, 'message', [ 'template' => '{input}','options' => [ 'tag' => false ] ] )->textInput ();?>
                <?php TActiveForm::end()?>
                
                
            </div>
		</div>
	</div>
</div>
	
</div>


<script>
$(document).ready(function(){
	$( ".modal-content" ).addClass( "notify-desc" );
});

$(document).ready(function(){
$('#w2').bind('submit', function (e) {
    // Disable the submit button while evaluating if the form should be submitted
    $('#send').prop('disabled', true);

    var valid = true;    
    var error = '';

    // If the email field is empty validation will fail
   

    if (!valid) { 
        // Prevent form from submitting if validation failed
        e.preventDefault();

        // Reactivate the button if the form was not submitted
        $('#send').prop('disabled', false);
        
        
    }
});
});
</script>
<script>
$('ul.notification-menu li a.btn.btn-default.dropdown-toggle').click(function(){
		$('ul.notification-menu li').toggleClass('open');

});

var uid =<?=  \yii::$app->user->id ?>;
var personid;
var deletechat
var renderMsg;
var getChat;
var interval;
var lastMessageId;
var msgid;
var currentActiveChat;
var build_id;
function goDown(){
	$("div.chat.active-chat").animate(
	  {scrollTop: $('div.chat.active-chat')[0].scrollHeight-$('div.chat.active-chat').height()});
}
$(document).ready(function(){

$(document).on('click', '.bubble.me', function () {
	  msgid=$(this).attr('data-id');
	  $.ajax({
			url:'<?= Url::toRoute(['message/msg']) ?>',
			data:{
				id:msgid,
				_csrf:'<?= \yii::$app->request->csrfToken ?>'
				},
			method:'post',	
			success:function(response)
			{
				alert(response);
			}
	  });

	  
	});

renderMsg =  function(msgs){
	var msg='';

	
	$.each(msgs,function(index,value){
		
		lastMessageId = value.last_id;
		if(value.from_id==uid)
		{	a = "<div style='font-size:10px;text-align:right'>"+value.create_time+"</div>";
			msg+="<div class='bubble me' data-id="+value.id+">"+value.msg+a+"</div>";
			personid = value.to_id;
		}
		else
		{	a = "<div style='font-size:10px;text-align:right'>"+value.create_time+"</div>";
			msg+="<div class='bubble you' data-id="+value.id+">"+value.msg+a+"</div>";
			personid = value.from_id;
		}
		
	});

	$( '.chat' ).each(function( index ) {
		  $(this).remove();
	});
	
	$('#chat-box .top').after("<div data-chat='person"+personid+"' class='chat active-chat'>"+msg+"</div>");
}
getChat =	function (id){
	$.ajax({
		url:'<?= Url::toRoute(['message/get-msg']) ?>',
		data:{id:id,
			_csrf:'<?= \yii::$app->request->csrfToken ?>'},
		method:'post',
		success:function(response){
			renderMsg(response);
			interval = setInterval(refreshChat,3000,currentActiveChat);
			goDown();
			}
		});
}	

$('li.person').click(function(){
	
	$('input[name="Message[to_id]"]').remove();
	if($('.chat').remove())
	{   inputext = '<input type="hidden" name=Message[to_id] value="'+$(this).attr('data-p-id')+'">';
		$('#send-msg-form').append(inputext);
		clearInterval(interval);
		currentActiveChat = $(this).attr('data-id');
		$('#delete-chat').attr('data-id',currentActiveChat);
		getChat(currentActiveChat);
	}

});

});

$('#delete-chat').click(function(){

var check=confirm('Are you sure you want to delete this chat');
if(check=true)
{
	deletechat=$(this).attr('data-id'); 
	     $.ajax({
			url:'<?=Url::toRoute(['message/delete-msg']) ?>',
			data:{id:deletechat,
				_csrf:'<?= \yii::$app->request->csrfToken ?>'},
			method:'post',
			success:function(response){
			
			}
	     });
}
});
$('.search-icon').click(function()
{
	$('#search-chat-user').submit();
});
$canSendMessage = true;
function sendMessage(message){
if($canSendMessage){
	$canSendMessage = false;
	$.ajax({
		url:'<?= Url::toRoute(['message/send']) ?>',
		data:{
			type_id:1,
			to_id:personid,
			message:message,
			_csrf:'<?= \yii::$app->request->csrfToken ?>'
			},
		method:'post',	
		success:function(response){
			if(response.status == "OK")
			{	
				a = "<div style='font-size:10px;text-align:right'>"+response.detail.create_time+"</div>";
				msg = "<div class='bubble me' data-id='"+response.detail.id+"'>"+message+"</div>";

				$('div.chat.active-chat').append(msg);
				goDown();
				$('#message-message').val('');
			}
			else{
					console.log("Message sending failed");
					console.log(response);
				}
			$canSendMessage = true;
			}
	});}
}

function appendMessages(msgs){
	var msg='';
	$.each(msgs.list,function(index,value){
		
		if(value.from_id==uid)
		{
			
			msg+="<div class='bubble me'>"+value.msg+a+"</div>";
			personid = value.to_id;
		}
		else
		{
			//a = "<div style='font-size:10px;text-align:right'>"+value.create_time+"</div>";
			msg+="<div class='bubble you'>"+value.msg+"</div>";
			personid = value.from_id;
		}
		
	});
	 $(".active-chat").append(msg);
	
}




function refreshChat(currentActiveChat){

	$.ajax({
		url:'<?php echo Url::toRoute(['message/last-msg'])?>',
		data:{
				session_id:currentActiveChat,
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

 /*   deletechat=$(this).attr('data-id'); */
   /*  $.ajax({
		url:'<?php // Url::toRoute(['chat/delete-msg']) ?>',
		data:{id:deletechat},
		method:'post',
		success:function(response){
		console.log(response);
		}
		});
	*/
//});

$('#message-message').on('keypress', function(e) {
    if (e.which == 13) {
    	e.preventDefault();
    	var message = this.value;
        sendMessage(message);
    } 
});
$('#search-bar').on('keypress', function(e) {
   if (e.which == 13) {
    	$('#search-chat-user').submit();
    	goDown();
    	   }
    
});
</script>