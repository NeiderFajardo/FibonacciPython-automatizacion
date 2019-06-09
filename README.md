

# Automatización desarrollo de software
_En el presente repositorio se observa un programa muy sencillo en python, al cual se le realiza el proceso de verificación de requerimientos y de integración contniua, por medio de Jenkins, el cual corre en un entorno dockerizado, de forma automática. Se mostrará el paso a paso seguido para lograr está configuración así como sus resultados._

## Integración continua
![jenkins-docker](https://user-images.githubusercontent.com/31807256/56621070-b7b29000-65f0-11e9-8fa4-3c9b98dcd086.jpg)
Para las pruebas de integración continua hacemos uso de la herramienta Jenkins, montando en un entorno Dockerizado, que a su vez cuenta con un vólumenes que permiten que los datos y procesos realizados en la herramienta puedan ser recuperados la próxima vez que ésta se inicie.

### Unit Testing (Pruebas Unitarias)
_La prueba de unidad es un método de prueba de software mediante el cual se prueban unidades individuales de código fuente, conjuntos de uno o más módulos de programas informáticos junto con datos de control asociados, procedimientos de uso y procedimientos operativos para determinar si son aptos para el uso._
_Basados en esto, procedemos a realizar un ejemplo sencillo de como programar a través de las pruebas unitarias. Desarrollamos un algoritmo simple de la sucesión de fibonacci, el cual desarrollamos iterativamente, por cada compliación que se realiza y cada error nuevo se desarrolla un fragmento de codigo._
```
class Fibonacci:

    def __init__(self):
        self.a = 0
        self.b = 1

    def serie(self,numero):
        a = 0
        b = 1
        for k in range(numero):
            c=b+a
            a=b
            b=c
        return a
```
_Esto lo podemos realizar gracias a la libreria unittest, la cual es proporcionada por python y es de codigo abierto. Gracias a esta libreria podemos ir realizando pruebas, e ir desarrollando al mismo tiempo, este procedimiento como lo muestra el codigo e imagenes en el repositorio, se hace de forma manual, es en este aspecto que entran las tecnologias de automatización, lo que nos lleva a hablar de Jenkins en el siguiente apartado._

### Behavior-Driven Development (Desarrollo Guiado por el Comportamiento)
_El desarrollo guiado por el comportamiento combina las técnicas generales y los principios del TDD, junto con ideas del diseño guiado por el dominio y el análisis y diseño orientado a objetos para proveer al desarrollo de software y a los equipos de administración de herramientas compartidas y un proceso compartido de colaboración en el desarrollo de software._
_Este tipo de desarrollo en si esta fuertemente ligado a la parte de requerimientos, por tanto cada parte del codigo que se desarrolle debe estar basada en los requerimentos definidos anteriormente. De esta forma este segundo proceso, puede asociarse con la primera parte, y así complementarse. Para poder realizar esta parte de desarrollo usamos la libreria Behave, propia de Python._

```
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
```
_Esta descripcion es guardado a en un archivo .feature el cual almacena una serie de requerimientos, en el repositorio se encuentran algunos anexos, los cuales definen distintos tipos de situaciones y entradas de usuario alternas._

### Jenkins
_Jenkins es un servidor de automatización de código abierto, autónomo, que se puede utilizar para automatizar todo tipo de tareas relacionadas con la creación, prueba y entrega o implementación de software._

_Para poder hacer uso de Jenkins en un entorno dockerizado, se debe debe realizar docker-compose.yml con el siguiente contendio:_
```
version: "2"
services:
  jenkins:
    image: jenkinsci/blueocean
    user: root
    ports:
      - "8080:8080"
      - "8443:8443"
      - "50000:50000"
    volumes:
      - ./jenkins_data:/var/jenkins_home
      - ./home:/home
      - /var/run/docker.sock:/var/run/docker.sock
```
_Con el anterior archivo nos aseguramos de tener la imagen de Jenkins y de que los cambios que hagaos en una sesión queden guardados para la siguiente. Para desplegarlo simplemente se debe utilizar el comando:_
```
docker-compose up
```
_en la dirección en que se encuentra localizado el archivo._

## Integracción Contínua
_Para realizar las pruebas de integración continua se debe crear un nuevo proyecto. En nuestro caso, como la aplicación se encientra en un repositoria GitHub, Jenkins nos permite asociar el repositorio, al cuál se le realizará la integración contínua. Se puede configurar la opción de cada cuanto tiempo se realizan las prueba, si se encunentra algún fallo, se le notificará a los integrantes del proyecto. Incluso se pueden configurar notificaciones personalizadas a los programadores que realizaron el commit que generó el error de ejecución de la prueba, esta notifica en dónde se encuentra el error y cuál fue la causa de este._
![](Imgs/Captura%20de%20pantalla%20de%202019-05-22%2006-36-00.png)


## Autores

* **Cristian Camilo Cuervo Castillo** - *20142020025*

* **Edvard Frederick Bareño Castellanos** - *20142020014*

* **Neider Alejandro Fajardo Cardona** - *20142020025*


