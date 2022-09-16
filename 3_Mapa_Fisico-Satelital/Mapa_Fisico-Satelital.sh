#!/usr/bin/env bash
#
# Mapas satelitales y fisicos

#	Definir variables del mapa
#	-----------------------------------------------------------------------------------------------------------
#	Titulo del mapa
	title=Mapa_Fisico-Satelital
	echo $title

#	Proyecciones 
	PROJ=M15c
#	PROJ=U-19/15c

#	Region geografica
#	REGION=AR,UY,GS,CL+r5
	REGION=MX

#	-----------------------------------------------------------------------------------------------------------
#	Iniciar sesion y tipo de figura

gmt begin $title png
#	Setear region y proyeccion (-B+n no dibuja nada)
	gmt basemap -R$REGION -J$PROJ -B+n

#	Crear Mapa fisico/satelital
#	gmt grdimage @earth_day
#	gmt grdimage @earth_night
#	gmt grdimage @earth_relief
	gmt grdimage @earth_relief -I

#	Dibujar Limite nacionales
	gmt coast -N1/thinnest,red
    
#	Agregar Norte
	gmt basemap -TdjTR+w1.5c+f1+l

#	Agregar escala
	gmt basemap -LjBL+o1c+w500k+f+u

#	Titulo
	gmt basemap -B+t"Mapa físico de México"

#	Mapa de Ubicacion
	gmt inset begin -DjTL+w3.8c+o0.4c/0.25c
		gmt coast -Rg -JG-105/25/? -Da -Ggray -A5000 -Bg -Wfaint -EMX+gred+p -Sdodgerblue
	gmt inset end

#	Escala de colores
	gmt colorbar -DJMR -W0.001 -Baf+l"km"


#	Dibujar Borde
	gmt basemap -Baf

gmt end #show

