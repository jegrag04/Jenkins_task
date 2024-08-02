#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting Maven build..."

# Run Maven clean and package
mvn clean package

echo "Build completed successfully."
