# Al proyecto que se hace referencia es este https://github.com/platzi/docker
# Este es un ejemplo de dockerfile
# Este archivo sirve para crear un contenedor listo para lanzar

FROM node:12
# Siempre va un From
# instalamos Node

COPY [".", "/usr/src/"]
# "." el lugar donde estoy parado, va a copiar todo lo que está en el directorio, y lo copia a la ruta "/usr/src/"

WORKDIR /usr/src
# Especificamos un directorio de trabajo, es decir le build se moverá a esta ruta "/usr/src"

RUN npm install
# Estando en el directorio anterior, ejecutamos eso

EXPOSE 3000
# Permite acceder a ese contendor con ese puerto

CMD ["node", "index.js"]
# proceso por defecto que ejecutará al correr este contenedor, a menos que especifiquemos otra cosa
# CMD node index.js # se puede escribir así tambíen pero se recomienda la primera que está habilitada



############### actualización ###############

FROM node:14
# instalamos Node

COPY ["package.json", "package-lock.json", "/usr/src/"]
# copia esos dos archivos desde le lugar donde estoy parado, y lo copia a la ruta "/usr/src/"

WORKDIR /usr/src
# Especificamos un directorio de trabajo, es decir le build se moverá a esta ruta "/usr/src"

RUN npm install
# Estando en el directorio anterior, ejecutamos eso

COPY [".", "/usr/src/"]
# "." el lugar donde estoy parado, va a copiar todo lo que está en el directorio, y lo copia a la ruta "/usr/src/" | sí ya hay archivos previamente cargados de la misma ruta, los compara y si son iguales no los carga, sino son iguales, los sobre escribe

EXPOSE 3000
# Permite acceder a ese contendor con ese puerto

CMD ["npx", "nodemon", "-L", "index.js"]
# CMD ["npx", "nodemon", "index.js"], en linux y mac, debiese funcionar sin la -L, en windows la necesita
# proceso por defecto que ejecutará al correr este contenedor, a menos que especifiquemos otra cosa
# CMD node index.js # se puede escribir así tambíen pero se recomienda la primera que está habilitada


# ##################### Otro archivo Dockerfile ####################

FROM ubuntu:trusty
COPY ["loop.sh", "/"]
CMD /loop.sh
# Se debe escribir así 
# CMD ["/loop.sh"]
# Así quedará en el proceso principal y se podrá cerrar bien


# ##################### Otro archivo Dockerfile ####################


FROM node:14
# instalamos Node

COPY ["package.json", "package-lock.json", "/usr/src/"]
# copia esos dos archivos desde le lugar donde estoy parado, y lo copia a la ruta "/usr/src/"

WORKDIR /usr/src
# Especificamos un directorio de trabajo, es decir le build se moverá a esta ruta "/usr/src"

RUN npm install
# Estando en el directorio anterior, ejecutamos eso

COPY [".", "/usr/src/"]
# "." el lugar donde estoy parado, va a copiar todo lo que está en el directorio, y lo copia a la ruta "/usr/src/" | sí ya hay archivos previamente cargados de la misma ruta, los compara y si son iguales no los carga, sino son iguales, los sobre escribe

EXPOSE 3000
# Permite acceder a ese contendor con ese puerto

# CMD ["npx", "nodemon", "-L", "index.js"]
CMD ["node", "index.js"]
# CMD ["npx", "nodemon", "index.js"], en linux y mac, debiese funcionar sin la -L, en windows la necesita
# proceso por defecto que ejecutará al correr este contenedor, a menos que especifiquemos otra cosa
# CMD node index.js # se puede escribir así tambíen pero se recomienda la primera que está habilitada
