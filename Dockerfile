ARG VLLM_TAG=v0.19.0-cu130

FROM vllm/vllm-openai:${VLLM_TAG}-ubuntu2404

RUN apt-get update && apt-get install -y sox ffmpeg \
    && rm -rf /var/lib/apt/lists/* \
    && uv pip install --system --no-cache-dir vllm-omni "vllm[audio]"
