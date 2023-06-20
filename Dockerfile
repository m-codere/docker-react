# 1. BUILD PHASE
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# This phase will produce a build (production files) in /app/build

# 2. RUN PHASE
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# (nginx image contains the default start command to run nginx)
