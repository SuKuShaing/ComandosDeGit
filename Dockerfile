# Este es un ejemplo de dockerfile

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