#:::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::::::: Lista de comandos de Docker :::::::::::::
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::

# IMPORTANTE, no pueden existir dos contenedores con el mismo nombre en el mismo pc 

$ docker run <nombre_del_contenedor>                        # ejecuta el contenedor con ese nombre
$ docker run <nombre_del_contenedor_que_no_tienes_en_local> # busca el contenedor en el servidor de repositorios de docker y lo descarga a local y lo ejecuta
$ docker run -it <nombre_del_contenedor>                    # ejecuta el contenedor con ese nombre en modo interactivo, en caso de Ubuntu, ingresamos a ese sistema operativo a esa consola -i: interactivo | -t: abre la consola
# " cat /etc/lsb-release "  en la consola de linux, puestos en el home, con esa dirección vemos la versión de linux que estemos ejecutando
$ docker run --name <nombre personalizado> <ID del contenedor o nombre del contenedor>                                                          # ejecuta un contenedor con un nombre de identificación personalizado
$ docker run --name <nombre_del_contenedor> -d ubuntu tail -f /dev/null                                                                         # aquí ejecutamos un contenedor ubuntu corriendo el proceso  " /dev/null " para que no se apague el contenedor, sí estas en windows hay que ejecutarlo desde CMD o PowerShell puesto que si lo haces desde Bash, Bash apaga el proceso y se termina la ejecución del contenedor, ademas de /dev/null hay otros procesos para mantener encendido el contenedor, son estos /dev/full  /dev/zero  /dev/random
$ docker run --name <nombre_del_contenedor> -d -it ubuntu                                                                                       # para mantener el proceso encendido, por defecto tiene prendido " bash " (el proceso bash, no confundir con la Terminal llamada Bash) | -d ó --detach: es para ejecutar el proceso en el background o segundo plano 
$ docker run -d --name <nombre_del_contenedor> <nombre_de_la_imagen, ejemplo: nginx>                                                            # para correr un servidor de nginx en el background
$ docker run --name <nombre_del_contenedor> -p 8080:80 nginx                                                                                    # ejecuta un servidor de nginx y conecta el puerto 8080 de mi pc con el puerto 80 del contenedor de docker, al ejecurtalo la consola queda tomada por los registros que muestra el servidor nginx, al salir del con Ctrl + C  contenedor apagas el proceso principal y se apaga el contenedor
$ docker run -d --name proxy -p 8080:80 nginx                                                                                                   # ejecuta un servidor de nginx y conecta el puerto 8080 de mi pc con el puerto 80 del contenedor de docker, sin embargo al colocar -d se ejecuta en el background y no queda tomada la consola terminal
$ docker run -d --name <nombre_del_personalizado_del_contenedor, ejemplo: db> <nombre_de_la_imagen, ejemplo: mongo>                             # crea un contenedor llamado "db" que tiene mongo data base
$ docker run -d --name db -v "C:\Users\Seba\Progra\Platzi\Curso_de_Docker\dockerdata\mongodata":/data/db <nombre_de_la_imagen, ejemplo: mongo>  # "-v" conecta el directorio local (usando el path local) de tu maquina con el de la ruta que está dentro del directorio en el contenedor (usando el path de tu contenedor), es decir los archivos que se creen en una se crearan y/o modificaran en la otra, dentro y fuera del container | Este método se llama Bind Mounts
$ docker run -d --name db -v ${pwd}:/data/db <nombre_de_la_imagen, ejemplo: mongo>                                                              # ${pwd} debiese funcionar igual que la linea "C:\Users\Seba\Progra\Platzi\Curso_de_Docker\dockerdata\mongodata" (esta linea funciona en la terminal Bash [la de git]) en PowerShell o CMD
$ docker run -d --name db --mount src=dbdata,dst=//data/db mongo                                                                                # para iniciar un contenedor asignándole un volumen, "--mount" para indicarle el método, "src" se le dá el nombre del volumen, "dst" la dirección dentro del contenedor a guardar fuera de él, en linux y mac después del dst solo se coloca un "/"   

$ docker ps                                                                                 # muestra los contenedores en ejecución
$ docker ps -a                                                                              # muestra todos los contenedores, tanto detenidos como en ejecución
$ docker ps -l                                                                              # "-l" significa latest, te va a reportar el último repositorio, esté o no en funcionamiento 
$ docker inspect <ID del contenedor o nombre del contenedor>                                # te muestra información del contenedor
$ docker rename <ID del contenedor o nombre del contenedor> <nuevo nombre personalizado>    # cambia el nombre de un contenedor a uno personalizado 
$ docker rm <ID del contenedor o nombre del contenedor>                                     # elimina ese contenedor
$ docker rm -f <ID del contenedor o nombre del contenedor>                                  # detiene ese contenedor (puesto que estaría en ejecución) y lo borra
$ docker rm -f $(docker ps -aq)                                                             # borra todos los contenedores que estén corriendo o apagados a la vez, el comando funciona en linux y mac
$ docker container prune                                                                    # elimina todos los contenedor detenidos en el pc

$ docker --version                                                  # muestra la versión de docker
$ docker exec -it <nombre_del_contenedor> bash                      # para entrar al contenedor que está en background y entrar en el proceso bash 
$ docker exec <nombre_del_contenedor> ps -ef                        # te muestra los procesos del contenedor seleccionado 
$ docker inspect --format '{{.State.Pid}}' <nombre_del_contenedor>  # para saber el proceso en el que se está ejecutando el contenedor, te responderá un número | --format '{{.State.Pid}}' es para filtrar, puesto que sino, te arroja todo la información del contenedor (solo funciona desde terminales Linux)
$ Kill <número del proceso>                                         # para terminar el proceso principal, al terminar ese proceso el contenedor se cierra, ser termina (solo funciona desde terminales Linux)
$ docker stop <nombre_del_contenedor>                               # es para detener el contenedor en ejecución, se puede envíar los 3 primeros caracteres del ID para detenerlo y no enviar el ID completo / envía primero SIGTERM y dado que no lo mato envía SIGKILL, para matar forzadamente el proceso
$ docker logs proxy                                                 # ver los procesos que esta mostrando la consola del proceso, entras en el proceso y puedes ver el asunto, para salir con Ctrl + C no finalizas el proceso, se sigue ejecutando en segundo plano y tu vuelves a tu consola principal
$ docker logs -f proxy                                              # trae los procesos de la consola del container a tu terminal principal y puedes seguir ocupando la terminal, no se bloquea
$ docker logs --tail 10 -f proxy                                    # solo trae los últimos 10 procesos
$ docker volume ls                                                  # lista todos los volúmenes que tenemos, los volúmenes son espacios de memoria externa a un contenedor (se puede compartir entre contenedores) y es manejado plenamente por Docker
$ docker volume create dbdata                                       # Crea un espacio de memoria que va a ser ocupado por un contenedor, los volúmenes en teoría son más seguros que el sistema Bind Mounts
$ docker volume inspect dbdata                                      # para inspeccionar las propiedades de un volumen
$ docker cp prueba.txt copytest:/testing/test.txt                   # estando parados en la carpeta elegida, "cp" copia el archivo (o directorio) prueba.txt al contenedor copytest y lo pega en la ruta asignada después de los dos puntos y con el nombre que le demos, puede ser el mismo nombre
$ docker cp copytest:/testing localtesting                          # se puede extraer un archivo o carpeta del contender (incluso si el contenedor no está siendo ejecutado), toma la carpeta o archivo de la ruta dada en el contenedor al lugar en el que estemos puesto, la ruta del PWD
$ docker cp copytest:/testing/test.txt extraido.txt                 # se pueden sacar archivos
$ docker image ls                                                   # Para listar todas las imágenes que tenemos en la maquina huésped
$ docker pull alpine                                                # para traer una imagen sin ejecutarla, solo trae la imagen 
$ docker pull ubuntu:20.04                                          # las imágenes de contenedores tienen versiones, uno se puede traer desde un repositorio (puede ser publico o privado, el más conocido es docker hub) y las versiones tienen tag, entonces se compone así <nombre imagen>:<tag de la versión>, los tag uno puede verlos en el repositorio
$ docker image rm -f <nombre o id image>                            # para borrar una imagen
$ docker image prune -a                                             # borra todas las imágenes alojadas en el huésped
$ docker build -t ubuntu:platzi .                                   # Previamente hecho una Dockerfile (un archivo de texto que contiene la información que va a contener nuestra imagen), con este comando | -t es --tag | <nombre imagen>:<tag> | " . " es la ruta, con punto le decimos que donde estemos parados en la ruta | se puede omitir le ubuntu y simplemente colocar el nombre de la imagen si se va a trabajar en local y no se va a subir a docker hub
$ docker run -it ubuntu:platzi                                      # ejecutamos el container de esa imagen especificando el tag (o versión de la imagen), en caso de que tengamos varias imágenes con distintas versiones
$ docker login                                                      # para iniciar sesión, sí ya iniciaste sesión en docker local (en la aplicación) y en remoto, se logeará solo y te dejará pasar
$ docker tag ubuntu:platzi sukushaing/ubuntu:platzi                 # para cambiar el dueño de la imagen y la puedas subir a tu repositorio remoto <antigua imagen> <dueño/nueva imagenTuya>
$ docker push sukushaing/ubuntu:platzi                              # sube tu imagen a tu repositorio

$ docker run --rm --publish <Puerto_en_el_pc>:<Puerto_en_el_contenedor> platziapp                                                       # publicar un puerto interno en el externo del pc
$ docker run --rm -p 3000:3000 platziapp                                                                                                # "--rm" para que al terminar de estar corriendo se elimine automáticamente, "-p" para especificar primero el puerto de mi pc y después el puerto de docker
$ docker run --rm -p 3000:3000 -v "C:\Users\Seba\Progra\Platzi\Curso_de_Docker\proyec_node\docker\index.js":/usr/src/index.js platziapp # usamos todo lo aprendido anteriormente
$ docker network ls                                                                                                                     # Lista todas las redes de docker, la "bridge" por retrocompatibilidad, "host" que es la red de mi pc, por si quiero darle acceso a internet, y "none" que es ninguna red
$ docker network create --attachable platzinet                                                                                          # "--attachable" para que los contenedores se puedan conectar a esa red virtual , "platzinet" es el nombre de la red, se puede colocar otro
$ docker network inspect platzinet                                                                                                      # para inspeccionar la red y ver los contenedores conectados a ella
$ docker network connect platzinet db                                                                                                   # primero iniciamos el container llamado "db", y con este comando conectamos ese container a esa red local virtual de docker
$ docker run -d --name app -p 3000:3000 --env MONGO_URL=mongodb://db:27017/test platziapp                                               # "--env" para pasarle variables de entorno "mongodb://db:27017/test" el "db" en esa url reemplaza localhost y es el nombre del container | no se puede tener dos servicios en el mismo puerto
$ docker-compose up                                                                                                                     # estando en parado en la carpeta con el archivo docker-compose.yml, se puede ejecutar este comando, el archivo tendrá las instrucciones para levantar los servicios, cada servicio puede contener uno o más contenedores
$ docker-compose up -d                                                                                                                  # ejecuta los servicios en 2do plano, sí en vez de citar a imágenes cita a un Dockerfile, crea la imagen y después levanta los servicios

$ docker-compose down                                                               # Detiene los contenedores creados por docker-compose up
$ docker-compose ps                                                                 # para listar todo los contenedores creados con docker compose
$ docker-compose losg                                                               # para ver los logs que mostraron los servicios creados
$ docker-compose losg <nombre del servicio> <nombre de otro servicio (opcional)>    # para ver los logs de los servicios seleccionados, se puede colocar más de uno
$ docker-compose losg -f <nombre del servicio> <nombre de otro servicio (opcional)> # para ver los logs de los servicios seleccionados, se puede colocar más de uno, y se puede hacer rastreo de los logs con "-f" si aparece un log nuevo, lo mostrará en mi consola
$ docker-compose exec <nombre del servicio> bash                                    # para entrar en el servicio y ejecutar comandos, eb este caso entramos al bash
$ docker-compose build                                                              # para construir la imagen que está ligada a un Dockerfile
$ docker-compose -d --scale app=2                                                   # para levantar una segunda instancia de app en otro puerto, debes dar el rango de puertos a usar
$ docker-compose -d --scale app=3                                                   # Para levantar una 3ra, debe haber una manera más fácil de hacerlo sí quiero levantar 100 servicios
$ docker system prune                                                               # borra todo lo que no se esté usando, redes, tags, containers, etc.
$ docker run -d --name <nombre_del_contenedor> --memory 1g <nombre_de_la_imagen>    #limito el uso de memoria ram a 1 gb para ese contenedor, el mínimo son 6mb
$ docker stats                                                                      # veo cuantos recursos consumen los container en ejecución en mi sistema
$ docker inspect <nombre_del_contenedor>                                            # puedo ver si el proceso muere por falta de recursos, de todo el texto que muestra buscar la parte que diga "State" y ahí OOMKiller: True (Out of Memori killer, muerto por falta de memoria)
$ docker kill <nombre_del_contenedor>                                               # envía un SIGKILL para matar forzadamente el contenedor
$ docker run --rm --name <nombre_del_contenedor> <nombre_de_la_imagen>              # corre el contenedor y cuando termina de ejecutarse se borra
$ docker build -t <nombre_de_la_imagen> -f <ruta_donde_está_el_dockerfile> .        # "-f" es para que busque el dockerfile en una ruta especificada, " . " es para decirle todo lo que está en la carpeta



#:::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::: Imágenes del repositorio Dockers :::::::::
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::

# El repositorio en la nube se llama Docker Hub
# -> hello-world
# -> ubuntu
# -> mongo
# -> nginx


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::::::: Lineas de mongo data base :::::::::::::::
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::

# una vez ejecutaste el comando para entrar al contenedor que contiene mongo, estas son lineas para usarlo

$ mongosh                                   #para ejecutar la base de datos de mongo
$ use <nombre_de_la_base_de_datos_a_usar>   # puedes crear el nombre y se crea la base de datos
$ db.users.insertOne({'name':'yourName'})   # para insertar un argumento en la base de datos de mongo
$ db.users.find()                           # para encontrar los registros en la base de datos de mongo
$ exit                                      # para salir


#:::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::: Instalar Docker en W10 y W11 :::::::::::::
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Primero debes instalar desde la store de microsoft "Windows Subsistem for Linux" (WSL), luego instala la distribución, puede ser Ubuntu desde la misma tienda.
# Ejecuta Ubuntu, búscalo en tu lista de programas y ábrelo, se abrirá una consola, ejecuta un comando ls y te dará un error con un link, ve a ese link e instala el kernel que está solicitando, ahora está listo para Docker.
# Luego descarga desde la web de Docker la versión para Windows e instala, ahí funcionará.
# Docker necesita que previamente esté instalado WSL

# Este tutorial es más fácil y rápido que los otros de abajo
# https://platzi.com/clases/2292-terminal/53893-opcional-instalar-wsl-usa-linux-dentro-de-windows/

# En este video obtendrás una guía más detallada en como instalar WSL
# https://youtu.be/_fntjriRe48?si=kury4d2h5FpFhRLO

# Y en este video que es la continuación del anterior obtendrás una guía para instalar docker
# https://youtu.be/5RQbdMn04Oc?si=2EclWIzuDORdU7Fu
