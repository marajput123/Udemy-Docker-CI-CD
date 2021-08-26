FROM node:alpine as builder

WORKDIR "/app"

COPY ./package.json .
RUN npm install

COPY . .

RUN npm run build

# Stage 1 complete
# Stage 2 start

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
