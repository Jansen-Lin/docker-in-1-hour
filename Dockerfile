# We are saying, build this image from the base image
# In this case, you can go search for `node` in docker hub,
# we see that we have an image which has node and npm installed inside
FROM node:19-alpine

# Copy package.json, wildcard used so both package.json AND package-lock.json are copied
# slash '/' at the end of app is important, so it created an app directory, otherwise you'll get an error
COPY package*.json /usr/app/

# Copy app files from src directory
COPY src /usr/app/

# Create app directory & set default dir so that next commands executes in /usr/app dir, liked cd-ing into /usr/app to execute npm install
WORKDIR /usr/app

# Install app dependencies
# inside the container, before the appl gets started.
RUN npm install

# Start the application
CMD ["node", "server.js"]