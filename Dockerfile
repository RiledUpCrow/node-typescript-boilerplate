# Build container
FROM node:10 as build
WORKDIR /usr/src/app

# Installing all dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Building the project
COPY src ./src
COPY tsconfig.json ./
RUN yarn build

# Server container
FROM node:10
WORKDIR /usr/src/app

# Installing production dependencies
COPY --from=build /usr/src/app/package.json /usr/src/app/yarn.lock ./
RUN yarn install --production

# Preparing built code to run
COPY --from=build /usr/src/app/build ./build
ENV PORT 80
EXPOSE ${PORT}

CMD [ "node", "build/index.js" ]
