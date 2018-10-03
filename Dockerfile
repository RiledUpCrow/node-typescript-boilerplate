# Build container
FROM node:10 as dev
WORKDIR /app
ENV NODE_ENV development

# Installing all dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Building the project
COPY src ./src
COPY tsconfig.json ./
RUN yarn build

# Nodemon configuration
COPY nodemon.json ./

# Application port
ENV PORT 8080
EXPOSE ${PORT}

# Debugging port
EXPOSE 5858



# Server container
FROM node:10
WORKDIR /app
ENV NODE_ENV production

# Installing production dependencies
COPY --from=dev /app/package.json /app/yarn.lock ./
RUN yarn install

# Preparing built code to run
COPY --from=dev /app/build ./build
ENV PORT 80
EXPOSE ${PORT}

CMD [ "node", "build/index.js" ]
