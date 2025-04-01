# SIT737 - Task 5.1P: Dockerising a Node.js Web Application


This README explains everything I did for Task 5.1P of SIT737 – Cloud Native Application Development. The main goal of this task was to containerise a simple web application using Docker and Docker Compose, and also implement a health check to monitor its status.

---

## 🔧 Tools and Setup

To begin with, I ensured the following tools were installed and working:
- Node.js and npm
- Docker Desktop
- Visual Studio Code
- Git and GitHub

I created a new folder named `sit737-app` on my desktop, and initialized a basic Node.js web application using Express.

---

## 🚀 Creating the Web Application

I wrote a very simple Express.js application that responds with a message at the root (`/`) route.

Here is the code I wrote in `index.js`:

```js
const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
  res.send('Hello from Dockerized Node.js app!');
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
Then I edited package.json to include a "start" script like this:

json
"scripts": {
  "start": "node index.js"
}
After this, I tested the app locally using npm start to make sure it worked.

Writing the Dockerfile
To containerise the app, I created a Dockerfile with the following content:

dockerfile
FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
This Dockerfile sets up Node, installs the app dependencies, and runs the app.

Building and Running the Docker Image
I built the Docker image using:


docker build -t sit737-app .
Then I ran the container like this:


docker run -p 3004:3000 sit737-app
I used port 3004 instead of 3000 because port 3000 was already in use. When I visited http://localhost:3004, I saw the message:

Hello from Dockerized Node.js app!

So the container was working correctly!

Setting Up Docker Compose with Health Check
Next, I wrote a docker-compose.yml file to simplify running the app and include a health check feature:

yaml
version: '3.8'

services:
  web:
    build: .
    ports:
      - "3004:3000"
    restart: always
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000"]
      interval: 30s
      timeout: 10s
      retries: 3
This file builds the image, maps the ports, and checks if the app is healthy using curl. If the health check fails, Docker will automatically restart the container.

I ran everything using:


docker-compose up --build

Health Check Result:
After adding the health check, Docker Compose automatically monitored the application. If I force stopped the app, Docker would detect the failed state and restart it. This made the system more resilient.

GitHub Repository :
Finally, I pushed all the code to GitHub in a public repository named: 👉 sit737-2025-prac5p

GitHub URL :
https://github.com/sarthak022602/sit737-2025-prac5p

I used these Git commands:


git init
git add .
git commit -m "Dockerised Node.js app with health check"
git branch -M main
git remote add origin https://github.com/sarthak022602/sit737-2025-prac5p.git
git push -u origin main

Summary

To summarise:

I created a simple Express app

Dockerised it using a Dockerfile

Built and tested the container on port 3004

Created a Docker Compose file with health checks

Verified automatic restarts on health check failure

Uploaded everything to GitHub with clear structure