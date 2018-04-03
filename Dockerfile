FROM node:carbon

WORKDIR /usr/src/app
COPY package.json ./
RUN npm install 
COPY . .
RUN rm config/config.json >/dev/null 2>&1 || true
RUN mv config/config-docker.json config/config.json
RUN cat config/config.json
RUN npm run compile

CMD [ "./bin/genieacs-cwmp"]
