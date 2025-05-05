#!/bin/bash
set -eo pipefail

# Print what we're doing
echo "Building web application for IPFS deployment..."

# Clean any previous builds
rm -rf dist ipfs-build

# Move to the web app directory
cd apps/web

# Ensure necessary directories exist
mkdir -p src/utils/__generated__
touch src/utils/__generated__/.gitkeep

# Install dependencies if needed
echo "Installing web app dependencies..."
yarn install

# Build the app
echo "Building the app..."
export NODE_OPTIONS="--max-old-space-size=4096"
export CI=false
export DISABLE_ESLINT_PLUGIN=true
export SKIP_PREFLIGHT_CHECK=true

# Build command - adjust according to your actual build command
yarn build || npm run build

# Check if build was successful
if [ ! -d "build" ]; then
  echo "Error: Build failed! No build directory created."
  exit 1
fi

# Create a directory for IPFS deployment at the root level
cd ../..
mkdir -p ipfs-build

# Copy build files to the IPFS build directory
echo "Copying build files to ipfs-build directory..."
cp -r apps/web/build/* ipfs-build/

# Verify that index.html exists in the IPFS build directory
if [ ! -f "ipfs-build/index.html" ]; then
  echo "Error: No index.html found in the build output. IPFS deployment will not work correctly."
  exit 1
fi

echo "Build for IPFS completed successfully!"
echo "The files in ./ipfs-build/ are ready to be uploaded to IPFS."
echo "IMPORTANT: Upload ONLY the contents of the ipfs-build directory to IPFS."
echo "           Do not upload the entire project directory!" 