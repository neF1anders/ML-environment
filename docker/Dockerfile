# ========================================
# AI DEVELOPMENT ENVIRONMENT
# Воспроизводимая среда для ML/DL экспериментов
# ========================================
ARG PYTORCH_VERSION="2.3.0"
ARG CUDA_VERSION="12.1"

FROM pytorch/pytorch:${PYTORCH_VERSION}-cuda${CUDA_VERSION}-cudnn8-runtime

LABEL maintainer="ne_flanders https://github.com/neF1anders"
LABEL description="Personal ML Environment"
LABEL version="1.0"

RUN apt-get update && apt-get install -y \
    git wget curl htop nano vim \
    zip unzip build-essential \
    # OpenCV зависимости:
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

COPY docker/requirements /tmp/requirements

RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r /tmp/requirements/full.txt

WORKDIR /workspace

COPY docker/scripts/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Настройка Jupyter
RUN jupyter lab --generate-config && \
    mkdir -p /root/.jupyter/lab/user-settings/@jupyterlab/apputils-extension

# Копируем конфиги
COPY configs/bash/.bashrc_additions /root/
RUN cat /root/.bashrc_additions >> /root/.bashrc && rm /root/.bashrc_additions

# Проброс портов Jupyter, TensorBoard
ARG PORT_JUPYTER=8888
EXPOSE ${PORT_JUPYTER}  


# HEALTHCHECK (опционально)
#HEALTHCHECK --interval=300s --timeout=15s --start-period=30s --retries=3 \
#    CMD python -c "import torch; exit(0 if torch.cuda.is_available() else 1)"

CMD ["entrypoint.sh"]