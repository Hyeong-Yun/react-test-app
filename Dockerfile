# Use an official Node.js runtime as the base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the application code to the working directory
COPY . .

# Build the React application
RUN npm run build

# Install serve globally to run the application
RUN npm install -g serve

# Set the command to run when the container starts
CMD ["serve", "-s", "build"]

# Expose the port that the application listens on
EXPOSE 5000