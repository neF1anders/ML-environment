#!/bin/bash
# Starting the container

cd "$(dirname "$0")/../.."

if [ -f "configs/secrets.txt" ]; then
    source configs/secrets.txt
else
    echo "⚠️  File configs/secrets.txt not found!"
    echo "Check configs/secrets.example.txt"
    exit 1
fi

: "${HOST_WORKSPACE:?Projects folder not found in secrets.txt}"
: "${CONTAINER_NAME:?Container name not found}"
IMAGE_NAME="ml-environment:latest"

echo "🚀 Starting container..."


docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm $CONTAINER_NAME 2>/dev/null || true

# New
docker run -d \
    --gpus all \
    --name $CONTAINER_NAME \
    --hostname ml-devbox \
    -p ${PORT_JUPYTER:-8888}:8888 \
    -p 8501:8501 \
    -v ${HOST_WORKSPACE}:/workspace \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    --ipc=host \
    --restart unless-stopped \
    $IMAGE_NAME

echo "✅ Started: $CONTAINER_NAME"
echo "🌐 Jupyter: http://localhost:${PORT_JUPYTER:-8888}"
echo "📁 Host Folder: ${HOST_WORKSPACE} -> /workspace"
echo ""
echo "Commands:"
echo "  Enter: docker exec -it $CONTAINER_NAME bash"
echo "  Logs: docker logs -f $CONTAINER_NAME"
echo "  Stop: docker stop $CONTAINER_NAME"