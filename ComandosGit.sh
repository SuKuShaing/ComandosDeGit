#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::: Comandos más frecuentemente usados para git y github :::::::::::::::::
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

### Inicialización
git init                        # Inicializa un nuevo repositorio de Git en la carpeta actual
git Clone <repo-url>            # Clona un repositorio remoto en la carpeta actual

### Desarrollo diario
git add <archivo>               # Agrega un archivo específico al área de preparación (staging area)
git add .                       # Agrega todos los archivos y carpetas al área de preparación
git commit -m "Mensaje"         # Realiza un commit de los cambios con un mensaje descriptivo
git commit -am "Mensaje"        # es como git add + git commit, pero solo funciona si el archivo ya fue agregado (ya está siendo trackeado) al repositorio antes
git status                      # Muestra el estado de los cambios en el repositorio
git log                         # Muestra el historial de commits

### Gestión de ramas
git branch                      # Muestra las ramas locales en el repositorio
git branch -a                   # Muestra todas las ramas, tanto locales como remotas
git branch <nombre-rama>        # Crea una nueva rama con el nombre especificado
git branch -d <nombre-rama>     # Elimina la rama especificada
git checkout <nombre-rama>      # Cambia a la rama especificada (puede recuperar archivos de una rama)
git checkout -b <nombre-rama>   # Crea y cambia a una nueva rama
git merge <nombre-rama>         # Fusiona la rama especificada en la rama actual

### Integración y colaboración
git push <repo> <rama>          # Envía los cambios de la rama local al repositorio remoto
git pull <repo> <rama>          # Trae los cambios del repositorio remoto a la rama local
git remote -v                   # Muestra los repositorios remotos configurados
git remote add <repo> <url>     # Agrega un repositorio remoto, <url> es la url del repositorio remoto, <repo> es el nombre que le das al remoto, origin es el tuyo, upstream es el de otra persona a que hiciste un fork
git remote remove origin        # para remover el origen anterior, por ejemplo cuando clono desde otro repositorio, una vez removido origen queda libre para poder subirlo a tu propio repo

### Recuperación y limpieza
git fetch                       # Descarga los cambios del repositorio remoto sin fusionarlos
git reset --hard <commit>       # Restablece el repositorio al commit especificado, eliminando todos los commit posteriores, los cambio eliminados se pueden recuperar con git reflog
git reset --hard HEAD           # Restablece el repositorio al último commit, eliminando todos los cambios no confirmados en el área de trabajo
git revert <hash-commit>        # Crea un nuevo commit que deshace los cambios realizados en el commit especificado

### Avazados y utilidades
git diff <a> <b>                                # Muestra las diferencias entre dos commits, ramas o archivos, <a> y <b> pueden ser hashes de commit, nombres de ramas o archivos
git show <hash-commit>                          # Muestra información detallada sobre un commit específico
git blame <archivo>                             # Muestra quién hizo cada cambio en un archivo específico
git stash                                       # Guarda los cambios no confirmados en un stash temporal y limpia el working tree
git stash pop                                   # Aplica los cambios guardados en el stash y los elimina del stash
git cherry-pick <hash-commit>                   # Aplica un commit específico a la rama actual
git rebase <rama>                               # Reaplica los commits de la rama actual sobre la rama especificada
git tag -a <nombre-tag> -m "Mensaje" 7N°Hash    # Crea una etiqueta (tag) anotada con un mensaje



#:::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::Comandos para usar Git local:::::::::::::::::
#:::::::::::::::::::::::::::::::::::::::::::::::::::::
git add archivo                                                     # para agregar un archivo específico al área de preparación (staging area)
git add . (para agregar todo lo que hay en la carpeta)              # para agregar el archivo o para agregar todos los archivos
git blame -c nombre-del-archivo                                     # te muestra lo mismo de arriba pero con más registros
git blame css/style.css -L35,56                                     # te muestra quien hizo los cambios en ese archivo desde la linea 35 a la 56
git blame css/style.css -L35,56 -c                                  # te muestra lo mismo de arriba con más formato en el historial
git blame --help                                                    # --help te muestra el manual de como usar un comando
git blame nombre-del-archivo                                        # te muestra quien creo cada linea del archivo
git branch                                                          # Vemos las ramas y la que esta en verde, es en la que estoy
git branch -a                                                       # para ver todas las ramas, locales y remotas
git branch -D rama-a-borrar                                         # para borrar una rama 
git branch -M main                                                  # Trae la rama master (o la rama en la que estés) a main (a la rama objetivo) y esa pasa a ser la principal, trae a ella todo le historial
git branch nombre-de-la-rama                                        # con esto creo la rama, con "git show" puedo ver que HEAD esta apuntando a master y a la rama
git branch -r                                                       # para ver las ramas remotas
git checkout aquí-va-el-número-de-la-version archivo.ext            # para ver como era ese archivo (siempre colocar el archivo.ext porque o si no vuelve todos los archivos atrás) (puede borrar los que no existían)
git checkout aquí-va-el-número-de-la-version archivo.ext            # trae un archivo como rama, uno lo puede editar y después enviar a la linea master
git checkout master archivo.ext                                     # para enviar el archivo editado como rama a la linea master
git checkout master archivo.ext                                     # para volver a la ultima version que estaba en stagin (cuando se envía con add)
git checkout -- .                                                   # sí, son dos guiones y un punto, de esa forma volvemos todos los archivos al estado del último commit de la rama en la que nos encontramos 
git checkout nombre-de-la-rama                                      # nos movimos de MASTER a la BRACNH (a la rama)
git checkout -b nombre-de-la-rama                                   # este comando agrupa dos comandos de git y los hace en uno solo, el primero git branch nombre-rama-a-crear (para crear la rama) y el segundo git checkout nombre-de-la-rama-creada-recien (para movernos a esa rama), al final quedamos posicionados en la rama nueva
git switch <nombre-rama>                                            # Cambia a la rama especificada (solo para mover entre ramas)
git cherry-pick hash-de-la-rama-a-traer                             # Para traer un commit de una rama, y coloco el hash del commit, ese se obtiene con "git log --oneline"
git clean --dry-run                                                 # Es para ver que archivos puede borrar, son los que no están siendo trackeados
git clean -f                                                        # borrar los archivos que mostró que iba a borrar en el comando "git clean --dry-run"
git commit -am "mensaje del commit"                                 # "-a" reemplaza al paso de "git add archivo.ext" entonces te ahorras un paso, el detalle esta que solo sirve si ya hiciste una vez un "git add" antes a ese archivo, es decir ya estaba siendo rastreado
git commit --amend                                                  # para añadir cambios al commit anterior, antes de eso se debe añadir con "git add ruta-del-archivo" a añadir su modificación (este comando es importante hacerlo, previo al amend) | una vez ejecutado el git add y commit --amend se abrirá una terminal vim, para editar el mensaje del commit, puedes editarlo si quieres, para salir de ahí se ocupa " :q " y con eso vuelves a la terminar normal
git commit -m "Aquí va un comentarios de los cambios realizados"    # para enviar los comentarios al historia, sino colocas el -m, te lo va a pedir con VIM y lo agregas, para salir es Esc + Shift + Z + Z
git config                                                          # Para ver todas las opciones disponibles a usar en git config
git config --global alias.stats "shortlog -sn --all --no-merges"    # creo un atajo, un alias para todo ese código y el atajo se llama "stats", para ese comando
git config --global user.email "sebastian.sanhueza.t@usach.cl"      # para agregar el mail de usuario
git config --global user.name "Seba Sanhueza"                       # para agregar el nombre de usuario
git config -l                                                       # para ver todas las configuraciones incluido el usuario
git config --list                                                   # te muestra la lista de configuraciones que se pueden hacer a git
git config --list --show-origin                                     # te muestra donde están los archivos de configuraciones de git
git diff                                                            # Para ver los cambios entre un commit y otro en los archivos que estés trabajando
git diff número-de-la-version número-de-la-otra-version-a-comparar  # para ver los cambios entre versiones
git grep -c "<p>"                                                   # Cuando tienes espacios o símbolos debes usar comillas para buscar lo deseado
git grep -c palabra-a-buscar                                        # te dice cuantas veces ocupaste esa palabra en cada archivo 
git grep -n palabra-a-buscar                                        # te dice en que número de linea esta la palabra color
git grep palabra-a-buscar                                           # busca la palabra indicada en todos los archivos que git trackeados
git init                                                            # para iniciar git y va a empezar a guardar los cambios
git log --all --graph                                               # para ver las ramas del proyecto de manera gráfica
git log --all --graph --decorate --oneline                          # para ver todo comprimido
git log archivo                                                     # para ver el historial del archivo
git log archivo.ext                                                 # Para ver el historia de cambios y sus comentarios, junto con el número
git log --oneline                                                   # para ver todos los commit, cada uno en una linea
git log -S palabra-a-buscar                                         # este comando busca la palabra en los commits
git log --stat (archivo.ext(opcional))                              # para ver el historial de cambios con sus commit y su cantidad de cambios binarios, es más completo 
git merge nombre-de-la-rama                                         # con el checkout nos movimos a master "git checkout master" y desde ahí ejecutamos este comando y traemos la rama y hacemos la fusión
git reflog                                                          # para ver toda la historia de movimientos y comandos, no solo los commit como con git log, todo, cuando cambiaste de rama, cuando borraste, cuando hiciste un amend, etc.
git reset número-de-la-version-a-la-que-se-desea-volver --hard      # para volver a una version anterior | --hard (vuelve a la version anterior y se pierde todo lo avanzado) --soft (lo que esta en stagin (en git add .) sigue ahí)
git reset --hard hash                                               # se coloca el hash al que se quiere volver, con este comando se vuelve a donde las cosas funcionaban
git reset --hard                                                    # Borra todo. Todo todito, absolutamente todo. Toda la información de los commits y del área de staging se borra del historial.
git reset HEAD                                                      # Este es el comando para sacar archivos del área de Staging (ya no funciona). No para borrarlos ni nada de eso, solo para que los últimos cambios de estos archivos no se envíen al último commit, es como para anular un git add, a menos que cambiemos de opinión y los incluyamos de nuevo en staging con git add, por supuesto.
git reset HEAD@{4}                                                  # Hace un reset suave, vuelve pero te mantiene el staging, se selecciona el HEAD@{4} que quieras del comando git reflog
git reset --soft                                                    # Borramos todo el historial y los registros de Git pero guardamos los cambios que tengamos en Staging, así podemos aplicar las últimas actualizaciones a un nuevo commit.
git rm                                                              # saca al archivo del cache y no va a detectar si hubo cambios en el archivo, aún no lo remueve de estar guardando cambios en git
git rm --cached historia.txt                                        # Saca el archivo de git y guardará mas cambios en el árbol de git
git rm --cached nombre-del-archivo                                  # Elimina los archivos del área de Staging y del próximo commit pero los mantiene en nuestro disco duro.
git rm --cached . -r                                                # Este es el comando para sacar todos los archivos del área de Staging,
git rm --force                                                      # Elimina los archivos de Git y del disco duro. Git siempre guarda todo, por lo que podemos acceder al registro de la existencia de los archivos, de modo que podremos recuperarlos si es necesario (pero debemos usar comandos más avanzados).
git shortlog                                                        # muestra un log por persona y que ha hecho cada miembro del equipo
git shortlog -sn                                                    # Muestra las personas y sus cantidades de commit, solo las cantidades, no sus códigos
git shortlog -sn --all                                              # te incluye todo los commit, incluso los borrados
git shortlog -sn --all --no-merges                                  # te muestra la cantidad de commit que no fueron merges
git show archivo.ext                                                # muestra los cambios realizados de la ultima version con la anterior
git stash                                                           # guarda los cambios realizados en un stash, no como commit, al ser guardado, vuelve al estado del ultimo commit
git stash branch nueva-rama                                         # me llevo los cambios en el stash a la rama que voy, nueva o existente
git stash drop                                                      # para soltar el stash sin que se coloque en ninguna parte, lo desecha
git stash list                                                      # para ver los stash guardados en stash
git stash pop                                                       # para abrir los cambios guardados en stash
git stats                                                           # es como se usa el alias creado con la linea de arriba de esta
git status                                                          # para ver el estado de un archivo o carpeta en seguimiento, sí se envió o no al repositorio de cambios git
git status --all                                                    # para ver todo el historial, incluyendo las ramas
gitk                                                                # te abre las ramas en un software visual



#::::::::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::Comandos para usar con GitHub:::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::::::::

git clone url-del-repositorio-en-github                             # para clonar un proyecto publico, SI YA CREASTE EL REPOSITORIO TUYO USA ESTO PARA LLEVARLO A TU ENTORNO LOCAL Y QUEDAN CONECTADOS PARA ENVIAR Y RECIBIR
git pull                                                            # para traer todas las ramas y todas las actualizaciones de todas las ramas a mi entorno local, las ramas remotas serán visibles y estarán actualizadas, pero aparecerán como remotas, con git checkout las puedes visitar y ahí pasarán a estar como rama local
git pull origin main                                                # para traer lo que esta el servidor, incluyendo las actualizaciones, de la rama origin (la principal en github) a master (la principal acá)
git pull origin main --allow-unrelated-histories                    # para fusionar la historia de mi git a la historia de github ¡¡¡ESTE ES EL COMANDO PARA FUSIONAR LA HISTORIA CUANDO NO CONECTA TU REPOSITORIO LOCAL CON EL DE GITHUB!!!
git pull origin master --allow-unrelated-histories                  # para fusionar la historia de mi github a la de mi git, para cuando no se quieren fusionar, hay que forzarlo
git push origin :refs/tags/nombre-del-tag-a-borrar                  # con esto borra el tag en el repositorio remoto, en el github
git push origin main                                                # para enviar mi repositorio main a origin | aquí pide tu mail usuario y tu contraseña, después pide la llave ssh y ahí colocas el usuario "SuKuShaing" y nuevamente la clave
git push origin --tags                                              # para enviar los tags, siempre hacer antes el git git pull origin master
git rebase master                                                   # Estando en la rama "experimento" o en la rama a hacer rebase, se ejecuta este comando, trayendo toda la info de master a acá y después de eso, te cambias de rama, a la principal y se hace el rebase (estando en master) a la rama experimento o a la rama que se va a unir
git remote                                                          # para ver a donde lo estoy enviando, va a responder "origin"
git remote remove origin                                            # para remover el origen anterior, por ejemplo cuando clono desde otro repositorio, una vez removido origen queda libre para poder subirlo a tu propio repo
git remote add origin https://github.com/SuKuShaing/Hyperblog.git   # para enviar mi git a github, a un origin y ese link lo da github en su esquina https
git remote add upstream url-del-repositorio-en-github               # para agregar una nueva fuente de dato y sale 2 veces lo de arriba pero con distintas fuentes, una mia y otra de otra persona con el mismo proyecto
git remote set-url origin url-de-la-ssh-de-git-hub                  # esto es para cambiar la URL de conexión con el repositorio
git remote -v                                                       # responde origin https://github.com/SuKuShaing/Hyperblog.git (fetch) {fetch es como "traer"} <br> origin https://github.com/SuKuShaing/Hyperblog.git (push) {empujar}
git show-branch                                                     # Nos muestras las ramas que existen y cual ha sido su historia
git show-branch --all                                               # Nos muestra lo mismo que lo de arriba con más detalle
git show-ref --tags                                                 # te muestra el tag y el hash del commit
git tag                                                             # te muestra las etiqueta que hay
git tag -a <nombre-tag> -m "Mensaje" 7N°Hash                        # Crea una etiqueta (tag) anotada con un mensaje
git tag -a v0.1 -m "result primeras clases del curso" 902bc21       # añade un tag a una versión de todo tu historial de versiones, "-a" añadir, después va el nombre "v0.1", -m para colocar el mensaje de a continuación, el mensaje, y el hash de la versión (¿de dónde saco el hash? ese número, del git log, cada commit tiene su número hash, se copia y se pega)
git tag -d nombre-del-tag                                           # borra ese tag (borra esa etiqueta) de manera local



#:::::::::::::::::::::::::::::::::::::::::
#::::::::Crear llaves ssh:::::::::::::::::
#:::::::::::::::::::::::::::::::::::::::::
#Ordenados según el orden en que deben ser usados ↓

ssh-keygen -t rsa -b 4096 -C "mail-usado-en-github" # Para generar una llave publica-privada, "-t" es para elegir el algoritmo, "rsa" es el algoritmo de generación, "-b" para elegir la complejidad, "4096" es la cantidad de dígitos de nuestra llave numérica, "-C" tiene que ser en mayúscula, y nuestro email (sin comillas) de github (si es que nos vamos a conectar con ese servicio)
                                                    # Debe ser creada esta llave en tu carpeta local personal, verificas que es correcto donde se esta guardando, dando Enter, y después puedes crear una contraseña para acceder de nuevo (no es obligatoria), yo doy Enter, varios enter después y listo
eval $(ssh-agent -s)                                # comando para hacer correr un verificador de llaves publicas y privadas, "pid" process id, para que el pc identifique el proceso
                                                    # El número que arroja es distinto en cada persona
                                                    # ~ es una varible de /c/Users/Seba-PC, ~ es una ruta
ssh-add ~/.ssh/id_rsa                               # para decirle al pc que ahí esta la llave y agregarla
                                                    #Felicidades, ya esta creada la llave



#:::::::::::::::::::::::::::::::::::::::::
#::::::::Enlarze con github:::::::::::::::
#:::::::::::::::::::::::::::::::::::::::::
# ir a usuario/.ssh/id_rsa.pub y copiar su contenido (sí no está, debes crear la llave ssh)
# Vas a "settings" en tu cuenta de "github", después ir a "SSH keys", botón "nueva key", colocar el nombre de tu pc (para identificar el equipo, puesto que cada pc que ocupes debe tener su archivo) y pegar el contenido copiado, colocarle un nombre
# Después de eso estas listo, crea tu repositorio y enlaza tu proyecto



#::::::::::::::::::::::::::::::::::::::::::::::::
#::::::::para crear el gitignore:::::::::::::::::
#::::::::::::::::::::::::::::::::::::::::::::::::
nano .gitignore # al entrar al editor nano escribes los archivos o carpetas a ignorar, como se muestra en las siguientes 2 lineas y se sale así -> (se sale de aquí presionando ctrl + x)
*.dat
results/