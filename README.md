# PracticaLAMP
Comenzaremos editando el fichero vagrantfile, en el que añadiremos una estructura en dos niveles, una con un servidor apache y la otra con un servidor mysql


![image](https://github.com/user-attachments/assets/7231203c-b0ce-47cf-a27d-392a6b111660)


Crearemos los sh de aprovisionamiento para las amquinas, en nuestro caso hemos logrado automatizar todo el proceso, aqui tenemos el provisionamiento del apache:


![image](https://github.com/user-attachments/assets/9da3c49d-a298-475d-88e4-de4cf6a86198)


En él, lo que haremos será descargar el apache y sus servicios, para empezar, a continuación usaremos el git clone para importar los datos que se nos han facilitado en un fichero de github,llevaremos todo a una ruta, en nuestro caso sera lamp_app, lo que haremos sera darle permisos a la pagina web.
Nos moveremos al directorio sites-available y alli copiaremos el fichero que viene por defecto y crearemos uno nuevo, en este caso seria practica.conf, le cambiamos la ruta del documentroot para que nos ponga la ruta en la que queremos que se encuentre.
Desactivaremos el sitio web por defecto que sería el sitio web del apache, y activamos nuestra nueva página web , reiniciaremos el servicio del apache y a continuacion editaremos el fichero config.php y tras editarlo, de nuevo volveremos a reiniciar el servicio

En el caso del aprovisionamiento del mysql tendremos:


![image](https://github.com/user-attachments/assets/dd0e55c6-ab31-4015-a504-b7b898f5d92e)


Como podemos observar, primeramente debemos instalar el servicio de mysql, posteriormente lo iniciariamos e importamos la base de datos que se nos facilita en el archivo de github.
Entraremos en mysql como el usuario root y creamos un usuario con la ip de la maquina apache para que a partir de ahi podramos conectarnos, y le damos los permisos al usuario.
Para que nos coja la base de datos en el fichero mysqld.cnf tendremos que cambiar el bind-address cambiaremos la ip que viene por la de la maquina apache,
Para finalizar reiniciamos el servicio de mysql y quitamos la puerta de enlace, ya que queremos que esta maquina no tenga conexión a internet

Una vez realizado todos los aprovisionamientos iniciaremos, con un vagrant up --provision (para que nos ejecute los provisionamientos) y finalmente en un 
navegador web entraremos con http://ipdelserverapache:8080 que es el puerto que hemos puesto como host. El resultado seria el siguiente:

![image](https://github.com/user-attachments/assets/b76d28a1-afa6-457a-a685-183aecb13b2d)

