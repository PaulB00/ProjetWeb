<?php
$bdd = new PDO('mysql:host=localhost;dbname=bde_cesi_lyon', 'root', '');

if(isset($_POST['forminscription'])) {
   $Nom = htmlspecialchars($_POST['Nom_Utilisateur']);
   $Prenom = htmlspecialchars($_POST['Prenom_Utilisateur']);
   $mail = htmlspecialchars($_POST['Mail_Utilisateur']);
   $mail2 = htmlspecialchars($_POST['mail2']);
   $Password = sha1($_POST['Mdp_Utilisateur']);
   $Password2 = sha1($_POST['Password2']);
   $Statut = htmlspecialchars($_POST['Statut_Utilisateur']);


if(!empty($_POST['Nom_Utilisateur']) AND !empty($_POST['Prenom_Utilisateur']) AND !empty($_POST['Mail_Utilisateur']) AND !empty($_POST['mail2']) AND !empty($_POST['Mdp_Utilisateur']) AND !empty($_POST['Password2']) AND !empty($_POST['Statut_Utilisateur'])) {
      $nomlength = strlen($Nom);
      if($nomlength <= 255) {
         if($mail == $mail2) {
            if(filter_var($mail, FILTER_VALIDATE_EMAIL)) {
               $reqmail = $bdd->prepare("SELECT * FROM utilisateur WHERE Mail_Utilisateur = ?");
               $reqmail->execute(array($mail));
               $mailexist = $reqmail->rowCount();
               if($mailexist == 0) {
                /*  if(preg_match('#^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W)#', $Password)) {
                     echo "Mot de passe valide";*/
                     if($Password == $Password2) {
                       // use exec() because no results are returned
                        $insertmbr = $bdd->prepare("INSERT INTO utilisateur (Nom_Utilisateur, Prenom_Utilisateur, Mail_Utilisateur, Mdp_Utilisateur, Statut_Utilisateur) VALUES('$Nom', '$Prenom', '$mail', '$Password', '$Statut')");
                        $insertmbr->execute();

                        $connexion = "Votre compte a bien été créé ! <a href=\"connexion.php\">Me connecter</a>";
                        
                         echo '<pre>'.print_r($insertmbr,true).'</pre>';

                     }else {
                        $erreur = "Vos mots de passes ne correspondent pas !";
                     }
                  /*}else {
                     $erreur = "Mot de passe inconforme. Veuillez mettre au moins une majuscule et un chiffre.";
                  }*/
               }else {
                  $erreur = "Adresse mail déjà utilisée !";
               }
            } else {
               $erreur = "Votre adresse mail n'est pas valide !";
            }
         } else {
            $erreur = "Vos adresses mail ne correspondent pas !";
         }
      } else {
         $erreur = "Votre pseudo ne doit pas dépasser 255 caractères !";
      }
   } else {
      $erreur = "Tous les champs doivent être complétés !";
  }
}
?>


<html>
   <head>
      <title>Test</title>
      <meta charset="utf-8">
   </head>
   <body>
      <div align="center">
         <h2>Inscription</h2>
      </div>
         <br /><br />
         <form method="POST" action="connexion.php" role="form" class="container">
           
            <div class="form-group">
                     <label for="Nom_Utilisateur">Nom :</label>
                     <input type="text" placeholder="Votre Nom" id="Nom_Utilisateur" name="Nom_Utilisateur" value="<?php if(isset($Nom)) { echo $Nom; } ?>" class="form-control"/>
            </div>
            <div class="form-group">
                     <label for="Prenom_Utilisateur">Prenom :</label>
                     <input type="text" placeholder="Votre Prenom" id="Prenom_Utilisateur" name="Prenom_Utilisateur" value="<?php if(isset($Prenom)) { echo $Prenom; } ?>" class="form-control"/>
            </div>
            <div class="form-group">    
                     <label for="Mail_Utilisateur">Adresse de courriel :</label>
                     <input type="email" placeholder="Votre mail" id="Mail_Utilisateur" name="Mail_Utilisateur" value="<?php if(isset($mail)) { echo $mail; } ?>" class="form-control">
            </div>
            <div class="form-group">     
                     <label for="mail2">Confirmation de l'adresse de courriel :</label>
                     <input type="email" placeholder="Confirmez votre mail" id="mail2" name="mail2" value="<?php if(isset($mail2)) { echo $mail2; } ?>" class="form-control"/>
            </div>
            <div class="form-group">    
                     <label for="Mdp_Utilisateur">Mot de passe :</label>
                     <input type="password" placeholder="Votre mot de passe" id="Mdp_Utilisateur" name="Mdp_Utilisateur" class="form-control"/>
            </div>
            <div class="form-group">   
                     <label for="Password2">Confirmation du mot de passe :</label>
                     <input type="password" placeholder="Confirmez votre mdp" id="mdp2" name="Password2" class="form-control"/>
            </div>  
             <div class="form-group">
                     <label for="Statut_Utilisateur">Statut :</label>
                     <input type="text" placeholder="Votre Statut" id="Statut_Utilisateur" name="Statut_Utilisateur" value="<?php if(isset($Statut)) { echo $Statut; } ?>" class="form-control"/>
            </div>  
            <div align="center">    
                     <input type="submit" name="forminscription" value="Je m'inscris" class="btn btn-default">

            </div>
            
              
         </form>
          <div align="center">
         <?php
         if(isset($erreur)) {
            echo '<font color="red">'.$erreur."</font>";
         } else {}

         if(isset($connexion)) {
            echo '<font color="green">'.$connexion."</font>";
         }

         else{

         echo "Vous avez déja un compte ? Alors <a href=\"connexion.php\">connectez-vous</a>";

     }
         ?>
         </div>
   </body>
</html>
