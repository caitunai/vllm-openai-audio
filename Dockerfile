FROM nvidia/cuda:12.9.1-devel-ubuntu24.04

# 设置环境变量，避免交互式安装阻塞
ENV DEBIAN_FRONTEND=noninteractive
ENV TORCH_CUDA_ARCH_LIST="8.9;9.0;10.0;11.0;12.0+PTX"

RUN apt-get update && apt-get install -y \
    python3.12 \
    python3.12-dev \
    python3-pip \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/python3.12 /usr/bin/python \
    && wget -qO- https://astral.sh/uv/install.sh | sh \
    && . $HOME/.local/bin/env \
    && uv venv \
    && . .venv/bin/activate \
    && uv pip install -U --pre --no-cache-dir vllm torch torchaudio --extra-index-url https://download.pytorch.org/whl/cu129 --extra-index-url https://wheels.vllm.ai/nightly/cu129 --index-strategy unsafe-best-match \
    && uv pip install --no-cache-dir "vllm[audio]" \
    && which vllm

ENV PATH="/.venv/bin:$PATH"
ENV VIRTUAL_ENV="/.venv"

EXPOSE 8000

ENTRYPOINT ["vllm", "serve"]
