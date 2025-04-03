# SIT737 – Task 5.1P  
**Containerising a Node.js Application using Docker & Docker Compose**

## Introduction

This repository contains the completed work for **Task 5.1P** of the unit **SIT737 – Cloud Native Application Development**. The purpose of this task was to containerise a simple Node.js web application using **Docker** and **Docker Compose**, and implement a **health check** to make the container resilient and cloud-native-ready.

The task was completed entirely through the terminal and VS Code without using any frameworks or automation tools outside the scope of the assignment.

---

## ⚙️ Technologies Used

- Node.js (v18)
- Express.js
- Docker
- Docker Compose
- curl (used in the health check)
- Visual Studio Code (IDE)
- Git & GitHub (version control & submission)

---

## 📁 Project Structure

sit737-app/ ├── index.js # Main Node.js app ├── package.json # App metadata and dependencies ├── Dockerfile # Instructions to build the Docker image ├── docker-compose.yml # Compose configuration + health check ├── README.md # This file (task documentation) └── DOCUMENTATION.md # Step-by-step development & screenshot explanations




---

## 🚀 Step-by-Step Development

### 1. Initial Setup

- A folder `sit737-app` was created on the desktop.
- Initialized Node.js app using `npm init -y`
- Installed Express.js via `npm install express`

---

### 2. App Code (`index.js`)

The app responds to a basic HTTP GET request at the root path:

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
3. Dockerfile Creation
dockerfile


FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
Builds from Node.js base image

Copies source files and installs dependencies

Exposes port 3000 and starts the app

4. Docker Compose Setup

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
Maps container port 3000 to local port 3004

Adds health check to automatically detect and recover from failure

Restarts the container if it becomes unhealthy

5. Run & Test

docker-compose up --build
Then I opened the app in the browser:

👉 http://localhost:3004

✅ Output:

csharp

Hello from Dockerized Node.js app!
🧪 Health Check Logic
Runs every 30 seconds

Fails if the service doesn't respond within 10 seconds

Restarts after 3 failures

This simulates how containers are monitored and restarted in real-world cloud deployments.
