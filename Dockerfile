FROM node:19-alpine

COPY . ./

WORKDIR /app

RUN npm install

EXPOSE 3000

CMD ["npm","start"]
