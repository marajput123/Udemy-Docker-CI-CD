FROM node:16-alpine3.11

WORKDIR "/app"

COPY ./package.json .
RUN npm install

COPY . .

RUN npm run build

# Stage 1 complete
# Stage 2 start

FROM nginx:1.21.1
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
