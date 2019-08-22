<?php

    $poker = range(0,51);


    for ($i = 51; $i>=0; $i--){         //總共0~51號牌
        $tempIndex = rand(0,$i);        //取得一個最大為51遞減1的亂數
        $box=$poker[$tempIndex];        //抽取的亂數是陣列poker的第幾個數，把值存在虛擬空間

        $poker[$tempIndex]=$poker[$i];  //陣列最後一個值匯入到抽取到的位置裡
       
        $poker[$i]=$box;                //陣列的最後一個位置填入需裡空間裡的值
    
 
        echo$poker[$i]."<br>";

    }

?>