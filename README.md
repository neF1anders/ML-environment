# ML Development Environment

Воспроизводимая среда для Machine Learning и Deep Learning на базе Docker с поддержкой CUDA.

## 🚀 Быстрый старт

### 1. Предварительные требования
- Docker и Docker Compose
- NVIDIA GPU с драйверами
- NVIDIA Container Toolkit

### 2. Настройка
```bash
# Клонировать репозиторий
git clone https://github.com/neF1anders/ML-environment.git ml-environment
cd ml-environment

# Настроить окружение
cp configs/secrets.example.txt configs/secrets.txt
# Отредактируйте configs/secrets.txt - укажите путь к вашим проектам
