#!/bin/bash

PORT=${PORT_JUPYTER:-8888}

echo "======================================"
echo "🚀 Starting ML Environment"
echo "📡 Jupyter Lab on port: $PORT"
echo "🐍 Python: $(python --version)"
echo "🔥 PyTorch: $(python -c "import torch; print(torch.__version__)")"
echo "🎮 CUDA is available = : $(python -c "import torch; print(torch.cuda.is_available())")"
echo "======================================"

exec jupyter lab \
    --allow-root \
    --ip=0.0.0.0 \
    --port=$PORT \
    --no-browser \
    --NotebookApp.token='' \
    --NotebookApp.password='' \
    --NotebookApp.notebook_dir='/workspace'