FROM node:10.15.1-alpine

# Update latest security patches
RUN apk update && apk upgrade

# RUN adduser webuser -
ARG APP_DIR=/app

# TODO: Create and user non-privileged user acccount
# USER webuser # su webuser

# Change working directory to application directory
WORKDIR ${APP_DIR}

# Copy package.json to /app directory
COPY package.json .

# Install node modules/dependencies
RUN npm install

# Copy application code 
COPY . .

# Expose this port on DOCKER NETWORK (NOT HOST MAPPING)
EXPOSE 3000

# Start the Express server
CMD ["node", "server.js"]