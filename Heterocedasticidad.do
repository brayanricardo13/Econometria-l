*Queremos explicar el salario a partir de la eduación la antiguedad y la experiencia
regress wage educ tenure exper
*¿este modelo tiene heteroscedasticidad?
*Miremos los residuales al cuadrado
predict u, residuals
generate u2=u^2 
*Grafica de u2 vs educ
 twoway (scatter u2 educ)
*Grafica de u2 vs tenure
 twoway (scatter u2 tenure)
 *Grafica de u2 vs exper
 twoway (scatter u2 exper)
 *Prueba Breusch-Pegan
 estat hettest educ exper tenure, fstat
 *Estadistico F=15.53>c, rechazo Ho, se concluye el modelo tiene heteroscedasticidad.
 *Prueba White
  estat imtest, white
 *Tambien concluye que hay heteroscedasticidad
 
 *Corrección con estadisticos robustos:
 regress wage educ tenure exper, robust
 
 *Minimos cuadrados ponderados: intuitivamente vimos que h(x)=educ
 regress wage educ tenure exper [aweight = 1/educ]
  *Prueba Breusch-Pegan
 estat hettest educ exper tenure, fstat
