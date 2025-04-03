# Use Node.js base image
FROM node:18

# Set working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy app source
COPY . .

# Expose the port used by the app
EXPOSE 8080

# Start the app
CMD ["npm", "start"]
