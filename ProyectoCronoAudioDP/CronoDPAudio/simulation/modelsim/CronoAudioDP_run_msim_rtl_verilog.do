transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Ale\ Delgado/Desktop/CronoDPAudio/Codigo {C:/Users/Ale Delgado/Desktop/CronoDPAudio/Codigo/uc.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ale\ Delgado/Desktop/CronoDPAudio/Codigo {C:/Users/Ale Delgado/Desktop/CronoDPAudio/Codigo/tiempos.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ale\ Delgado/Desktop/CronoDPAudio/Codigo {C:/Users/Ale Delgado/Desktop/CronoDPAudio/Codigo/microc.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ale\ Delgado/Desktop/CronoDPAudio/Codigo {C:/Users/Ale Delgado/Desktop/CronoDPAudio/Codigo/entrada_salida.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ale\ Delgado/Desktop/CronoDPAudio/Codigo {C:/Users/Ale Delgado/Desktop/CronoDPAudio/Codigo/cpu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ale\ Delgado/Desktop/CronoDPAudio/Codigo {C:/Users/Ale Delgado/Desktop/CronoDPAudio/Codigo/componentes.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ale\ Delgado/Desktop/CronoDPAudio/Codigo {C:/Users/Ale Delgado/Desktop/CronoDPAudio/Codigo/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ale\ Delgado/Desktop/CronoDPAudio/Codigo {C:/Users/Ale Delgado/Desktop/CronoDPAudio/Codigo/7segmentos.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ale\ Delgado/Desktop/CronoDPAudio/Codigo {C:/Users/Ale Delgado/Desktop/CronoDPAudio/Codigo/memprog.v}

