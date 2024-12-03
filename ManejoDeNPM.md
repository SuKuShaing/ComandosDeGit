# Apuntes del Curso de NPM: Gestión de Paquetes y Dependencias en JavaScript

### Instalar cosas 
`$ npm install {nombre del paquete}`


### Instalar cosas solo para el desarrollo
ambas opciones son validas, solo que la segunda es la versión abraviada
`$ npm install {nombre del paquete}  --save-dev`
`$ npm install {nombre del paquete}  -D`
Sí no se le coloca ningun flag (todas las cosas que llevan un guión antes) queda como dependencia de producción tambien.
Las dependencias de desarrollo son aquellos paquetes que necesitamos en un proyecto mientras estamos desarrollándolo, pero una vez tenemos el código generado del proyecto, no vuelven a hacer falta


### Instalar una dependencia que si o si va a ser ocupada en producción
`$ npm install {nombre del paquete}  --save`
`$ npm install {nombre del paquete}  -S`
`$ npm install {nombre del paquete}` Esta es la primera manera y sí, será llevada a producción

En el archivo package.json se crean objetos que contienen las dependencias diciendo el ambiente en el que se ejecutarán, las puedes cambiar de posición a mano y se modifica
```json
"dependencies": {
    "moment": "^2.30.1",
    "react": "^18.3.1"
  },
  "devDependencies": {
    "eslint": "^9.15.0"
  }
```


### Instalar paquetes de manera global
`$ npm install -g cowsay`

`npm list` para listar los paquetes instalados en este proyecto
`npm list -g` para listar los paquetes instalados de manera global
`npm list -g --depth 0` comando que nos permite identificar las dependencias globales instaladas en nuestro sistema


### Instalar dependencias de manera opcional
`$ npm install eslint -O`
`$ npm install --save-optional eslint`
Al ejecutar el comando sí está global, pasa a opcional
las dependencias opcionales son dependencias que no provocarán una falla durante la instalación de una aplicación o proyecto, ya que npm simplemente las ignora si fallan, por lo que el proyecto debe ser capaz de funcionar sin ellas, bien lo dice su nombre, son opcionales.


### Probar previamente dependencias para evitar tener problemas 
`$ npm install react-dom --dry-run`
No la instalará solo verá sí no tiene problemas con otras librerías, sí los tiene, te dirá, sí no saldrá todo normal en la consola.
Sí todo está bien puedes instalarlos


### Instalar una versión en particular
`$ npm install json-server@0.15.0`
Te instalará esa versión de del paquete


### Instalar la versión más reciente de un paquete
`$ npm install json-server@latest`
Instalará la versión más reciente de un paquete, sí tienes una versión antigua, al actualizará


### Instalar dependencias de un proyecto que clone
`$ npm install`
Leerá el package.json e instalará las dependencias tanto las de producción (las normales) como las de desarrollo


### Colocar scripts
Los scripts deben colocar dentro del package.json en el apartado Script
```json
"scripts": {
  "test": "echo \"Error: no test specified\" && exit 1",
  "start": "node ./src/index.js"
}
```

### Ejecutar paquetes
npx es el comando para ejecutar cosas
`npx create-react-app nombre_proyecto`
descargará las dependencias y creará el proyecto de react


### Ver estado de actualización de los paquetes 
Estando en la carpeta donde esté el proyecto, al ejecutar
`npm outdate`
te mostrará tus paquetes con la versión actual y la última versión disponible
y puedes actualizar con `npm install paquete@latest`


### Auditoria de dependencias
![Vulnebilidades](https://static.platzi.com/media/user_upload/1-d5d0a316-ac94-4d18-915f-2782ddffe671.jpg)
```bash
39 vulnerabilities (2 low, 7 moderate, 24 high, 6 critical)
```
Para hacer una auditoria de las vulnerabilidades se puede hacer
`npm audit`
te mostrará cada una de las librerías con problemas, ahora con el siguiente comando
`npm audit --json`
puedes pasarlo a json para sacarlo como archivo,
ahora puedes actualizar hartas librerías con
`npm audit fix`
y te muestra lo que queda por reparar
```sh
16 vulnerabilities (1 low, 2 moderate, 12 high, 1 critical)
```
Ahora con --force puede actualizar todos los paquetes y hacer que instale los paquetes por debajo que requieren los paquetes actuales
`npm audit fix --force`
y te muestra lo que queda por reparar
```sh
14 vulnerabilities (1 low, 2 moderate, 11 high)
```
despues de eso hay que instalar las últimas versiónes de los paquetes que esten causando problemas
`npm install paquete@latest`
y con 
`npm audit`
ver cuantas vulnerabilidades quedan
```sh
found 0 vulnerabilities
```


### Desinstalar dependencias
`npm uninstall nombre-del-paquete` con este comando podemos desistalar dependencia.
La otra manera es ir al package.json, ir a la lista de dependencias y borrar la dependencia, despues de eso hay que limpiar el proyecto (eliminar todas las dependencia y luego instalar de nuevo las dependencia vigentes o que no hemos sacado)
`rm -rf node_modules/` esto elimina la carpeta node_modules, al borrarla, borras las dependencias
despues hay que instalarlas de nuevo con `npm install`
```json
"dependencies": {
    "react-dom": "^18.3.1",
    "style-loader": "3.2.1",
  },
  "devDependencies": {
    "eslint": "7.32.0",
    "husky": "7.0.1", <-- Al eliminar esta
    "lint-staged": "11.1.2",
    "prettier": "2.3.2"
  },
  "husky": { <-- Puedes sacar ésta, que es la configuración de eso que eliminamos
    "hooks": {
      "pre-commit": "lint-staged"
    }
  },
  "lint-staged": {
    "*.{js,jsx}": [
      "npm run format",
      "npm run lint",
      "git add"
    ]
  }
```


### Instalación limpia
`npm ci` mira el package.json e instala todas las dependencias que ahí se encuentran, en caso de existir una carpeta node_modules, la borra e instala todo, este comando no escribe sobre package.json, está pensado para entornos automatizados


### Package.json
El archivo package.json gestiona las dependencias tanto de producción cmo de desarrollo, contiene los metadatos del proyecto
Además los scrips, configuraciones de las dependencias y reproducibilidad para que en donde se instale funcione con las mismas dependencias


### package-lock.json
Es un archivo generado automáticamente por npm que sirve para asegurar la consistencia y reproducibilidad de las instalaciones de dependencias.
Registra la versión exacta, reproducibiilidad, rendimiento, serguridad, almacena un hash para que sepas que la versión de la dependencia que ocupas es la real y permite ver y configurar la interdependencia de las librerías



## Crear un paquete
### npm link
Para crear enlaces simbólicos entre paquetes de Node.js, facilitando el desarrollo local de paquetes
con `$ npm link`, despues de eso no hay que hacer nada


### Probar el paquete
Hay que instar nuestro paquete en nuestro sistema, primero copiar el pwd con la ruta del paquete
despues hacer `$ npm install -g <ruta copiada>`
Despue de eso solo hay que ejecutar el paquete escribiendo el nombre del paquete en la consola
- El paquete debiese funcionar como lo programamos


### Iniciar sesión de npm en cli
En la consola colocar `npm adduser`, te pedirá el usuario, contraseña, mail de npm y una 2da clave temporal

OJO: en caso de no funcionar por que pide pide que abras la web, pero al estar en WSL no te deja abrir el navegador
hacer esto

> Quizá algunos que desarrollamos este curso usando WSL tuvimos este problema. Aquí la solución.Espero ahorrarles las horas que me costó saber como se arreglaba.
> ![](https://static.platzi.com/media/user_upload/error12-e1c87734-2e55-40f8-802d-42e782316c5a.jpg)
> Lo que deben hacer es instalar una versión más antigua de Node. Recomiendo en particular la versión 16.20.0 que es LTS (esa me funcionó a mí)
> `$ nvm install 16.20.0`
> y luego la seleccionan como default con:
> `$ nvm alias default 16.20.0`
> Luego de esto podrán correr de nuevo el `$ npm adduser` y todo funcionará perfectamente


### Publicar el paquete en npm
Despues de todos los pasos listos, el paquete creado e iniciado sesión en la consola, y estando en la carpeta del paquete, usar `npm publish` 
con eso el paquete se subirá a los repositorio publicos de npm


### Actualizar el paquete y cambiar la versión
Para eso debemos hacer las modificaciones a nuestro código y/o readme y despues eso subir a github
luego ejecutar `npm version 1.1.0` para modificar la versión

> El primer número en la versión, es un cambio mayor, un cambio significativo funcionamiento del paquete
> El 2do número en la versión, es un cambio menor, se añadió algo que no modifica en gran medida el paquete
> El 3er número es la versión, es el parche, es exclusivamente para cuando uno repara cosas

y despues nuevamente se ejecuta `npm publish` para publicar los cambios a npm
ojo, ya hay que estar logeado, sino hay que hacer los pasos de inicio de sesión en npm mediante la consola