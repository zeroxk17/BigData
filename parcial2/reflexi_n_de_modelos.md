# PARTE 17. Reflexión

Responde las siguientes preguntas en esta misma celda (haz doble clic para editarla).

### 1.
¿Qué diferencia observaste entre la regresión lineal, la regresión polinomial y Random Forest?

*Respuesta:* La regresión lineal produce una línea recta con tendencia constante. La regresión polinomial genera una curva que puede capturar cambios de dirección en los datos. Random Forest se ajusta muy bien a los datos históricos, pero no puede extrapolar fuera del rango conocido.

### 2.
¿Por qué los tres modelos generan predicciones diferentes si utilizaron los mismos datos históricos?

*Respuesta:* Porque cada modelo usa una función matemática diferente para representar la relación entre el año y los nacimientos. Cada función "interpreta" los datos de forma distinta, por lo que al proyectar al futuro cada una sigue su propia lógica.

### 3.
¿Qué modelo produjo una tendencia más cercana visualmente a las proyecciones de OWID?

*Respuesta:* La regresión polinomial, ya que puede capturar la tendencia decreciente de los nacimientos observada en los últimos años y proyectarla con una curva similar a la de OWID.

### 4.
¿El modelo que visualmente parece acercarse más a las proyecciones de OWID necesariamente es el mejor modelo? Explica.

*Respuesta:* No necesariamente. Un modelo puede parecerse visualmente a OWID por coincidencia, sin considerar factores demográficos reales. La similitud visual no mide el error de predicción ni garantiza que el modelo sea correcto para otros contextos.

### 5.
¿Qué comportamiento observaste en las predicciones de Random Forest para los años posteriores a 2023?

*Respuesta:* Las predicciones se aplanan y permanecen casi constantes. Esto ocurre porque Random Forest no extrapola: al encontrarse con años fuera del rango de entrenamiento, repite los valores extremos aprendidos.

### 6.
¿Por qué debemos tener cuidado al utilizar un modelo entrenado con datos históricos para realizar predicciones hasta el año 2100?

*Respuesta:* Porque los modelos asumen que los patrones del pasado se mantendrán en el futuro. Sin embargo, factores como cambios sociales, económicos o de política pública pueden alterar la tendencia. A mayor distancia del período de entrenamiento, mayor es la incertidumbre de la predicción.