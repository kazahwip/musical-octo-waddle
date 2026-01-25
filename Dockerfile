FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
# Use npm install to avoid strict lockfile errors in CI builds.
RUN npm install --omit=dev --no-audit --no-fund

COPY . .

ENV NODE_ENV=production

# Ensure writable runtime dirs for sessions/logs/data.
RUN mkdir -p sessions donor sursmarketa/templates2 \
  && chown -R node:node /app

USER node

CMD ["node", "start.js"]
