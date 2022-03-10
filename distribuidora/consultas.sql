
integrantes: Oneyda Perez
             Greisy Pistala
             
/*1. Llenar la base de datos.
  2. consulta sql sucursales.
	MOSTRAR, ID_SUCURSAL, ENCARGADO_SUCURSAL, NOMBRE_CLIENTE Y EN PARENTESIS SU IDENTIFICACION, PAIS.*/

SELECT `sucursal`.`id_sucursal` AS ID_SUCURSAL,`sucursal`.`nombre_encargado` AS ENCARGADO_SUCURSAL,
CONCAT_WS( '',"(",`numero_identificacion`,')',' ',`primer_nombre`) AS  NOMBRE_CLIENTE,`pais`.`pais` AS PAIS
	FROM `sucursal`
	INNER JOIN `cliente` ON `sucursal`.`id_sucursal` = `cliente`.`id_cliente`
	INNER JOIN `ciudad_sucursal` ON `sucursal`.`id_ciudad_sucursal` = `ciudad_sucursal`.`id_ciudad_sucursal`
	INNER JOIN `departamento` ON `ciudad_sucursal`.`id_departamento` = `departamento`.`id_departamento`
	INNER JOIN `pais` ON `departamento`.`id_pais` = `pais`.`id_pais`
	_________________________________________________________________________________________
	
/*3. consulta sql clienes.
	MOSTRAR, ID_CLIENTE, NOMBRE_CLIENTE, CANTIDAD_SUCURSAL*/

SELECT `cliente`.`id_cliente` AS ID_CLIENTE,
	`cliente`.`primer_nombre` AS NOMBRE_CLIENTE,
	COUNT(`sucursal`.`id_sucursal`) AS CANTIDAD_SUCURSAL
	FROM `cliente`
	INNER JOIN `sucursal` ON `cliente`.`id_cliente` = `sucursal`.`id_cliente`
	GROUP BY `cliente`.`id_cliente`
	_________________________________________________________________________________________

/*4. CONSULTA
	MOSTRAR: CIUDAD, DEPARTAMENTO, PAIS, CANTIDAD_SUCURSAL*/

SELECT `ciudad_sucursal`.`ciudad_sucursal` AS CIUDAD, `departamento`.`departamento` AS DEPARTAMENTO,`pais`.`pais` AS PAIS, 
COUNT(`sucursal`.`id_sucursal`) AS CANTIDAD_SUCURSAL
FROM `ciudad_sucursal`
INNER JOIN `departamento` ON `ciudad_sucursal`.`id_departamento`=`departamento`.`id_departamento`
INNER JOIN `pais` ON `pais`.`id_pais`= `departamento`.`id_pais`
LEFT JOIN `sucursal` ON `sucursal`.`id_ciudad_sucursal` = `ciudad_sucursal`.`id_ciudad_sucursal`
GROUP BY `ciudad_sucursal`.`id_ciudad_sucursal`

