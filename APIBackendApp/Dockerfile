FROM node:10

# Environment varibales
ENV WORKDIR_PATH=/apibackendapp

# Create app directory
WORKDIR ${WORKDIR_PATH}

COPY package*.json ${WORKDIR_PATH}

RUN npm install --unsafe-perm

COPY . ${WORKDIR_PATH}

EXPOSE 7007

CMD npm start