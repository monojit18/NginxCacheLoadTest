FROM node:10

# Environment varibales
ENV WORKDIR_PATH=/apiproxyapp/

# Create app directory
WORKDIR ${WORKDIR_PATH}

COPY package*.json ${WORKDIR_PATH}

RUN npm install --unsafe-perm

COPY . ${WORKDIR_PATH}

EXPOSE 7006

CMD npm start