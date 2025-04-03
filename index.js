const express = require('express');
const app = express();
const PORT = process.env.PORT || 8080;

// Root route
app.get('/', (req, res) => {
  res.send('✅ Hello from Dockerized Node.js app running on Cloud Run!');
});

// Catch-all route
app.use((req, res) => {
  res.status(404).send('❌ Route not found. Please visit `/`');
});

app.listen(PORT, () => {
  console.log(`✅ Server is running on http://localhost:${PORT}`);
});
