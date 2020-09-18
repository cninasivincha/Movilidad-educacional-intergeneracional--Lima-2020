 keep p209_02 p208_02 p207_02 p45_1 p45_2 p301_02 ubigeo
 *modficacion de variables

g x=missing(p45_1)  
*creamos una variable para identificar valores perdidos

drop if p45_1 >= . 
*eliminamos los valores perdidos

summ x
*verificamos si exiten valores perdidos en la nueva varaible creada

drop x
*eliminamos la variable creada

g AñoNacim=2019-p208_02
*creamos una variable de año de nacimiento

g x=missing(p301_02) 
drop if p301_02 >= . 
drop x
*eliminar espacion en blanco en la variable p301_02

recode AñoNacim (1921/1934=1 "Cohorte1") (1935/1948=2 "Cohorte2") (1949/1961=3 "Cohorte3") (1962/1975=4 "Cohorte4")
>  (1976/1988=5 "Cohorte5") (1989/2002=6 "Cohorte6") (else=.), generate(Cohorte) label(dcohorte)
*creacion de los cohortes

label var p207_02 "Sexo"
label var ubigeo "Ubicacion geografica"
label var p45_1 "¿Cual fue el nivel de estudios alcanzados por sus padres? - Padre"
label var p45_2 "¿Cual fue el nivel de estudios alcanzados por sus padres? - Madre"
label var p208_02 "Edad en años cumplidos"
label var p209_02 "Estado Civil"
label var p301_02 "Educacion Alcanzada"
label var AñoNacim "Año de nacimiento"
label var Cohorte "Cohorte de edades"


drop if p45_1==10
drop if p45_2==10
drop if p301_02==12
*eliminar datos para crear niveles

destring ubigeo , replace
*para cambiar el tipo de dato

label var Nivel_Padre "Nivel Educativo del Padre"
label var Nivel_Madre "Nivel Educativo de la Madre"
label var Nivel_Hijo "Nivel Educativo del Hijo"

*NIVEL PADRE
. recode p45_1 (1=5 "Nivel 5") (2/3=4 "Nivel 4") (4/5=3 "Nivel 3") (6/7=2 "Nivel 2") (8/9=1 "Nivel 1") (else=.), gene
> rate(Nivel_Padre) label(dnpadre)
(27236 differences between p45_1 and Nivel_Padre)

*NIVEL MADRE
. recode p45_2 (1=5 "Nivel 5") (2/3=4 "Nivel 4") (4/5=3 "Nivel 3") (6/7=2 "Nivel 2") (8/9=1 "Nivel 1") (else=.), gene
> rate(Nivel_Madre) label(dnmadre)
(27236 differences between p45_2 and Nivel_Madre)

*NIVEL HIJO
. recode p301_02 (1/2=5 "Nivel 5") (3/4=4 "Nivel 4") (5/6=3 "Nivel 3") (7/8=2 "Nivel 2") (9/11=1 "Nivel 1") (else=.),
>  generate(Nivel_Hijo) label(dnhijo)
(22752 differences between p301_02 and Nivel_Hijo)




*****LIMA*****

drop if ubigeo<=150000
drop if ubigeo>=159999
*para limpiar data de otros departamentos


label define p301_02 2 "educacion inicial", modify
label define p301_02 12 "basica especial", modify
*renombre de las etiquetas de las variable



recode p45_1 (1=1 "Nivel 1") (2/3=2 "Nivel 2") (4/5=3 "Nivel 3") (6/7=4 "Nivel 4") (8/9=5 "Nivel 5") (else=.), genera
> te(nivel_padre) label(dpadre)
(10209 differences between p45_1 and nivel_padre)
*creacion de niveles de educacion padre



recode p301_02 (1/2=1 "Nivel 1") (3/4=2 "Nivel 2") (5/6=3 "Nivel 3") (7/8=4 "Nivel 4") (9/11=5 "Nivel 5") (else=.), g
> enerate(nivel_hijo) label(dhijo)
(24141 differences between p301_02 and nivel_hijo)
*creacion de niveles de educacion  hijo


label var Cohortes "Cohortes de edades"
label var Nivel_Hijo "Nivel de educacion segun clasificacion de Niveles"
label var Nivel_Padre "Nivel de educacion segun clasificacion de Niveles"
