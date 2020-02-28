<?php 
public function cloneRow($id)
{
	$SQL = "SELECT * FROM TBL where id = ".$id;
	$origin = $this->db->getResult()[0];
	$clone = $origin;

	unset($clone['id']); // PK. auto increment
	unset($clone['datetime']); // default now()
	unset($clone['state']); // have default values

	$keys = array_keys($clone);
	$vals = array_values($clone);

	$string = "'".join("', '", $vals)."'";
	$string = str_replace("''", "NULL", $string);
	$SQL = "INSERT INTO TBL (".join(", ", $keys) .") VALUES (".$vals_string.") ";
	$this->db->query($SQL); 

	return true;
}
