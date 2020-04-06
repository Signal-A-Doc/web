# signal-a-doc-yii2-1347

Composer steps: 

1. Unzip project file and confirm folder permissions to 755 for folders and 644 for files:-

	Run these commands to change permissions: 

	For Directory
		find . -type d -exec chmod 755 {} \;

	For File
		find . -type f -exec chmod 644 {} \;

2. Inside the project directory, run command on console 

	``composer install --prefer-dist ``
	
	
 Installation steps: 
	

3. This command will install all the extensions and libraries that we need to run project.

4. Now run project by hitting the url on web browser and follow the steps to install project.
   i.e `localhost/projectName/install` or `www.abc.com/install`
   
5. You need to create database and configure the steps using installer steps.

Configure cron job on ubuntu:
In order to set up cron jobs, one needs to modify the /etc/crontab file which can be done by only root user. You can edit the crontab file with following text editor.
Example:

	``#nano /etc/crontab``

	timer-daily.php runs every 1 Minute 
	timer-schedule.php runs every day at once







