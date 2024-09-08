 <?php
  function Conectarse()
  {
    if (!($link = mysqli_connect("localhost", "root", "", "bd_sirevefo"))) {
      echo "Error conectando a la base de datos.";
      exit();
    }
    return $link;
  };

  ?>