Feature: Calcular la serie de Fibonacci
  Para poder calcular la serie de Fibonacci, a partir de un numero dado,
  se debe realizar un programa que sea capaz de retornar el resultado contemplando
  todos los posibles errores.

  Scenario: Numero entero mayor a 2
    Given el algoritmo calcula la serie de fibonacci
     When el usuario ingresa numero > 2 
     Then el algoritmo muestra el resultado de la serie

  Scenario: Numero entero positivo menor a 2 
    Given el algoritmo calcula la serie de fibonacci
     When el usuario ingresa numero: 0 , 1 o 2
     Then el algoritmo retorna 0 si numero = 0, retorna 1 si numero = 1 o 2

  Scenario: Numero entero negativo
    Given el algoritmo calcula la serie de fibonacci
     When el usuario ingresa numero < 0
     Then el algoritmo retorna el numero y un mensaje de error

  Scenario Outline: Variable  diferente de un entero 
    Given el algoritmo calcula la serie de fibonacci con un numero dado
     When el usuario ingresa un una variable distinta de un numero entero
     Then el algoritmo retorna un mensaje 

 Examples: Numero tipo float sin decimal
   | float         | int         |
   | 1.0           | 1           |

 Examples: Numero tipo float con decimal
   | float         | String      |
   | 1.1           | error       |

 Examples: Numero tipo character
   | char          | String      |
   | a		   | error       |

