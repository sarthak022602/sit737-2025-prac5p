# Use Node.js base image
FROM node:18

# Set working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy all files
COPY . .

# Expose the port expected by Cloud Run
EXPOSE 8080

# Start the app
CMD ["npm", "start"]
