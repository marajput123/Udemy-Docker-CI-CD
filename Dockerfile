FROM node:16-alpine3.11 as Builder

WORKDIR "/app"

COPY ./package.json .
RUN npm install

COPY . .

RUN npm run build

# Stage 1 complete
# Stage 2 start

FROM nginx:1.21.1 as Serve

COPY --from=Builder /app/build /usr/share/nginx/html