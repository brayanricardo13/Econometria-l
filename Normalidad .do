*Normalidad
/*Suponga que tenemos un modelo de regresión donde queremos explicar
el salario a partir de la educación y la experiencia.*/
*La regresión es:
regress wage educ exper
*¿el termino de error sigue una distribución normal?
*Para saber obtenemos los residuales y los pronosticos
predict uhat, residuals
predict yhat
*Histograma
histogram uhat, normal
histogram yhat, normal
*Para hacer la prueba JB obtenemos S y K
sum uhat, detail
*JB=(526/6)(1.715497^2 + (7.626735-3)^2/4)=
display (526/6)*(1.715497^2 + ((7.626735-3)^2/4))
/*JB=727.15 es un valor muy muy grande. Por tanto rechazo Ho el termino de error
no sigue una distribución normal*/

*En STATA podemos usar el comando sktest para realizar prueba de normalidad
sktest uhat

*Podemos hacer la prueba con los pronosticos (yhat)
sum yhat, detail
display (526/6)*((-0.2725814)^2 + ((3.522745-3)^2/4))
*JB=12.5
*Usando sktest tenemos
sktest yhat
*Rechazamos Ho, portanto el termino de error no sigue una distribución normal.


/*Dado que no hay distribución normal, podemos probar ajustando con logaritmos
(o con otra forma funcional) el modelo.
Probemos usando logaritmo en la variable y*/
regress lwage educ exper
*Obtenemos los residuales
predict uhat2, residuals
histogram uhat2, normal
sktest uhat2
/*JB aprox 7.5 con un p-valor de 0.0236. Esto quiere decir que con un nivel de significancia 
del 1% no rechazo Ho y los residuales siguen una distribucion normal. El chi cuadrado de la tabla
al 1% da 9.210 por tanto 7.5<9.210 no rechazo Ho. 
