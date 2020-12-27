FROM node:alpine

WORKDIR /usr/src/api

COPY packge*.json ./
RUN npm install

COPY . .
EXPOSE 3000

CMD ["npm", "start"]