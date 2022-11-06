FROM node:16-alpine AS appBuild

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package.json ./
COPY tsconfig.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# copy app source
COPY ./src ./src/

# build app
RUN npm run compile


FROM node:16-alpine

# Create app directory
WORKDIR /app
COPY package.json ./
RUN npm install

# copy app build to app directory
COPY --from=appBuild ./out .

EXPOSE 8080

CMD [ "node", "index.js" ]
