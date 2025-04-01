# Use Node.js base image
FROM node:18

# Set working directory inside the container
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app files
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Run the app
CMD ["npm", "start"]
