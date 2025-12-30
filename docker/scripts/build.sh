#!/bin/bash
# Скрипт сборки Docker образа

set -e  # Остановиться при ошибке

cd "$(dirname "$0")/../.."  # Переходим в корень проекта

echo "🔨 Building image..."

# Параметры сборки
IMAGE_NAME="ml-environment"
IMAGE_TAG="latest"

# Сборка
docker build \
    -t ${IMAGE_NAME}:${IMAGE_TAG} \
    -f docker/Dockerfile .

echo "✅ Image is built: ${IMAGE_NAME}:${IMAGE_TAG}"
echo "📦 Size: $(docker images ${IMAGE_NAME}:${IMAGE_TAG} --format "{{.Size}}")"