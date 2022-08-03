::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::: Atajos de Teclado :::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 
- con las fechas de subir y bajar puedes ver los comandos utilizados previamente, 
- con la tecla Tab puedes completar el nombres de la carpeta en la que estás escribiendo
- ctrl + C, terminas un proceso que esté ejecutando la terminal
- con la tecla " q " sales de archivos de texto que estes viendo
- ctrol + Z, envias un proceso activo a background (segundo plano)

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::: Lista de comandos de la terminal :::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

ls: lista archivos dentro de la carpeta en la que estes
ls -l: listar archivos con detalles, fecha, hora, peso, permisos, etc
ls -a: Lista los archivos incluyendo los ocultos
ls -S: Lista los archivos por tamaño, de mayor a menor
ls -lh: listar archivos con detalles de manera más lejible más humana
ls -la: listar archivos con detalles incluyendo los ocultos
ls -lS: listar archivos con detalles mostrando los pesos (sizes)(" S " en mayuscula )
ls -lSh: listar archivos con detalles mostrando los pesos de manera más lejible
ls -lr: listar archivos ordenados al revez 
ls -lSarh: se pueden convinar
ls *.[extensión de archivo] : filtra la lista segun la extensión (ejemplo: ls *.txt => muestra solo los archivos txt) {Estas son las wildcards, puedes bucar más en internet bajo ese nombre, son para filtrar}; el simbolo " * " es una wildcards y se usa para reemplazar un texto u extensión
ls [nombre o parte del nombre del archivo]* : filtra la lista segun los nombres que tengan esas letras en su nombre, independiente de la extensión (ejemplo: ls datos* => muestra los archivos que tengan la letras "datos" en su nombre (datos1.txt datos123.xlsm)) {Estas son las wildcards, puedes bucar más en internet bajo ese nombre, son para filtrar}
ls [nombre o parte del nombre del archivo]? : al igual que arriba aunque solo traerá los que tengan un solo caracter, que reemplace al signo " ? " (en este caso " datos1 ") {Estas son las wildcards, puedes bucar más en internet bajo ese nombre, son para filtrar}
ls [[:upper:]]* : para buscar los archivos que empiecen solo por mayuscula, buscará hasta 2 niveles de carpetas {Estas son las wildcards, puedes bucar más en internet bajo ese nombre, son para filtrar}
ls -d [[:upper:]]* : solo mostrará los directorios que empiecen por mayucula {Estas son las wildcards, puedes bucar más en internet bajo ese nombre, son para filtrar}
ls [[:lower:]]* : para buscar los archivos que empiecen solo por minuscula, buscará hasta 2 niveles de carpetas {Estas son las wildcards, puedes bucar más en internet bajo ese nombre, son para filtrar}
ls [ad] : buscará todos los archivos y carpeta que inicien con "a" y con "d"{Estas son las wildcards, puedes bucar más en internet bajo ese nombre, son para filtrar}
ls [Carpeta] > [nombre del archivo a guardar y crear.txt] : guarda la lista de carpetas de ls en un archivo (ejemplo: ls Pictures > misarchivos.txt) {solo me funciono en la raiz}
ls [Carpeta] >> [nombre del archivo a guardar] : guarda la lista de carpetas de ls en un archivo sin borrar lo que hay dentro del contenido
ls [algo erroneo] 2> [nombre del archivo a crear y en el que se guardará el error] : el error arroja un texto, ese texto lo guarda en un archivo (ejemplo: ls sdfasdf 2> error.txt)
ls [carpeta o algo errado] > [nombre del archivo a guardar y crear.txt] 2>&1 : uno coloca la instrucción, sí es correcto se guarda el resultado en el archivo, sí es un error se guarda el error tambien en el mismo archivo, (ls dwhelasdfasd > output.txt 2>&1) los error se tratan distinto a los comandos bien ejecutados por eso el 2 antes antes del mayor que

cd : te mueves la carpeta raiz " ~ "
cd [nombre carpeta] : abre o te metes dentro de esa carpeta o directorio
cd .. : subes en el directorio, es decir, vuelves a la carpeta que contiene a la que estas actualmente
cd ../.. : subes 2 directorios, es decir, vuelves a la carpeta que contiene a la contiene en la que estas actualmente, se pueden usar " ../../../../ " cuantas veces quieras

clear : para limpiar la pantalla de la terminal o "ctrl + l(ele)"
exit: para salir de la consola, se cierra la terminal

pwd : te dice la ruta o carpeta de donde estas

file [nombre del archivo] : te dice como está hecho ese archivo

tree : se supone que te muestra las carpetas en arbol (en mi pc windows no lo hizo, trabajo con la git bash)
tree -L 2 : te muestra 2 nivels de carpetas y no todas las subcarpetas que tengas en la carpeta en que estes

mkdir [nombre de la carpeta a crear] : crea una carpeta o directorio, intentar no cupar espacio " ", sí lo ocupas, tienes que "poner el nombre de la carpeta entre comillas"
mkdir [NewCarp1] [NewCarp2] [NewCarp3] : puedes crear varias carpetas a la vez

touch [nombre del archivo a crear] : crea un archivo, puedes colocarle extensión al archivo, si existe se modifica la fecha con actual del sistema
touch [NewFile1] [NewFile2] [NewFile3] : puedes crear varios archivos a la vez
 
cp [Nombre del archivo a copiar] [nombre del archivo copiado] : copia archivos
cp -r [Nombre de la carpeta a copiar] [nombre de la carpeta copiada] : Copia una carpeta 

mv [nombre del archivo] [Ruta a quedar (puede ser " .. ")] : mueve el archivo al directorio deseado
mv [nombre a cambiar el nombre] [nombre nuevo del archivo] : Cambia el nombre del archivo, sino se le especifica directorio y se le coloca otro nombre

rm [nombre del archivo] : ¡Cuidado! este comando borra permanentemente el archivo
rm -i [nombre del archivo] : te pregunta si quieres borrar permanentemente el archivo, debes responder con " y ", para responder afirmativamente, cualquier otra tecla que presiones, no borra el archivo
rm -r [nombre del directorio] : -r de recursivo, para borrar directorios y todo su contenido
rm -r [NameDir1] [NameDir12 [NameDir3] : puedes borrar varios a la vez
rm -f [nombre del archivo] : para forzar el borrado del archivo aunque se esté ejecutando
rm -rif [nombre del directorio] : se pueden convinar las flag

head [nombre del archivo] : para ver las primeras 10 lineas de texto del archivo seleccionado
head [nombre del archivo] -n [numero natural] : para ver N primeras lineas de texto del archivo seleccionado

tail [nombre del archivo] : para ver las ultimas 10 lineas de texto del archivo seleccionado
tail [nombre del archivo] -n [numero natural] : para ver N ultimas lineas de texto del archivo seleccionado

less [nombre del archivo] : para ver el archivo de texto, se despliega una interfaz que te muestra el archivo en cuestion, con " / " puedes buscar palabras dentro del archivo de texto, con " q " sales de esa interfaz y vuelves a la terminal

wc [nombre del archivo] : Te muestra en el siguiente orden, cantidad de líneas tiene el archivo, cuantas palabras y el número de bits tiene un archivo
wc -l [nombre del archivo] : solo te muestra el número de lineas 
wc -w [nombre del archivo] : solo te muestra el número de palabras
wc -c [nombre del archivo] : solo te muestra el número de bit

open [nombre del archivo] : (en mac) para abrir el archivo 
xdg-open [nombre del archivo] : (en linux) para abrir el archivo, se crea un proceso y no se puede escribir hasta que lo mates, con Ctrl + C | Pd: no me funciono en windows con mi GIT bash

nautilus : para abrir la carpeta como interfaz grafica
nautilus [ruta de la carpeta] : para abrir la carpeta como interfaz grafica

type [comando shell: ejemplo: cd] : te dirá el tipo de comando que es, en este caso, "type cd" te dirá que es "cd is a shell builtin"

alias [[nombre del alias]="[la instrucción shell]" : ejemplo : l="ls -lh" ]: crea un alias de una función shell más larga, que se puede ejecutar con el alias, al cerrar la terminal se borra el alias

help [comando shell: ejemplo: cd] : te dirá todo lo que puedes hacer con cd
[comando shell: ejemplo: cd] --help : te dirá todo lo que puedes hacer con cd
man [comando shell: ejemplo: cd] : te da el manual de uso de cd
info [comando shell: ejemplo: cd] : te da el información de uso de cd
whatis [comando shell: ejemplo: cd] : te da el información de uso de cd

echo "[texto a colocar]" : te responde con el texto colocado entre comillas

cat [archivo.ext] : para ver el archivo en el mismo visor de linux
cat < [archivo.ext] : para ver el archivo en el mismo visor de linux, el menor que es un "standar output" es para que te muestre ese algo la terminal 
cat > [archivo.ext] : para modificar un archivo existente, con " ctrl + D " sales del editor y vuelves a la terminal, usar dos veces el comando para salir sí no sales a la primera

cal: devuelve un calendario en la terminal (en mi pc windows no lo hizo, trabajo con la git bash, en la del profe si funcionó)
code [archivo.ext] : para abrir el archivo en VSC (visual estudio code)

nano : editor de archivos de texto en la consola
nano nombre-del-archivo : para editar un archivo, sí no existe lo crea

chmod [permisos en formato octal] [nombre del archivo] : cambia los permisos de un archivo, los permisos deben estar escritos en cualquier modo

whoami : te dice el usuario que estas usando

su root : para acceder a super usuario, te pedirá la clave

sudo [comando que necesite permisos de root] : para ser root temporalmente, sin permanecer en el estado root

passwd : para cambiar la contraseña del usuario actual

which [comando binario] : [ejemplo: which code  =>  arroja la dirección de donde está el archivo binario que se ejecutará] busca las rutas de los comandos binarios (programas que se ejecutan en la terminal)

ln [ruta del directorio] : es una forma de crear un link a un objetivo
ln -s [ruta del directorio] [nombre del acceso direto]: para crear un acceso directo (yo que estoy en bach, me copio la carpeta origina a la posición en la que estaba)

ps : te permite ver los procesos corriendo en el momento en la terminal, te muestra los PID (con es número puedes matar el proceso)
kill [PID del proceso] : para terminar procesos que están corriendo en primer plano, no sirve para matar procesos en background
top : te muestra todos los procesos que están corriendo en el pc, al presionar " h " te muestra la ayuda, al presionar " u " se puede filtra por usuario
jobs : para ver los procesos en segundo plano de la terminal, te muestra a la izquierda el número del proceso
fg [número del proceso que muestra en jobs] : puedes traer ese proceso que está en segundo plano al primer plano de la terminal
bg [número del proceso que muestra en jobs] : enviamos un proceso a background
ctrl + Z : enviamos un proceso actual que se está ejecutando en consola a background

vim : es un editor de texto dentro de la consola, para salir de él, hay que presionar " :q + tecla Enter ", para guardar un archivo " :w " y guardas, para guardar y salir " :wq " y listo
vim [nombre del archivo.ExtensiónDeTexto] : el comando más el nombre del archivo a crear y editar, la extensión puede ser cualquier extensión de texto, txt, html, js, css, py, etc; el archivo se creará en la carpeta en la que estés posicionado, con vim tienes el modo escritura y normal, por defecto entras en escritura, con ese modo puedes escribir, para cambiar de modo puedes presionar " ESC " y pasas al modo normal, ahí puedes buscar con " / " al igual que less

env > [archivo de texto] : (env > environment.txt) Para guardar todas nuestras variables de entorno en un archivo de texto podemos ejecutar el comando


:::::::::::::::::::::::: comandos para buscar :::::::::::::::::::::::

find [directorio] [que parametro busco] [parametro] : (Ejemplo: $ find ./ -name file => busca todos los archivos llamados file en el pc) va a buscar un archivo segun elparametro dado
($ find ./ -name *.txt | less) para obtener el resultrado como en texto en el que se puede buscar
($ find ./ -type d -name Documents) : para buscar por tipo y puede ser " d " (de directorio) y " f " (de file)
($ find ./ -type f -name *.log) : (" ./ " con este punto y slash buscas en el directorio donde estás)
(find ./ -size 20M) : busca todo los archivos mayores a 20 Mb en el pc

grep [palabra buscada] [nombre del archivo] : Busca en ese archivo la palabra que le especifiques y devuelve la frase en la que está
grep -i [palabra buscada] [nombre del archivo] : sin la "-i" discrimina si es mayuscula o minuscula, ahora al agregar "-i" no hace diferencia y muestra ambas, busca en ese archivo la palabra que le especifiques, devuleve la linea
grep -c [palabra buscada] [nombre del archivo] : cuenta cuantas veces aparece el termino buscado
grep -v [palabra buscada] [nombre del archivo] : busca todos las lineas que no contengan la palabra buscada

:::::::::::::::::::::::: comandos de compresión :::::::::::::::::::::::

tar -cvf [NombreDelArchivoComprimido.tar] [carpeta o archivo a comprimir]: comprime archivos, flag -c = comprimir, -v = vervorea (muestra en pantalla lo que está comprimiendo) -f = para decirle que es un archivo (ejemplo: tar -cvf test.tar test/)
tar -czvf [nombre del archivo].tar.gz [nombre del archivo comprimido] : -z = para darle a la compresión un codec de .gz que es ideal para texto plano
tar -x [nombre del archivo a descomprimir].tar : Descomprime un .tar
tar -xzvf [nombre del archivo a descomprimir].tar.gz : Descomprime un .tar.gz 

zip -r [NombreDelArchivoComprimido.zip] [carpeta o archivo a comprimir] : comprime en formato .zip, -r = recursivo (comprime a los archivos internos, usar con los directorios)
unzip [nombre del archivo a descomprimir].zip : descomprime el archivo

:::::::::::::::::::::::: comandos para red :::::::::::::::::::::::

ipconfig : te muestra los detalles de tu red

ping [sitio web] : (ping www.google.com) sí el sitio está disponible, te muestra los ping a la pagina y el tiempo de respuesta, sí no se detiene solo, puedes pararlo con ctrl + C

curl [sitio web] : (curl www.google.com) te responde con el html de la web

wget [sitio web] : (wget www.google.com) descargas el sitio web o la dirección al pc

traceroute [sitio web] : (traceroute www.google.com) te muestra todas las computadoras por donde pasa tu petición

netstat : te muestra las conexiónes activas 
netstat -i : te muestra los dispositivos de red

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::: Lista de pipe operartor :::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
 | : (el simbolo de la barra vertical) redirige el standar output a un standar input de otro comando, entonces, lo que arroja como resultado un comando, se lo pasamos a otro, por ejemplo: $ "ls -lh | less" arroja como resulta la lista larga de manera humana, pero la estoy viendo como texto y usar / para buscar, como un archivo abierto con less 
 ; : (el simbolo de punto y coma) ejecuta una instrucción primero, despues la otra y la que sigue (ejemplo: $ ls; mkdir holi; cal => hace el listado de carpetas, despues crea la carpeta, despues muestra un calendario)
 & : (el simbolo de aspersand) ejecuta los comandos de manera paralela y en el background (en segundo plano), en diferentes hilos del procesador (ejemplo: $ ls & date & echo "hihi" => arroja los números de los procesos donde se va a ejecutar, se ejecutan, y se entregan en orden de cual termina primero, cierra los hilos de trabajo)
 && : (el simbolo de doble aspersand) es un condicional, solo si se ejecutó de manera adecuada el primer comando se ejecutará el segundo y/o tercero sí lo hay
 || : (el simbolo de doble barra vertical) es un " or " es decir ejecuta los comandos, hasta que uno sea exitoso, se ejecuta ese exitoso y los demas no se ejecutan, (ejemplo: $ cd NoExitDir || touch archivo.txt || echo "Archivo creado" => dado que la carpeta NoExitDir no existe, no se mueve a ese directorio, es decir, falla, por ende se ejecuta el segundo comando y se crea el archivo, dado que ese fue exitoso el 3er comando no se ejecuto)
 > [nombre del archivo a crear] : (el simbolo de mayor que) crea un archivo, puedes colocarle extensión al archivo, 
