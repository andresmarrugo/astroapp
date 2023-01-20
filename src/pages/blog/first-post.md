---
layout: "../../layouts/BlogPost.astro"
title: "Containerizando una aplicación Next JS y desplegándola en Azure"
description: "¿Quieres saber cómo containerizar una aplicación Next JS y desplegarla en un contenedor en Azure? En este tutorial práctico paso a paso, te mostraré cómo hacerlo de manera sencilla y eficiente."
pubDate: "Jan 19 2023"
heroImage: "/placeholder-hero.jpg"
---
¿Quieres saber cómo containerizar una aplicación Next JS y desplegarla en un contenedor en Azure? En este tutorial práctico paso a paso, te mostraré cómo hacerlo de manera sencilla y eficiente.

![containerizando-next-js](https://miro.medium.com/max/700/1*ZF-lQ2B7lhYHlI-7UhDq3g.png)

*Nota: Es importante mencionar que NextJs también puede ser desplegado con muchas ventajas usando Vercel, pero el objetivo de este tutorial es mostrar que las aplicaciones de Next también se pueden desplegar usando contenedores, lo cual puede ser útil en ciertas situaciones o para ciertas necesidades específicas.*

## Pasos

1. Crea una nueva aplicación Next JS utilizando el comando `npx create-next-app`.

2. Crea un archivo `Dockerfile` en la raíz de tu proyecto.

3. Agrega las siguientes líneas en el archivo `Dockerfile`:

```
FROM node:14-alpine

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm ci

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]
```

4. Crea una cuenta en Azure y habilita el servicio de contenedores.

5. Utiliza el comando `az acr login` para iniciar sesión en tu cuenta de Azure.

6. Construye tu imagen de Docker utilizando el comando `docker build -t <nombre_de_tu_imagen> .`

7. Etiqueta tu imagen con el nombre del registro de contenedor de Azure utilizando el comando `docker tag <nombre_de_tu_imagen> <nombre_del_registro_de_contenedor>.azurecr.io/<nombre_de_tu_imagen>`

8. Sube la imagen al registro de contenedor de Azure utilizando el comando `docker push <nombre_del_registro_de_contenedor>.azurecr.io/<nombre_de_tu_imagen>`

9. Utiliza el comando `az container create` para crear un contenedor en Azure y desplegar tu aplicación.

¡Listo! Ahora tu aplicación Next JS está containerizada y desplegada en un contenedor en Azure. Puedes verificar el estado de tu contenedor y acceder a tu aplicación utilizando el comando `az container show -n  <nombre_de_tu_contenedor>`.

Espero que este tutorial haya sido útil para ti. Si tienes alguna pregunta o sugerencia, no dudes en dejar un comentario.