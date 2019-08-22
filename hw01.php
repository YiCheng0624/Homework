
<?php

for($i=1;$i<=100;$i++){
for($j=2;$j<=$i;$j++){
if($i%$j==0&&$j<$i ){
break;
   
}if($i%$j==0&&$i==$j){echo "$i<hr>";}
    
}

}

?>