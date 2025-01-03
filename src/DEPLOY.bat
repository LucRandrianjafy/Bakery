set DIR=D:\Annee2\Projet-s3-s5\Bakery\web
set TARGET_DIR=..\web\WEB-INF\classes
set WEBAPPS=C:\xampp\tomcat\webapps

javac -d "%TARGET_DIR%" "*.java"

echo Création du dossier Boulangerie dans Tomcat...
mkdir "%WEBAPPS%\Boulangerie"

echo Copie des fichiers dans le dossier Boulangerie de Tomcat...
xcopy /e /i "%DIR%" "%WEBAPPS%\Boulangerie"

echo Compilation et déploiement terminés avec succès !
pause
