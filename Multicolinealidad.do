*Colinealidad perfecta
*Suponga que queremos explicar el salario a partir de tres variables
*wage=B0+B1*educ+B2*exper+B3*Z+u
*Donde Z=educ+5, es decir que por contrucción hay colinealidad perfecta.
generate Z=educ+5
*regresion
regress wage educ exper Z
*En caso de colinealidad perfecta STATA omite la variable por defecto, en este caso Z.


*Multicolinealidad
*Suponga que queremos explicar el salario a partir de tres variables
*wage=B0+B1*educ+B2*exper+B3*Z+u
/*Donde Z es ahora: Z=educ+5+epsilon, donde epsilon es una variable aleatoria normal 
con media 1 y desviacion estandar 0.1*/
generate epsilon=rnormal(1,0.1)
replace Z=educ+5+epsilon
regress wage educ exper Z
*correlación
corr educ exper Z
*Factor inflacionario de varianza
 estat vif
 *EL FIV da mayor a 10, por tanto hay multicolinealidad.
 *Suponga que omitimos Z
 regress wage educ exper 
