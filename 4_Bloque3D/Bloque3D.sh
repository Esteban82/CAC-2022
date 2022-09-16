#!/usr/bin/env bash

#	Crear bloques 3D

#	Definir Variables del mapa
#	-----------------------------------------------------------------------------------------------------------
#	Titulo del mapa
	title=Bloque3D
	echo $title

#	Region (W/E/S/N)
#	REGION=-72/-64/-35/-30		# Cuyo
	REGION=-61.5/-57.5/-52.5/-51	# Islas Malvinas
	BASE=-5000			# en metros
	TOP=10000			# en metros

#	Proyeccion Mercator (M)
	PROJ=M14c
	PROZ=4c				# variable para escala vertical
	p=250/20			# Perpesctiva desde donde se ve (azimuth/elevacion)

#	DEM a utilizar
#	GRD=@earth_relief_30s
	GRD=@earth_relief_15s
#	GRD=@earth_relief_03s

#	Dibujar mapa
#	-----------------------------------------------------------------------------------------------------------
#	Iniciar sesion y tipo de figura
gmt begin $title png

#	Bloque 3D
#	gmt grdview $GRD -R$REGION/$BASE/$TOP -J$PROJ -JZ$PROZ -p$p -C -Qi300					
#	gmt grdview $GRD -R$REGION/$BASE/$TOP -J$PROJ -JZ$PROZ -p$p -C -Qi300 -Wf0.5 -N$BASE
#	gmt grdview $GRD -R$REGION/$BASE/$TOP -J$PROJ -JZ$PROZ -p$p -C -Qi300 -Wf0.5 -N$BASE+glightgray
#	gmt grdview $GRD -R$REGION/$BASE/$TOP -J$PROJ -JZ$PROZ -p$p -C -Qi300 -Wf0.5 -N$BASE+glightgray -BnSwEZ -Baf -Bzaf+l"Altura (m)"
#	gmt grdview $GRD -R$REGION/$BASE/$TOP -J$PROJ -JZ$PROZ -p$p -C -Qi300 -Wf0.5 -N$BASE+glightgray -BnSwEZ -Baf -Bzaf+l"Altura (m)" -I
	gmt grdview $GRD -R$REGION/$BASE/$TOP -J$PROJ -JZ$PROZ -p$p -C -Qi300 -Wf0.5 -N$BASE+glightgray -BnSwEZ -Baf -Bzaf+l"Altura (m)" -I+a160

gmt end
