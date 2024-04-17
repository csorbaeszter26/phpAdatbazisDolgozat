<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="stilus.css">
    <title>Csorba Eszter Dolgozat</title>
</head>
<body>
    <?php

        $nev = ["Kis József", "Nagy Márta", "Kovács Antal", "Horváth Ferenc", "Tóth Éva"];
        $klub = ["Dráma", "Foci", "Rajz", "Filozófia", "Dráma"];
        $max = [random_int(10, 100), random_int(10, 100), random_int(10, 100), random_int(10, 100), random_int(10, 100)];
        $fejlec = ["Név", "Klub neve", "Maximális méret"];

        echo "<table><tr>";
        for ($i=0; $i < count($fejlec); $i++) { 
            echo "<th>$fejlec[$i]</th>";
        }
        echo "</tr>";
        for ($i=0; $i < count($nev); $i++) { 
            echo "<tr><td>$nev[$i]</td><td>$klub[$i]</td><td>$max[$i]</td></tr>";
        }
        echo "</table";

    ?>
    
    
</body>
</html>
