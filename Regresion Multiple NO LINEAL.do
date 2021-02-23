/*Ejemplo: suponga que queremos explicar el salario en dolares (wage)
 a partir de los años de educación (educ).*/
 
*modelo nivel-nivel
regress wage educ 
*Por cada año adicional de educación el salario aumenta en 0.54 dolares/hora

*modelo log-log
*el salario en logaritmo es lwage
*creamos la eduación en logaritmo
generate leduc=ln(educ) 
regress lwage leduc
/*Estamos diciendo que un aumento de 1% en los años eduación 
aumenta el salario en 0.82%. En otras palabras el salario es 
inelastico frente a los años de educación.*/

*modelo log-nivel
regress lwage educ
*La pendiente es 0.082. La multiplicamos por 100. 8.2%
*un año mas de educación aumenta el salario en 8.2%
