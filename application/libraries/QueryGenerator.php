<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class QueryGenerator {

	function __construct(){
		$this->CI =& get_instance();
	}
	
	function simpleSelect($tablename,$selectfields)
	{
		$select=' SELECT ';
		$count=sizeof($selectfields);

		for($i=0;$i<$count;$i++)
		{
			if ($i == ($count - 1))
			$select.=$selectfields[$i].'';
			else
			$select.=$selectfields[$i].',';
		}

		$select.=' FROM '.$tablename;
		$selectSQL=$select;
		return $selectSQL;
	}

	function selectFilter($tablename,$selectfields,$where=null)
	{
		$select = ' SELECT ';
		$count=sizeof($selectfields);
		$countwhere=sizeof($where);

		for($i=0;$i<$count;$i++)
		{
			if ($i == ($count - 1))
			$select.=$selectfields[$i].'';
			else
			$select.=$selectfields[$i].',';
		}
		$select.=' FROM '.$tablename;
		if(!empty($where))
		{
			$select.=' WHERE ';
				
			for($i=0;$i<$countwhere;$i++)
			{
				if ($i == ($countwhere - 1))
				$select.=$where[$i].'';
				else
				$select.=$where[$i].' AND ';
			}
		}

		$selectSQL=$select;
		return $selectSQL;
	}

	function selectFilterMulitpleTables($tables,$selectfields,$where)
	{
		$select = ' SELECT ';
		$countselect=sizeof($selectfields);
		$counttables=sizeof($tables);
		$countwhere=sizeof($where);

		/* select condition*/
		for($i=0;$i<$countselect;$i++)
		{
			if ($i == ($countselect - 1))
			$select.=$selectfields[$i].'';
			else
			$select.=$selectfields[$i].',';
		}
		$select.=' FROM ';
		/* tables*/
		for($i=0;$i<$counttables;$i++)
		{
			if ($i == ($counttables - 1))
			$select.=$tables[$i].'';
			else
			$select.=$tables[$i].',';
		}

		/*where*/
		if(!empty($where))
		{
			$select.=' WHERE ';
				
			for($i=0;$i<$countwhere;$i++)
			{
				if ($i == ($countwhere - 1))
				$select.=$where[$i].'';
				else
				$select.=$where[$i].' AND ';
			}
		}
		$selectSQL=$select;
		return $selectSQL;

	}

	function insert($tablename,$columnname,$values)
	{
		$insert='INSERT INTO ';
		$countCol=sizeof($columnname);
		$countVal=sizeof($values);

		/* table name*/
		$insert.=$tablename;
		$insert.='(';
		/*column names*/
		for($i=0;$i<$countCol;$i++)
		{
			if ($i == ($countCol - 1))
			$insert.=$columnname[$i].'';
			else
			$insert.=$columnname[$i].',';
		}
		$insert.=')';
		$insert.=' VALUES ';
		$insert.='(';
		/*values*/
		for($i=0;$i<$countVal;$i++)
		{
			if ($i == ($countVal - 1))
			$insert.=$values[$i].'';
			else
			$insert.=$values[$i].',';
		}
		$insert.=')';

		$insertSQL=$insert;
		return $insertSQL;

	}

	function update($tablename,$setValues,$where)
	{
		$update='UPDATE ';
		$countSet=sizeof($setValues);
		$countWhere=sizeof($where);
		/*table name*/
		$update.=$tablename.' SET';

		/*set values*/
		for($i=0;$i<$countSet;$i++)
		{
			if ($i == ($countSet - 1))
			$update.=$setValues[$i].'';
			else
			$update.=$setValues[$i].',';
		}

		/*where*/
		$update.=' WHERE ';
		for($i=0;$i<$countWhere;$i++)
		{
			if ($i == ($countWhere - 1))
			$update.=$where[$i].'';
			else
			$update.=$where[$i].' AND ';
		}
		$updatSQL=$update;
		return $updatSQL;
	}

	function delete($tablename, $where)
	{
		$countFields = sizeof($where);

		$delete	= 'DELETE ';
		/*table name*/
		$delete.=	'FROM '.$tablename;

		if(!empty($where))
		{
			$delete	.=	' WHERE ';
				
			for($i=0; $i < $countFields; $i++)
			{
				if ($i == ($countFields - 1))
				$delete	.= $where[$i];
				else
				$delete	.= $where[$i].' AND ';
			}
		}

		$deleteSQL=$delete;
		return $deleteSQL;
	}

	function selectFilterMulitpleTablesLeftJoin($tables,$selectfields,$joincondition,$where)
	{
		$select = ' SELECT ';
		$countselect=sizeof($selectfields);
		$counttables=sizeof($tables);
		$countjoins=sizeof($joincondition);
		$countwhere=sizeof($where);

		/* select condition*/
		for($i=0;$i<$countselect;$i++)
		{
			if ($i == ($countselect - 1))
			$select.=$selectfields[$i].'';
			else
			$select.=$selectfields[$i].',';
		}
		$select.=' FROM ';

		$select.=$tables[0];

		for($i=1;$i<$counttables;$i++)
		{
			$select.=" LEFT JOIN ".$tables[$i]." ON (".$joincondition[$i]." )";
		}

		/*where*/
		if(!empty($where))
		{
			$select.=' WHERE ';
				
			for($i=0;$i<$countwhere;$i++)
			{
				if ($i == ($countwhere - 1))
				$select.=$where[$i].'';
				else
				$select.=$where[$i].' AND ';
			}
		}

		$selectSQL=$select;
		return $selectSQL;
	}
}

/* End of file QueryGenerator.php */
/* Location: ./system/application/libraries/QueryGenerator.php */