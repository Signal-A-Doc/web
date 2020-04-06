<?php
use app\models\User;
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--[if !mso]><!-->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title></title>
<style type="text/css">
/* Basics */
body {
	Margin: 0;
	padding: 0;
	min-width: 100%;
	background-color: #f7f7f7;
	height: 100%;
}

table {
	border-spacing: 0;
	font-family: sans-serif;
	color: #333333;
}

td {
	padding: 0;
}

img {
	border: 0;
}

.wrapper {
	width: 100%;
	table-layout: fixed;
	-webkit-text-size-adjust: 100%;
	-ms-text-size-adjust: 100%;
}

.webkit {
	max-width: 700px;
	padding: 30px;
	border-top: 3px solid #ff5a00;
	margin-top: 30px;
	background: #fff;
	margin-bottom: 30px;
	border-bottom: 3px solid #ff5a00;
}

.outer {
	Margin: 0 auto;
	width: 100%;
	max-width: 700px;
}

.inner {
	padding: 10px;
}

.contents {
	width: 100%;
}

/* One column layout */
.one-column .contents {
	text-align: left;
}

.one-column p {
	font-size: 14px;
	Margin-bottom: 10px;
	margin-top: 10px;
	color: #5a5a5a;
}

.table-new {
	border-collapse: collapse;
	width: 100%;
	margin-top: 20px;
}

.table-new td, .table-new th {
	border: 1px solid #ddd;
	padding: 8px;
	font-size: 12px;
}

.table-new tr:nth-child(even) {
	background-color: #f2f2f2;
}

.table-new tr:hover {
	background-color: #ddd;
}

.table-new th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #e2ac8e;
	color: white;
}

.one-border {
	border-bottom: 1px solid #eee;
}

/* Left sidebar layout */
.left-sidebar {
	text-align: center;
	font-size: 0;
}

.left-sidebar .column {
	width: 100%;
	display: inline-block;
	vertical-align: middle;
}

.left-sidebar .left {
	width: 70%;
}

.left-sidebar .right {
	width: 30%;
}

.left-sidebar .contents {
	font-size: 14px;
	text-align: center;
}

.left-sidebar a {
	color: #85ab70;
}
</style>

</head>
<body>
<?php

$doctor = User::find()->where([
    'id' => $model->doctor_id
])->one();

?>
	<center class="wrapper">
		<div class="webkit">
			<table class="outer" align="center">
				<tr>
					<td class="one-column one-border">
						<table width="100%">
							<tr>
								<td class="inner contents"><img
									src="<?php echo $this->theme->getUrl('img/logo.png')?>"
									width="120" alt="" />
							
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td style="padding: 0 0 25px;" class="one-column">
						<table width="100%">
							<tr>
								<td class="inner contents">

									<h1 style="font-size: 15px; margin: 10px 0; color: #ff5a00;"><?= $doctor->full_name?></h1>
									<p style="margin-bottom: 0; margin-top: 5px;"><?= $doctor->age?> years , <?= $doctor->gender?></p>
									<p style="margin-bottom: 0; margin-top: 5px;"><?= $model->date?> |
										<?= $model->time?></p>

								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="one-column">
						<table width="100%">
							<tr>
								<td class="inner contents">

									<h1
										style="font-size: 15px; margin: 10px 0; color: #ff5a00; border-bottom: 2px solid #999; padding: 0px 0 10px;">Probable
										Diagnosis</h1> <br></br>
									<p style="margin-bottom: 0;"><?= $post['diagnosis']?></p>


								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="one-column">
						<table width="100%">
							<tr>
								<td class="inner contents">

									<h1
										style="font-size: 15px; margin: 10px 0; color: #ff5a00; border-bottom: 2px solid #999; padding: 0px 0 10px;">Recommended
										Actions</h1> <br></br>
									<p style="margin-bottom: 0;"><?= $post['actions']?></p>


								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="one-column">
						<table width="100%">
							<tr>
								<td class="inner contents">

									<h1
										style="font-size: 15px; margin: 10px 0; color: #ff5a00; border-bottom: 2px solid #999; padding: 0px 0 10px;">Medication</h1>
									<div class="table-responsive">
										<table class="table-new">
											<tr>
												<th>S No.</th>
												<th>Medicine</th>
												<th>Strength</th>
												<th>Frequency</th>
												<th>Duration</th>
												<th>Instructions</th>
											</tr>
											<?php
        
        if (! empty($post['medicine'])) {
            $medicines = json_decode($post['medicine'], true);
            foreach ($medicines as $key => $medicine) {
                ?>
											<tr>
												<td><?= $key+1 ?></td>
												<td><?= $medicine['medicine']?></td>
												<td><?= $medicine['strength']?></td>
												<td><?= $medicine['frequency']?></td>
												<td><?= $medicine['duration']?></td>
												<td><?= $medicine['instruction']?></td>
											</tr>
											<?php } }?>
											
										</table>
									</div>

								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="left-sidebar">

						<table style="width: 100%;" class="column right">
							<tr>
								<td style="text-align: right;" class="inner contents">
									<h1 style="font-size: 15px; margin: 10px 0; color: #ff5a00;"><?= $doctor->full_name ?></h1>
									<p style="margin-bottom: 0; margin-top: 5px;"><?= $doctor->age ?> years , <?= $doctor->gender ?></p>
									<p style="margin-bottom: 0; margin-top: 5px;"><?= $model->date ?> |
										<?= $model->time ?></p>
								</td>
							</tr>
						</table>
					</td>
				</tr>


			</table>

		</div>
	</center>
</body>
</html>