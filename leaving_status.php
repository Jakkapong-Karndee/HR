<?php require_once('connect.php');
session_start(); 
$User_ID = $_SESSION['User_ID'];

?> 
<!DOCTYPE html>
<html>
<head>
  <title>Leaving Status</title>
</head>
<body>
  <div id="div_content" class="Leaving request">

<table>
                <col width="10%">
                <col width="20%">
                <col width="20%">
                <col width="25%">
                <col width="25%">

                <tr>
                    <th>Title</th> 
                    <th>Reason</th>
                    <th>Date Start</th>
                    <th>Date End</th>
                    <th>Status</th>  
                    <th>Emergency Leave</th>
                </tr>
 		 <?php 
          
				 	$q="select * from leaving_form inner join user on leaving_form.user_id = user.user_id where user.user_id = $User_ID";
          
					$result=$mysqli->query($q); 
					if(!$result){
						echo "Select failed. Error: ".$mysqli->error ;
						return false;
					}
				 while($row=$result->fetch_array()){ ?>
                    <?php if(!isset($row['Form_status'])){
                      $row['Form_status'] = "Waiting";
                    } ?>
                 <tr> 
                    <td><?=$row['Form_Title']?></td> 
					          <td><?=$row['Form_detail']?></td>
                    <td><?=$row['Form_DateStart']?></td>
                    <td><?=$row['Form_DateEnd']?></td>
                    <td><?=$row['Form_status']?></td>
                    
					<td>
            
					<?php 
					if ($row['Form_EL']==1)
					    echo "<input type='checkbox' CHECKED  disabled>";
					else 
					    echo "<input type='checkbox' disabled >";
					} ?>

			<?php $count=$result->num_rows;
					echo "<tr><td colspan=7 align=right>Total $count records</td></tr>";
					$result->free();
			?>
            </table>
  </div>

  

  <a href= "requestleave_menu.html"><button >Back </button></a>


</body>
</html>