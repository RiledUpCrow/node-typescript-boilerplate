# Build container
FROM node:10.15 as dev
ENV NODE_ENV development \
    PORT 8080
WORKDIR /app

# Installing all dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Building the project
COPY tsconfig.json nodemon.json tslint.json .prettierrc.json ./
COPY src ./src
RUN npm run build


# Server container
FROM node:10.15
WORKDIR /app
ENV NODE_ENV production \
    PORT 80

# Installing production dependencies
COPY --from=dev /app/package.json /app/package-lock.json ./
RUN npm install

# Preparing built code to run
COPY --from=dev /app/build ./build

# Application port
EXPOSE ${PORT}

CMD [ "node", "build/index.js" ]
