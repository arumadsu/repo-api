#!/bin/bash

echo "📥 Pulling latest code..."
git pull origin main

echo "🐳 Building Docker containers..."
docker compose build

echo "🚀 Starting containers..."
docker compose up -d

echo "✅ Deployment finished!"
