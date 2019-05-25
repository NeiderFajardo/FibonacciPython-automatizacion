

# Automatización desarrollo de software
_En el presente repositorio se observa un programa muy sencillo en python, al cual se le realiza el proceso de verificación de requerimientos y de integración contniua, por medio de Jenkins, el cual corre en un entorno dockerizado, de forma automática. Se mostrará el paso a paso seguido para lograr está configuración así como sus resultados._

## Integración continua
![jenkins-docker](https://user-images.githubusercontent.com/31807256/56621070-b7b29000-65f0-11e9-8fa4-3c9b98dcd086.jpg)
Para las pruebas de integración continua hacemos uso de la herramienta Jenkins, montando en un entorno Dockerizado, que a su vez cuenta con un vólumenes que permiten que los datos y procesos realizados en la herramienta puedan ser recuperados la próxima vez que ésta se inicie.
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


