# FROM node:alpine as Builder

# WORKDIR "/app"

# COPY ./package.json .
# RUN npm install

# COPY . .

# RUN npm run build

# # Stage 1 complete
# # Stage 2 start

# FROM nginx
# EXPOSE 80
# COPY --from=Builder /app/build /usr/share/nginx/html
FROM node:alpine

WORKDIR /opt/ng
COPY package.json package-lock.json ./
RUN npm install

ENV PATH="./node_modules/.bin:$PATH"

COPY . ./
RUN ng build --prod

FROM nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=0 /opt/ng/dist/angular-universal-app/browser /usr/share/nginx/html