FROM node:19-bullseye as builder
WORKDIR /code/
ADD package.json .
RUN npm install -g gatsby-cli
RUN yarn
ADD . .
RUN npm run build

FROM devforth/spa-to-http:latest
COPY --from=builder /code/public/ .
EXPOSE 8080
