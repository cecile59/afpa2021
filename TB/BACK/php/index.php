<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <?php 
  //lesson01
    // $mavariable = "cecile" ;
    // echo $mavariable ;

    //lesson02
    // echo"<h1>Bonjour le monde</h1>"; 
// concatenation
// echo "Affichage d'un \" "; 

// $couleur[0] = "red";
// $couleur[1] = "blue";
// $couleur[2] = "white";
// $couleur[3] = "black";
// echo $couleur[2]


// $_COOKIE["societe"] = "Afpa";
// echo $_COOKIE['societe"]; // Affiche 'Afpa' ;

// $a = 15.125863;
//  settype($a, "integer"); 
// echo $a; 

// $a = 6.32172; 
// $b = intval($a); 
// $c = doubleval($a); 
// echo $a - $b - $c; 

// $a = "Winter"; 
// echo $a . " is coming !"; 
  // 
//   for ($a = 1; $a <= 10; $a++) { 
//     echo $a."<br>"; 
// } 

// $a = 0; 

// do { 
//     echo $a."<br>";  
// } while ($a > 0);

// (ne fonctionne pas ) 
// do { 
//   if ($a < 5) { 
//       echo "a inférieur à 5"; 
//       break; 
//   } 
//   if ( ) ....... 
// } while (1); 

// ------------------------- PHP- Les boucles EXO 1 / 2 / -----------------------
// exo1
//for ($a = 1; $a < 150; ($a =$a +2) ) { 
//   echo $a."<br>"; 
// } 
//exo2
// for ($a = 1; $a < 500; $a++) { 
//   echo "<br>".$a."Je dois faire des sauvegardes régulières de mes fichiers."; 
// } 

//exo3 manque que ma casse 0
// $tableau = '<table border><tr>';


// for($i =-1; $i <=12; $i++)
//   if($i>=0){
//  $tableau .= "<th>".$i."</t>";
// }
 


// for ($a = 0 ; $a <= 12 ; $a++)
// {  
//   $tableau .= "<th>".$a."</th>";
//   echo"<br>";
//   echo $a; 
  
//  $tableau.='</tr>';

// for ($i = 0 ; $i <= 12 ; $i++)
// {
  
//     echo "<td>".$a*$i."</td>";
// $tableau.="<td>".$a*$i."</td>";
// } 
// $tableau.='</tr>';

// } ; 

// $tableau .= '</table>';
// echo $tableau ;
//--------------------------------------------------------------------------------

// function calculPrix($prix_ht, $remise) 
// {              
//     $base_ht = $prix_ht - $remise;
//     $prix_ttc = $base_ht * 1.20; 
//     $retour = array($base_ht, $prix_ttc);

//     return $retour; 
// }   

// $retour = calculPrix(110, 10);

// echo"- Base HT : ".$retour["0"]." €<br>"; // affiche 100 €
// echo"- Prix TTC : ".$retour["1"]." €<br>"; // affiche 120 €


//---------------------------------exo FONCTION-------------------------
 
// function calculator($a,$b,$c ) 
// {
// switch ($b) 
// { 
//     case ($b="+"): 
//        echo $a + $c; 
//        break; 

//     case ($b="-") : 
//        echo $a-$c; 
//        break; 

    // case ($b="*") : 
    //   case  : 
    //    echo $a*$c; 
    //    break; 

       
   
//  } }
// calculator(5,"+",3);
// calculator(5,"-",10);
// // calculator(5,"x",5)


// function calculator ($nb1,$op,$nb2) //nombre1 ; +,-,*,/ et nombre 2
// {
// switch($op)
// {
//   case ($op="+"):   // op devien +
//   echo $nb1 + $nb2;  // donc nb1 + nb2
//   break;// permet de sortire de la boucle 

//   case ($op= "-"):
//   echo $nb1 - $nb2 ;
//   break;

//   // case ( $op="*");
//   // echo $nb1*$nb2;

//   // case ($op="/");
//   // echo $nb1/$nb2;

// }
// }
// calculator (5,"+",3 ) ."<br>" ;// calcule 5+3
// calculator (10,"-",10,)."<br>";// veut fait 5-10
 

//-------------------------------------------------------------------------------

/*-------------------------Téléchargement de fichier en PHP--------------------------*/


// < form action="post.php" method="post" enctype="multipart/form-data">
// <input type="file" name="fichier"> 






?>
</body>

</html>