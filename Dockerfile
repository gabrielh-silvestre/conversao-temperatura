FROM node:16-alpine AS builder

WORKDIR /app

COPY src/package*.json ./

RUN npm install


FROM node:16-alpine AS runner

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules

COPY src/ .

EXPOSE 8080

CMD ["node", "server.js"]
