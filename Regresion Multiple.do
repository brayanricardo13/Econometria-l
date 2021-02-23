/*La base datos contiene información sobre un conjunto de estudiantes
universitarios. Queremos explicar su promedio academico en la universidad
(colGPA).*/

*Descripción de las variables
describe
*Estadisticas descriptivas
sum

*Explicar el promedio academico a partir de las fallas de asistencia a clase
*regresión simple
regress colGPA skipped

*ahora incluimos el consumo de alcohol
regress colGPA skipped alcohol


twoway (scatter colGPA skipped) (lfit colGPA skipped)
twoway (scatter alcohol skipped) (lfit alcohol skipped)
