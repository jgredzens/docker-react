# Phase1: builder step
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Folder with contents will be built in "./app/build"

# Phase2: run step
FROM nginx
# Specify from where to copy to where, using previous step.
COPY --from=builder /app/build /usr/share/ngnix/html