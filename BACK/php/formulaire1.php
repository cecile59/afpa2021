<?php
echo "ok";
var_dump($_FILES);


// if (sizeof($_FILES["fichier"]["error"]) > 0) { echo il y as une erreur} 


// On met les types autorisés dans un tableau (ici pour une image)
$aMimeTypes = array("image/gif", "image/jpeg", "image/pjpeg", "image/png", "image/x-png", "image/tiff");

// On extrait le type du fichier via l'extension FILE_INFO 
$finfo = finfo_open(FILEINFO_MIME_TYPE);
$mimetype = finfo_file($finfo, $_FILES["fichier"]["tmp_name"]);
finfo_close($finfo);

if (in_array($mimetype, $aMimeTypes))
{
    /* Le type est parmi ceux autorisés, donc OK, on va pouvoir 
       déplacer et renommer le fichier */

} 
else 
{
   // Le type n'est pas autorisé, donc ERREUR

   echo "Type de fichier non autorisé";    
   exit;
}    




?>