/* unidiff.do S. Fachelli, P. López-Roldán (2012). Análisis de Tablas de Movilidad

This do file estimates the conditional independence model, the constant association model,and the 
multiplicative specification of the uniform layer effect (unidiff) model for tables crosstabulating

Para funcionar, este programa necesita que se instale primero el módulo unidiff. 
Para instalarlo: ssc install unidiff */

/* Abrir log */
cap log close
log using unidiff.log, replace
set more off

/* Abrir dataset*/
use data1.dta, clear

/* Estimación del modelo */

foreach pattern in fi qpm qs cp  ua re ce rce hrce {

disp " "
disp "Modelo: `pattern'"
disp " "

unidiff FRE, row(O) column(D) layer(C) effect(mult) pattern(`pattern') refcat(1) 

}

log close
