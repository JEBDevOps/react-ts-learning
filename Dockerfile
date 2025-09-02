# Dockerfile

# Build stage
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Serve stage
FROM caddy:2-alpine
WORKDIR /usr/share/caddy
COPY --from=build /app/dist .
